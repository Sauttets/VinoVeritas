import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:vinoveritas/src/services/persistence_service/IsarServiceInterface.dart';
import 'package:vinoveritas/src/services/persistence_service/entitis/settings.dart';
import 'package:vinoveritas/src/services/persistence_service/entitis/user.dart';

class IsarService implements IsarServiceInterface {
  late Future<Isar> db;

  IsarService() {
    db = openDB();
  }

  Future<Isar> openDB() async {
    final dir = await getApplicationDocumentsDirectory();
    if (Isar.instanceNames.isEmpty) {
      return await Isar.open(
        [UserSchema, SettingsSchema],
        inspector: true,
        directory: dir.path,
      );
    }
    return Future.value(Isar.getInstance());
  }

  @override
  Future<int> addUser(String name, String shareCode) async {
    final isar = await db;
    final user = User(name: name, shareCode: shareCode);
    return isar.writeTxnSync<int>(() => isar.users.putSync(user));
  }

  @override
  Future<void> updateUser(
      int id, String? name, int? plz, double? radius, int? colorMode) async {
    final isar = await db;
    final user = await isar.users.get(id);
    if (user != null) {
      await isar.writeTxn(() async {
        if (name != null) {
          user.name = name;
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
  Future<void> deleteUser(int id) async {
    final isar = await db;
    await isar.writeTxn(() async {
      await isar.users.delete(id);
    });
  }

  
 

  @override
  Future<String> getUserName(int id) async {
    final isar = await db;
    return isar.users.get(id).then((value) => value!.name);
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
}
