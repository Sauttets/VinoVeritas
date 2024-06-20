import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'settings_model.freezed.dart';
part 'settings_model.g.dart';

@freezed
@JsonSerializable()
class SettingsModel with _$SettingsModel {
  const factory SettingsModel({
    @Default('user') String username,
    @Default('nowhere') String location,
    @Default(1) int designIndex,
  }) = _SettingsModel;
}
