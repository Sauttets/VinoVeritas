part of 'settings_bloc.dart';

@freezed
class SettingsEvent with _$SettingsEvent {
  const factory SettingsEvent.selectIndex(int index) = SelectIndex;
  // Define other events here
}
