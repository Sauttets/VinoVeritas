import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:isar/isar.dart';
import 'package:vinoveritas/src/services/persistence_service/entitis/settings.dart';

part 'settings_model.freezedimportent.dart';

@freezed
class SettingsModel with _$SettingsModel {
  const factory SettingsModel({
    @Default(0) String id,
    @Default('NoUser') String username,
    @Default(0000) int plz,
    double? radius,
    @Default(0) int colorMode,
    @Default('NoUser') String shareCode,
  }) = _SettingsModel;

  // Convert SettingsModel to Settings (Isar object) as an instance method
  Settings toIsarSettings() {
    final settings = Settings()
      ..id = id as Id
      ..username = username
      ..plz = plz
      ..radius = radius ?? 5.0
      ..colorMode = colorMode
      ..shareCode = shareCode;
    // Handle IsarLink<FavListe> fields separately if needed
    return settings;
  }

  // Factory constructor to create a SettingsModel from a Settings instance
  factory SettingsModel.fromIsarSettings(Settings settings) {
    return SettingsModel(
      id: settings.id.toString(),
      username: settings.username,
      plz: settings.plz,
      shareCode: settings.shareCode,
      // Continue if needed.
    );
  }
}
