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

  Settings toIsarSettings() {
    final settings = Settings()
      ..id = id as Id
      ..username = username
      ..plz = plz
      ..radius = radius ?? 5.0
      ..colorMode = colorMode
      ..shareCode = shareCode;
    return settings;
  }

  factory SettingsModel.fromIsarSettings(Settings settings) {
    return SettingsModel(
      id: settings.id.toString(),
      username: settings.username,
      plz: settings.plz,
      shareCode: settings.shareCode,
    );
  }
}
