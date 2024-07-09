import 'package:vinoveritas/src/services/persistence_service/entitis/settings.dart';

abstract class IsarServiceInterface {
  //Comunicate with the backend to create a new user and save the user settings in the local database
  Future<String> addUserSettings(String username);
  //Save the user settings in the local database
  Future<Settings?> saveSettings(Settings settings);
  //Get the user settings from the local database
  Future<Settings?> getSettings();
  //Update the user settings in the local database
  Future<void> updateSettings(
      int id, String? name, int? plz, double? radius, int? colorMode);
  //Get the user name from the local database
  Future<String> getUserName();
  //Get the user id from the local database
  Future<int> getID();

  //Add a new shared list to the local database
  Future<void> addSharedList(String name, String shareCode);
  //Get all shared lists Names from the local database
  Future<List<String>> getAllSharedNames();
  //Get the share code from a shared list by name
  Future<String> getSharedCodeFrom(String name);
  Future<bool> isDatabaseEmpty();
}
