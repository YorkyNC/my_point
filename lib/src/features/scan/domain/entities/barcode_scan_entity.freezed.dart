// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'barcode_scan_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

BarcodeScanEntity _$BarcodeScanEntityFromJson(Map<String, dynamic> json) {
  return _BarcodeScanEntity.fromJson(json);
}

/// @nodoc
mixin _$BarcodeScanEntity {
  String get status => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  DateTime get timestamp => throw _privateConstructorUsedError;

  /// Serializes this BarcodeScanEntity to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BarcodeScanEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BarcodeScanEntityCopyWith<BarcodeScanEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BarcodeScanEntityCopyWith<$Res> {
  factory $BarcodeScanEntityCopyWith(
          BarcodeScanEntity value, $Res Function(BarcodeScanEntity) then) =
      _$BarcodeScanEntityCopyWithImpl<$Res, BarcodeScanEntity>;
  @useResult
  $Res call({String status, String message, DateTime timestamp});
}

/// @nodoc
class _$BarcodeScanEntityCopyWithImpl<$Res, $Val extends BarcodeScanEntity>
    implements $BarcodeScanEntityCopyWith<$Res> {
  _$BarcodeScanEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BarcodeScanEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? message = null,
    Object? timestamp = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BarcodeScanEntityImplCopyWith<$Res>
    implements $BarcodeScanEntityCopyWith<$Res> {
  factory _$$BarcodeScanEntityImplCopyWith(_$BarcodeScanEntityImpl value,
          $Res Function(_$BarcodeScanEntityImpl) then) =
      __$$BarcodeScanEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String status, String message, DateTime timestamp});
}

/// @nodoc
class __$$BarcodeScanEntityImplCopyWithImpl<$Res>
    extends _$BarcodeScanEntityCopyWithImpl<$Res, _$BarcodeScanEntityImpl>
    implements _$$BarcodeScanEntityImplCopyWith<$Res> {
  __$$BarcodeScanEntityImplCopyWithImpl(_$BarcodeScanEntityImpl _value,
      $Res Function(_$BarcodeScanEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of BarcodeScanEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? message = null,
    Object? timestamp = null,
  }) {
    return _then(_$BarcodeScanEntityImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BarcodeScanEntityImpl implements _BarcodeScanEntity {
  const _$BarcodeScanEntityImpl(
      {required this.status, required this.message, required this.timestamp});

  factory _$BarcodeScanEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$BarcodeScanEntityImplFromJson(json);

  @override
  final String status;
  @override
  final String message;
  @override
  final DateTime timestamp;

  @override
  String toString() {
    return 'BarcodeScanEntity(status: $status, message: $message, timestamp: $timestamp)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BarcodeScanEntityImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, status, message, timestamp);

  /// Create a copy of BarcodeScanEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BarcodeScanEntityImplCopyWith<_$BarcodeScanEntityImpl> get copyWith =>
      __$$BarcodeScanEntityImplCopyWithImpl<_$BarcodeScanEntityImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BarcodeScanEntityImplToJson(
      this,
    );
  }
}

abstract class _BarcodeScanEntity implements BarcodeScanEntity {
  const factory _BarcodeScanEntity(
      {required final String status,
      required final String message,
      required final DateTime timestamp}) = _$BarcodeScanEntityImpl;

  factory _BarcodeScanEntity.fromJson(Map<String, dynamic> json) =
      _$BarcodeScanEntityImpl.fromJson;

  @override
  String get status;
  @override
  String get message;
  @override
  DateTime get timestamp;

  /// Create a copy of BarcodeScanEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BarcodeScanEntityImplCopyWith<_$BarcodeScanEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
