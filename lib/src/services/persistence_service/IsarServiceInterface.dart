import 'package:vinoveritas/src/services/persistence_service/entitis/settings.dart';

abstract class IsarServiceInterface {
  //Settings_functions
  Future<Settings?> saveSettings(Settings settings);
  Future<Settings?> getSettings();
  Future<int> addUser(String name, String shareCode);
  Future<void> deleteUser(int id);
  Future<void> updateUser(
      int id, String? name, int? plz, double? radius, int? colorMode);

  Future<String> getUserName(int id);
  Future<int> getID();
}
