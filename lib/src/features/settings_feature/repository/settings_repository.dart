import 'package:vinoveritas/src/features/settings_feature/model/settings_model.dart';
import 'package:vinoveritas/src/services/persistence_service/IsarService.dart';
import 'package:vinoveritas/src/services/persistence_service/IsarServiceInterface.dart';
import 'package:vinoveritas/src/services/persistence_service/entitis/settings.dart';

class SettingsRepository {
  final IsarServiceInterface _isarService = IsarService();
  late SettingsModel settingsModel = const SettingsModel();

  SettingsRepository();

  Future<SettingsModel> loadSettingsModel() async {
    Settings? settingsIsar = await _isarService.getSettings();
    settingsModel = SettingsModel.fromIsarSettings(settingsIsar!);

    return settingsModel;
  }
}
