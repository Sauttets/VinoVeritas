import 'package:http/http.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:vinoveritas/src/features/home_favorite_feature/model/favlist_tupel.dart';
import 'package:vinoveritas/src/services/persistence_service/entitis/settings.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:vinoveritas/src/services/persistence_service/isar_service_interface.dart';

class IsarService implements IsarServiceInterface {
  late Future<Isar> db;

  IsarService() {
    db = openDB();
  }

  Future<Isar> openDB() async {
    final dir = await getApplicationDocumentsDirectory();
    if (Isar.instanceNames.isEmpty) {
      return await Isar.open(
        [SettingsSchema],
        directory: dir.path,
      );
    }
    return Future.value(Isar.getInstance());
  }

  @override
  Future<bool> isDatabaseEmpty() async {
    final isar = await db;
    final count = await isar.settings.count();
    return count == 0;
  }

  @override
  Future<String> addUserSettings(String username) async {
    try {
      final response = await http.post(
        Uri.parse('https://api.gargelkarg.com/newUser?username=$username'),
      );

      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);

        final userId = jsonResponse['id'];
        final userShareCode = jsonResponse['shareCode'];

        final isar = await db;
        await isar.writeTxn(() async {
          await isar.settings.put(Settings()
            ..id = userId as int
            ..username = username
            ..shareCode = userShareCode as String);
        });

        return userShareCode as String;
      } else {
        throw Exception('Failed to create user');
      }
    } on ClientException catch (e) {
      throw Exception('Network error: ${e.message}');
    }
  }

  @override
  Future<Settings> saveSettings(Settings settings) async {
    final isar = await db;
    await isar.writeTxn(() async {
      final Settings? currentSettings = await isar.settings.where().findFirst();
      if (currentSettings != null && currentSettings.sharedWith.isNotEmpty) {
        settings.sharedWith.addAll(currentSettings.sharedWith);
      }

      await isar.settings.clear();
      await isar.settings.put(settings);
    });
    return settings;
  }

  @override
  Future<Settings?> getSettings() async {
    final isar = await db;
    final settings = await isar.settings.where().findFirst();
    return settings;
  }

  @override
  Future<int> getID() async {
    final isar = await db;
    final user = await isar.settings.where().findFirst();

    if (user != null) {
      return user.id;
    } else {
      throw Exception('No user found in the database');
    }
  }

  @override
  Future<String> getUserName() async {
    final isar = await db;
    final id = await getID();
    final user = await isar.settings.get(id);

    if (user != null) {
      return user.username;
    } else {
      throw Exception('User not found');
    }
  }

  @override
  Future<void> addSharedList(String name, String shareCode) async {
    final isar = await db;
    final id = await getID();
    final user = await isar.settings.get(id);

    if (user != null) {
      await isar.writeTxn(() async {
        final newList = List<Sharedlist>.from(user.sharedWith)
          ..add(Sharedlist()
            ..name = name
            ..shareCode = shareCode);
        user.sharedWith = newList;
        await isar.settings.put(user);
      });
    } else {
      throw Exception('User not found');
    }
  }

  @override
  Future<List<FavlistTupel>> getSharedLists() async {
    final isar = await db;
    final id = await getID();
    final user = await isar.settings.get(id);

    if (user == null) {
      return [];
    }

    return user.sharedWith
        .map((shared) =>
            FavlistTupel(shareCode: shared.shareCode, name: shared.name))
        .toList();
  }
}