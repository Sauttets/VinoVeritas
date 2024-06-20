part of 'settings_cubit.dart';

abstract class SettingsCubitState {}

class Initial extends SettingsCubitState {}

class SettingUsername extends SettingsCubitState {
  final String username;
  SettingUsername(this.username);
}

class SettingLocation extends SettingsCubitState {
  final String location;
  SettingLocation(this.location);
}

class SettingDesign extends SettingsCubitState {
  final int designIndex;
  SettingDesign(this.designIndex);
}
