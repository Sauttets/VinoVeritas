import 'package:bloc/bloc.dart';
import 'package:vinoveritas/src/features/settings_feature/model/settings_model.dart';
import 'package:vinoveritas/src/features/settings_feature/repository/settings_repository.dart';

part 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  final SettingsRepository _settingsRepository = SettingsRepository();
  SettingsModel settingsModel = const SettingsModel();
  int selectedIndex = 2;

  SettingsCubit() : super(SettingsInit()) {
    loadSettings();
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
}
