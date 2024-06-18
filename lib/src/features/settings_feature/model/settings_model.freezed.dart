// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'settings_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SettingsModel _$SettingsModelFromJson(Map<String, dynamic> json) {
  return _SettingsModel.fromJson(json);
}

/// @nodoc
mixin _$SettingsModel {
  String get username => throw _privateConstructorUsedError;
  String get location => throw _privateConstructorUsedError;
  double get radius => throw _privateConstructorUsedError;
  int get designIndex => throw _privateConstructorUsedError;
  String get shareFavoritesCodeIdentifier => throw _privateConstructorUsedError;
  String get listNameToImport => throw _privateConstructorUsedError;
  String get importCode => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SettingsModelCopyWith<SettingsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SettingsModelCopyWith<$Res> {
  factory $SettingsModelCopyWith(
          SettingsModel value, $Res Function(SettingsModel) then) =
      _$SettingsModelCopyWithImpl<$Res, SettingsModel>;
  @useResult
  $Res call(
      {String username,
      String location,
      double radius,
      int designIndex,
      String shareFavoritesCodeIdentifier,
      String listNameToImport,
      String importCode});
}

/// @nodoc
class _$SettingsModelCopyWithImpl<$Res, $Val extends SettingsModel>
    implements $SettingsModelCopyWith<$Res> {
  _$SettingsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? username = null,
    Object? location = null,
    Object? radius = null,
    Object? designIndex = null,
    Object? shareFavoritesCodeIdentifier = null,
    Object? listNameToImport = null,
    Object? importCode = null,
  }) {
    return _then(_value.copyWith(
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
      radius: null == radius
          ? _value.radius
          : radius // ignore: cast_nullable_to_non_nullable
              as double,
      designIndex: null == designIndex
          ? _value.designIndex
          : designIndex // ignore: cast_nullable_to_non_nullable
              as int,
      shareFavoritesCodeIdentifier: null == shareFavoritesCodeIdentifier
          ? _value.shareFavoritesCodeIdentifier
          : shareFavoritesCodeIdentifier // ignore: cast_nullable_to_non_nullable
              as String,
      listNameToImport: null == listNameToImport
          ? _value.listNameToImport
          : listNameToImport // ignore: cast_nullable_to_non_nullable
              as String,
      importCode: null == importCode
          ? _value.importCode
          : importCode // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SettingsModelImplCopyWith<$Res>
    implements $SettingsModelCopyWith<$Res> {
  factory _$$SettingsModelImplCopyWith(
          _$SettingsModelImpl value, $Res Function(_$SettingsModelImpl) then) =
      __$$SettingsModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String username,
      String location,
      double radius,
      int designIndex,
      String shareFavoritesCodeIdentifier,
      String listNameToImport,
      String importCode});
}

/// @nodoc
class __$$SettingsModelImplCopyWithImpl<$Res>
    extends _$SettingsModelCopyWithImpl<$Res, _$SettingsModelImpl>
    implements _$$SettingsModelImplCopyWith<$Res> {
  __$$SettingsModelImplCopyWithImpl(
      _$SettingsModelImpl _value, $Res Function(_$SettingsModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? username = null,
    Object? location = null,
    Object? radius = null,
    Object? designIndex = null,
    Object? shareFavoritesCodeIdentifier = null,
    Object? listNameToImport = null,
    Object? importCode = null,
  }) {
    return _then(_$SettingsModelImpl(
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
      radius: null == radius
          ? _value.radius
          : radius // ignore: cast_nullable_to_non_nullable
              as double,
      designIndex: null == designIndex
          ? _value.designIndex
          : designIndex // ignore: cast_nullable_to_non_nullable
              as int,
      shareFavoritesCodeIdentifier: null == shareFavoritesCodeIdentifier
          ? _value.shareFavoritesCodeIdentifier
          : shareFavoritesCodeIdentifier // ignore: cast_nullable_to_non_nullable
              as String,
      listNameToImport: null == listNameToImport
          ? _value.listNameToImport
          : listNameToImport // ignore: cast_nullable_to_non_nullable
              as String,
      importCode: null == importCode
          ? _value.importCode
          : importCode // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SettingsModelImpl
    with DiagnosticableTreeMixin
    implements _SettingsModel {
  const _$SettingsModelImpl(
      {this.username = 'user',
      this.location = '',
      this.radius = 0,
      this.designIndex = 0,
      this.shareFavoritesCodeIdentifier = '',
      this.listNameToImport = 'friends favorites',
      this.importCode = ''});

  factory _$SettingsModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$SettingsModelImplFromJson(json);

  @override
  @JsonKey()
  final String username;
  @override
  @JsonKey()
  final String location;
  @override
  @JsonKey()
  final double radius;
  @override
  @JsonKey()
  final int designIndex;
  @override
  @JsonKey()
  final String shareFavoritesCodeIdentifier;
  @override
  @JsonKey()
  final String listNameToImport;
  @override
  @JsonKey()
  final String importCode;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SettingsModel(username: $username, location: $location, radius: $radius, designIndex: $designIndex, shareFavoritesCodeIdentifier: $shareFavoritesCodeIdentifier, listNameToImport: $listNameToImport, importCode: $importCode)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SettingsModel'))
      ..add(DiagnosticsProperty('username', username))
      ..add(DiagnosticsProperty('location', location))
      ..add(DiagnosticsProperty('radius', radius))
      ..add(DiagnosticsProperty('designIndex', designIndex))
      ..add(DiagnosticsProperty(
          'shareFavoritesCodeIdentifier', shareFavoritesCodeIdentifier))
      ..add(DiagnosticsProperty('listNameToImport', listNameToImport))
      ..add(DiagnosticsProperty('importCode', importCode));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SettingsModelImpl &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.radius, radius) || other.radius == radius) &&
            (identical(other.designIndex, designIndex) ||
                other.designIndex == designIndex) &&
            (identical(other.shareFavoritesCodeIdentifier,
                    shareFavoritesCodeIdentifier) ||
                other.shareFavoritesCodeIdentifier ==
                    shareFavoritesCodeIdentifier) &&
            (identical(other.listNameToImport, listNameToImport) ||
                other.listNameToImport == listNameToImport) &&
            (identical(other.importCode, importCode) ||
                other.importCode == importCode));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, username, location, radius,
      designIndex, shareFavoritesCodeIdentifier, listNameToImport, importCode);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SettingsModelImplCopyWith<_$SettingsModelImpl> get copyWith =>
      __$$SettingsModelImplCopyWithImpl<_$SettingsModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SettingsModelImplToJson(
      this,
    );
  }
}

abstract class _SettingsModel implements SettingsModel {
  const factory _SettingsModel(
      {final String username,
      final String location,
      final double radius,
      final int designIndex,
      final String shareFavoritesCodeIdentifier,
      final String listNameToImport,
      final String importCode}) = _$SettingsModelImpl;

  factory _SettingsModel.fromJson(Map<String, dynamic> json) =
      _$SettingsModelImpl.fromJson;

  @override
  String get username;
  @override
  String get location;
  @override
  double get radius;
  @override
  int get designIndex;
  @override
  String get shareFavoritesCodeIdentifier;
  @override
  String get listNameToImport;
  @override
  String get importCode;
  @override
  @JsonKey(ignore: true)
  _$$SettingsModelImplCopyWith<_$SettingsModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
