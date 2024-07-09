import 'package:get_it/get_it.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:vinoveritas/src/features/settings_feature/model/settings_model.dart';
import 'package:vinoveritas/src/services/persistence_service/IsarServiceInterface.dart';
import 'package:vinoveritas/src/services/persistence_service/entitis/settings.dart';

class SettingsRepository {
  final _isarService = GetIt.I<IsarServiceInterface>();

  SettingsRepository();

  Future<SettingsModel> loadSettingsModel() async {
    Settings? settingsIsar = await _isarService.getSettings();
    return SettingsModel.fromIsarSettings(settingsIsar!);
  }

  Future<void> saveSettingsModel(SettingsModel settingsModel) async {
    // Convert SettingsModel to Settings entity required by IsarService
    Settings settings = settingsModel.toIsarSettings();
    await _isarService.saveSettings(settings);
  }

  Future<bool> isDatabaseEmpty() async {
    bool isempty = await _isarService.isDatabaseEmpty();
    return isempty;
  }

  Future<void> registerNewUser(String username) async {
    // Assuming you have a method to register a new user in your IsarService
    // and it returns a Settings instance
    await _isarService.addUserSettings(username);
  }

  Future<void> importFavorites(String wineId, String userId) async {
    final uri = Uri.parse(
        'http://api.gargelkarg.com/AddToFavList?user_id=$userId&wine_id=$wineId');

    final response = await http.post(
      uri,
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      try {
        final responseBody = json.decode(response.body);
        print(responseBody[
            'message']); // "Wine added to favorite list successfully!"
      } catch (e) {
        print('Failed to parse response as JSON: $e');
      }
    } else {
      print('Failed to add wine to favorites: ${response.body}');
    }
  }
}
