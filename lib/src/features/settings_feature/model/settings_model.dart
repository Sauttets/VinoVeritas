import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:isar/isar.dart';
import 'package:vinoveritas/src/services/persistence_service/entitis/settings.dart';

part 'settings_model.freezed.dart';

@freezed
class SettingsModel with _$SettingsModel {
  const factory SettingsModel({
    @Default(0) String id,
    @Default('user') String username,
    @Default(71720) int plz,
    double? radius,
    @Default(0) int colorMode,
    @Default('##this is a share code##') String shareCode,
    // Note: Isar relationships like IsarLink<FavListe> cannot be directly represented in Freezed models.
    // You might need to handle these separately or convert them manually.
  }) = _SettingsModel;

  // Convert SettingsModel to Settings (Isar object) as an instance method
  Settings toIsarSettings() {
    final settings = Settings()
      ..id = int.tryParse(id) ??
          Isar.autoIncrement // Assuming `id` is a string that can be parsed to int
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
      // Continue mapping the rest of the fields...
    );
  }
}
