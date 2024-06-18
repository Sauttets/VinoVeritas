// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SettingsModelImpl _$$SettingsModelImplFromJson(Map<String, dynamic> json) =>
    _$SettingsModelImpl(
      username: json['username'] as String? ?? 'user',
      location: json['location'] as String? ?? '',
      radius: (json['radius'] as num?)?.toDouble() ?? 0,
      designIndex: (json['designIndex'] as num?)?.toInt() ?? 0,
      shareFavoritesCodeIdentifier:
          json['shareFavoritesCodeIdentifier'] as String? ?? '',
      listNameToImport:
          json['listNameToImport'] as String? ?? 'friends favorites',
      importCode: json['importCode'] as String? ?? '',
    );

Map<String, dynamic> _$$SettingsModelImplToJson(_$SettingsModelImpl instance) =>
    <String, dynamic>{
      'username': instance.username,
      'location': instance.location,
      'radius': instance.radius,
      'designIndex': instance.designIndex,
      'shareFavoritesCodeIdentifier': instance.shareFavoritesCodeIdentifier,
      'listNameToImport': instance.listNameToImport,
      'importCode': instance.importCode,
    };
