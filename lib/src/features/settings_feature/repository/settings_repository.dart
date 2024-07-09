import 'package:get_it/get_it.dart';
import 'package:vinoveritas/src/features/settings_feature/model/settings_model.dart';
import 'package:vinoveritas/src/services/persistence_service/isar_service_interface.dart';
import 'package:vinoveritas/src/services/persistence_service/entitis/settings.dart';

class SettingsRepository {
  final _isarService = GetIt.I<IsarServiceInterface>();

  SettingsRepository();

  Future<SettingsModel> loadSettingsModel() async {
    Settings? settingsIsar = await _isarService.getSettings();
    return SettingsModel.fromIsarSettings(settingsIsar!);
  }

  Future<void> saveSettingsModel(SettingsModel settingsModel) async {
    Settings settings = settingsModel.toIsarSettings();
    await _isarService.saveSettings(settings);
  }

  Future<bool> isDatabaseEmpty() async {
    bool isempty = await _isarService.isDatabaseEmpty();
    return isempty;
  }

  Future<void> registerNewUser(String username) async {
    await _isarService.addUserSettings(username);
    SettingsModel settingsModeltmp = await loadSettingsModel();
    String tmpShareCode = settingsModeltmp.shareCode;
    _isarService.addSharedList(username, tmpShareCode);
  }

  Future<void> importFavorites(String listName, String shareCode) async {
    _isarService.addSharedList(listName, shareCode);
  }
}
