import 'package:http/http.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:vinoveritas/src/services/persistence_service/IsarServiceInterface.dart';
import 'package:vinoveritas/src/services/persistence_service/entitis/settings.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

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
        inspector: true,
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

        // Print the entire response body or specific parts of it
        print(
            'Server response: ${response.body}'); // For debugging: prints the entire response body

        final userId = jsonResponse['id'];
        final userShareCode = jsonResponse['shareCode'];

        // Assuming the server includes a 'message' field in the successful response
        print(
            'Server message: ${jsonResponse['message']}'); // This line prints the message
        final isar = await db;
        await isar.writeTxn(() async {
          await isar.settings.put(Settings()
            ..id = userId
            ..username = username
            ..shareCode = userShareCode);
        });

        return userShareCode;
      } else {
        throw Exception('Failed to create user');
      }
    } on ClientException catch (e) {
      // Handle the ClientException, possibly by logging or notifying the user
      print('Failed to connect to the server: $e');
      throw Exception('Network error: Unable to connect to the server.');
    }
  }

  @override
  Future<void> updateSettings(
      int id, String? name, int? plz, double? radius, int? colorMode) async {
    final isar = await db;
    final user = await isar.settings.get(id);
    if (user != null) {
      await isar.writeTxn(() async {
        if (name != null) {
          user.username = name;
        }
        if (plz != null) {
          user.plz = plz;
        }
        if (radius != null) {
          user.radius = radius;
        }
        if (colorMode != null) {
          user.colorMode = colorMode;
        }
      });
    } else {
      throw Exception('User with id $id not found');
    }
  }

  @override
  Future<Settings?> saveSettings(Settings settings) async {
    final isar = await db;
    await isar.writeTxn(() async {
      // Lösche alle vorhandenen Settings, bevor du neue speicherst.
      await isar.settings.clear();
      // Speichere das neue Settings-Objekt.
      await isar.settings.put(settings);
    });
    return settings;
  }

  @override
  Future<Settings?> getSettings() async {
    final isar = await db;
    // Da wir sicherstellen, dass immer nur ein Settings-Objekt gespeichert wird,
    // können wir das erste Objekt aus der Datenbank abrufen.
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
        user.sharedWith.add(Sharedlist()
          ..name = name
          ..shareCode = shareCode);
        await isar.settings
            .put(user); // Sicherstellen, dass die Änderungen gespeichert werden
      });
    } else {
      throw Exception('User not found');
    }
  }

  @override
  Future<List<String>> getAllSharedNames() async {
    final isar = await db;
    final id = await getID();
    final user = await isar.settings.get(id);

    if (user != null) {
      return user.sharedWith.map((entry) => entry.name).toList();
    } else {
      return [];
    }
  }

  @override
  Future<String> getSharedCodeFrom(String name) async {
    final isar = await db;
    final id = await getID();
    final user = await isar.settings.get(id);

    if (user != null) {
      final entry = user.sharedWith.firstWhere((entry) => entry.name == name);
      return entry.shareCode;
    } else {
      throw Exception('User not found');
    }
  }
}
