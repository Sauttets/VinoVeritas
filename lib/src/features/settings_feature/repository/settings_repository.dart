import 'package:get_it/get_it.dart';
import 'package:vinoveritas/src/features/settings_feature/model/settings_model.dart';
import 'package:vinoveritas/src/services/persistence_service/IsarServiceInterface.dart';
import 'package:vinoveritas/src/services/persistence_service/entitis/settings.dart';

class SettingsRepository {
  final _isarService = GetIt.I<IsarServiceInterface>();

  SettingsRepository();

  Future<SettingsModel> loadSettingsModel() async {
    Settings? settingsIsar = await _isarService.getSettings();
    if (settingsIsar != null) {
      return SettingsModel.fromIsarSettings(settingsIsar);
    } else {
      // Handle the case where no settings are found. Perhaps return a default SettingsModel instance.
      return const SettingsModel();
    }
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

  Future<SettingsModel> registerNewUser(String username) async {
    // Assuming you have a method to register a new user in your IsarService
    // and it returns a Settings instance
    int id = await _isarService.addUserSettings(username);
    SettingsModel newUser = SettingsModel(
      id: id.toString(),
      username: username,
      shareCode: 0.toString(),
    );
    Settings settings = newUser.toIsarSettings();
    await _isarService.saveSettings(settings);
    Settings? settingsIsar = await _isarService.getSettings();
    if (settingsIsar != null) {
      return SettingsModel.fromIsarSettings(settingsIsar);
    } else {
      // Handle the case where no settings are found. Perhaps return a default SettingsModel instance.
      return const SettingsModel();
    }
  }
}
