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

  void updateSelectedIndex(int index) {
    // Assuming `settings` is your current settings model instance
    final SettingsModel = settingsModel.copyWith(colorMode: index);

    // Optionally, save the updatedSettings to a persistent storage

    // Emit a new state with the updated settings model
    emit(ShowSettings(
        SettingsModel)); // Adjust according to your actual state class
  }

  Future<void> loadSettings() async {
    try {
      final settingsModel = await _settingsRepository.loadSettingsModel();
      emit(ShowSettings(settingsModel));
    } catch (e) {
      // Handle error, possibly emit an error state
    }
  }
}
