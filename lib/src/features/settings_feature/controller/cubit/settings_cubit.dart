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
    final updatedSettingsModel = settingsModel.copyWith(colorMode: index);

    await _settingsRepository.saveSettingsModel(updatedSettingsModel);
    settingsModel = updatedSettingsModel;

    emit(ShowSettings(
        settingsModel));
  }

  Future<void> loadSettings() async {
    try {
      settingsModel = await _settingsRepository.loadSettingsModel();
      emit(ShowSettings(settingsModel));
    } catch (e) {
      // Handle error
    }
  }

  Future<void> saveSettings(SettingsModel newSettingsModel) async {
    try {
      await _settingsRepository.saveSettingsModel(newSettingsModel);

      settingsModel = newSettingsModel;

      emit(ShowSettings(settingsModel));
    } catch (e) {
      // Handle error
    }
  }
}
