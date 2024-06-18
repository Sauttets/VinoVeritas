import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'settings_model.freezed.dart';
part 'settings_model.g.dart';

@freezed
class SettingsModel with _$SettingsModel {
  const factory SettingsModel({
    @Default('user') String username,
    @Default('') String location,
    @Default(0) double radius,
    @Default(0) int designIndex,
    @Default('') String shareFavoritesCodeIdentifier,
    @Default('friends favorites') String listNameToImport,
    @Default('') String importCode,
  }) = _SettingsModel;

  factory SettingsModel.fromJson(Map<String, dynamic> json) =>
      _$SettingsModelFromJson(json);
}
