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

/// @nodoc
mixin _$SettingsModel {
  String get id => throw _privateConstructorUsedError;
  String get username => throw _privateConstructorUsedError;
  int get plz => throw _privateConstructorUsedError;
  double? get radius => throw _privateConstructorUsedError;
  int get colorMode => throw _privateConstructorUsedError;
  String get shareCode => throw _privateConstructorUsedError;

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
      {String id,
      String username,
      int plz,
      double? radius,
      int colorMode,
      String shareCode});
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
    Object? id = null,
    Object? username = null,
    Object? plz = null,
    Object? radius = freezed,
    Object? colorMode = null,
    Object? shareCode = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      plz: null == plz
          ? _value.plz
          : plz // ignore: cast_nullable_to_non_nullable
              as int,
      radius: freezed == radius
          ? _value.radius
          : radius // ignore: cast_nullable_to_non_nullable
              as double?,
      colorMode: null == colorMode
          ? _value.colorMode
          : colorMode // ignore: cast_nullable_to_non_nullable
              as int,
      shareCode: null == shareCode
          ? _value.shareCode
          : shareCode // ignore: cast_nullable_to_non_nullable
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
      {String id,
      String username,
      int plz,
      double? radius,
      int colorMode,
      String shareCode});
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
    Object? id = null,
    Object? username = null,
    Object? plz = null,
    Object? radius = freezed,
    Object? colorMode = null,
    Object? shareCode = null,
  }) {
    return _then(_$SettingsModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      plz: null == plz
          ? _value.plz
          : plz // ignore: cast_nullable_to_non_nullable
              as int,
      radius: freezed == radius
          ? _value.radius
          : radius // ignore: cast_nullable_to_non_nullable
              as double?,
      colorMode: null == colorMode
          ? _value.colorMode
          : colorMode // ignore: cast_nullable_to_non_nullable
              as int,
      shareCode: null == shareCode
          ? _value.shareCode
          : shareCode // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SettingsModelImpl
    with DiagnosticableTreeMixin
    implements _SettingsModel {
  const _$SettingsModelImpl(
      {this.id = '0',
      this.username = 'user',
      this.plz = 71720,
      this.radius,
      this.colorMode = 0,
      this.shareCode = '##this is a share code##'});

  @override
  @JsonKey()
  final String id;
  @override
  @JsonKey()
  final String username;
  @override
  @JsonKey()
  final int plz;
  @override
  final double? radius;
  @override
  @JsonKey()
  final int colorMode;
  @override
  @JsonKey()
  final String shareCode;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SettingsModel(id: $id, username: $username, plz: $plz, radius: $radius, colorMode: $colorMode, shareCode: $shareCode)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SettingsModel'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('username', username))
      ..add(DiagnosticsProperty('plz', plz))
      ..add(DiagnosticsProperty('radius', radius))
      ..add(DiagnosticsProperty('colorMode', colorMode))
      ..add(DiagnosticsProperty('shareCode', shareCode));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SettingsModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.plz, plz) || other.plz == plz) &&
            (identical(other.radius, radius) || other.radius == radius) &&
            (identical(other.colorMode, colorMode) ||
                other.colorMode == colorMode) &&
            (identical(other.shareCode, shareCode) ||
                other.shareCode == shareCode));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, id, username, plz, radius, colorMode, shareCode);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SettingsModelImplCopyWith<_$SettingsModelImpl> get copyWith =>
      __$$SettingsModelImplCopyWithImpl<_$SettingsModelImpl>(this, _$identity);

  @override
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
}

abstract class _SettingsModel implements SettingsModel {
  const factory _SettingsModel(
      {final String id,
      final String username,
      final int plz,
      final double? radius,
      final int colorMode,
      final String shareCode}) = _$SettingsModelImpl;

  @override
  String get id;
  @override
  String get username;
  @override
  int get plz;
  @override
  double? get radius;
  @override
  int get colorMode;
  @override
  String get shareCode;
  @override
  @JsonKey(ignore: true)
  _$$SettingsModelImplCopyWith<_$SettingsModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
