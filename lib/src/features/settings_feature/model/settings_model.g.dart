// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SettingsModel _$SettingsModelFromJson(Map<String, dynamic> json) =>
    SettingsModel(
      username: json['username'] as String,
      location: json['location'] as String,
      designIndex: (json['designIndex'] as num).toInt(),
    );

Map<String, dynamic> _$SettingsModelToJson(SettingsModel instance) =>
    <String, dynamic>{
      'username': instance.username,
      'location': instance.location,
      'designIndex': instance.designIndex,
    };
