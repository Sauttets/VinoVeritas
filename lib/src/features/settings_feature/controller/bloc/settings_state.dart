part of 'settings_bloc.dart';

@freezed
class SettingsState with _$SettingsState {
  const factory SettingsState.initial(
      SettingsModel settings_model, int selectedIndex) = _Initial;
  const factory SettingsState.settings_set({
    required int selectedIndex,
  }) = _Loaded;
  // Add this line
  const SettingsState._();
}
