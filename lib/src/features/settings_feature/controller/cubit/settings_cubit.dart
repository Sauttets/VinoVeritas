import 'package:bloc/bloc.dart';
import 'package:vinoveritas/src/features/settings_feature/model/settings_model.dart';
import 'package:vinoveritas/src/features/settings_feature/repository/settings_repository.dart';

part 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  final SettingsRepository _settingsRepository = SettingsRepository();
  late SettingsModel settingsModel = const SettingsModel();
  int selectedIndex = 2;
  Future<bool> get isDatabaseEmpty => _settingsRepository.isDatabaseEmpty();

  SettingsCubit() : super(SettingsInit()) {
    Future<bool> loggedIn = isDatabaseEmpty;
    loggedIn.then((value) {
      if (value) {
        emit(NotLoggedIn(settingsModel));
      } else {
        loadSettings();
      }
    });
  }

  void importFavorites(String weincode, String listName) {
    _settingsRepository.importFavorites(weincode, listName);
  }

  void login(String username) async {
    await _settingsRepository.registerNewUser(username);
    loadSettings();
  }

  void updateUsername(String username) {
    final updatedSettingsModel = settingsModel.copyWith(username: username);
    saveSettings(updatedSettingsModel);
  }

  void updateLocation(int plz) {
    final updatedSettingsModel = settingsModel.copyWith(plz: plz);
    saveSettings(updatedSettingsModel);
  }

  void updateRadius(double radius) {
    final updatedSettingsModel = settingsModel.copyWith(radius: radius);
    saveSettings(updatedSettingsModel);
  }

  void updateSelectedIndex(int index) async {
    // Assuming `settings` is your current settings model instance
    final updatedSettingsModel = settingsModel.copyWith(colorMode: index);

    // Save the updatedSettings to a persistent storage
    await _settingsRepository.saveSettingsModel(updatedSettingsModel);
    // Update the local settingsModel with the updated model
    settingsModel = updatedSettingsModel;

    // Emit a new state with the updated settings model
    emit(ShowSettings(
        settingsModel)); // Adjust according to your actual state class
  }

  Future<void> loadSettings() async {
    try {
      settingsModel = await _settingsRepository.loadSettingsModel();
      emit(ShowSettings(settingsModel));
    } catch (e) {
      // Handle error, possibly emit an error state
    }
  }

  Future<void> saveSettings(SettingsModel newSettingsModel) async {
    try {
      // Save the new settings model to the repository
      await _settingsRepository.saveSettingsModel(newSettingsModel);

      // Update the local settings model with the new model
      settingsModel = newSettingsModel;

      // Emit a new state with the updated settings model
      emit(ShowSettings(settingsModel));
    } catch (e) {
      // Handle error, possibly emit an error state
      // For example: emit(SettingsError("Failed to save settings"));
    }
  }
}
