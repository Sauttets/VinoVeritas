import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:vinoveritas/src/services/persistence_service/IsarServiceInterface.dart';
import 'package:vinoveritas/src/services/persistence_service/entitis/settings.dart';
import 'package:vinoveritas/src/services/persistence_service/entitis/user.dart';
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
        [UserSchema, SettingsSchema],
        inspector: true,
        directory: dir.path,
      );
    }
    return Future.value(Isar.getInstance());
  }

  @override
Future<int> addUser(String username, String returnedUsername) async {
    final response = await http.post(
      Uri.parse('https://api.gargeklarg.com/newUser?username=$username'),
    );

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      final userId = jsonResponse['id'];
      // Hier kannst du die userId und returnedUsername weiterverarbeiten
      return userId;
    } else {
      throw Exception('Failed to create user');
    }
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
  Future<int> getID() async{
    final isar = await db;  // UserSchema durch Ihr tatsächliches Schema ersetzen
    final user = await isar.users.where().findFirst(); // 'users' durch Ihre tatsächliche Collection ersetzen

    if (user != null) {
      return user.id;
    } else {
      throw Exception('No user found in the database');
    }
    }
    
    @override
    Future<String> getUserName(int id) async {
      final isar = await db;  
      final user = await isar.users.get(id); 

      if (user != null) {
        return user.name; 
      } else {
        throw Exception('User not found');
      }
    }
}
   
