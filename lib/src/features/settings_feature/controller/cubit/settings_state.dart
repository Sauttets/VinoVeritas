part of 'settings_cubit.dart';

abstract class SettingsState {}

class SettingsInit extends SettingsState {
  int selectedIndex = 1;
  int get getselectedIndex => selectedIndex;
}

class ShowSettings extends SettingsState {
  final SettingsModel settings;
  late int selectedIndex;

  ShowSettings(this.settings) {
    selectedIndex = settings.colorMode;
  }

  String get specificVariable => settings.shareCode;
  int get getselectedIndex => settings.colorMode;
  String get getusername => settings.username;
}

class NotLoggedIn extends SettingsState {
  final SettingsModel settings;

  NotLoggedIn(this.settings);
}

class SettingsLoad extends SettingsState {
  final SettingsModel settings;

  SettingsLoad(this.settings);
}

class SettingsSave extends SettingsState {}
