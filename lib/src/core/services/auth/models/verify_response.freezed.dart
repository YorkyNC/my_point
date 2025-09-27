// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'verify_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

VerifyResponse _$VerifyResponseFromJson(Map<String, dynamic> json) {
  return _VerifyResponse.fromJson(json);
}

/// @nodoc
mixin _$VerifyResponse {
  String get status => throw _privateConstructorUsedError;
  Map<String, dynamic>? get data => throw _privateConstructorUsedError;

  /// Serializes this VerifyResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of VerifyResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VerifyResponseCopyWith<VerifyResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VerifyResponseCopyWith<$Res> {
  factory $VerifyResponseCopyWith(
          VerifyResponse value, $Res Function(VerifyResponse) then) =
      _$VerifyResponseCopyWithImpl<$Res, VerifyResponse>;
  @useResult
  $Res call({String status, Map<String, dynamic>? data});
}

/// @nodoc
class _$VerifyResponseCopyWithImpl<$Res, $Val extends VerifyResponse>
    implements $VerifyResponseCopyWith<$Res> {
  _$VerifyResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VerifyResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? data = freezed,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VerifyResponseImplCopyWith<$Res>
    implements $VerifyResponseCopyWith<$Res> {
  factory _$$VerifyResponseImplCopyWith(_$VerifyResponseImpl value,
          $Res Function(_$VerifyResponseImpl) then) =
      __$$VerifyResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String status, Map<String, dynamic>? data});
}

/// @nodoc
class __$$VerifyResponseImplCopyWithImpl<$Res>
    extends _$VerifyResponseCopyWithImpl<$Res, _$VerifyResponseImpl>
    implements _$$VerifyResponseImplCopyWith<$Res> {
  __$$VerifyResponseImplCopyWithImpl(
      _$VerifyResponseImpl _value, $Res Function(_$VerifyResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of VerifyResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? data = freezed,
  }) {
    return _then(_$VerifyResponseImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      data: freezed == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$VerifyResponseImpl implements _VerifyResponse {
  const _$VerifyResponseImpl(
      {required this.status, required final Map<String, dynamic>? data})
      : _data = data;

  factory _$VerifyResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$VerifyResponseImplFromJson(json);

  @override
  final String status;
  final Map<String, dynamic>? _data;
  @override
  Map<String, dynamic>? get data {
    final value = _data;
    if (value == null) return null;
    if (_data is EqualUnmodifiableMapView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'VerifyResponse(status: $status, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VerifyResponseImpl &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, status, const DeepCollectionEquality().hash(_data));

  /// Create a copy of VerifyResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VerifyResponseImplCopyWith<_$VerifyResponseImpl> get copyWith =>
      __$$VerifyResponseImplCopyWithImpl<_$VerifyResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VerifyResponseImplToJson(
      this,
    );
  }
}

abstract class _VerifyResponse implements VerifyResponse {
  const factory _VerifyResponse(
      {required final String status,
      required final Map<String, dynamic>? data}) = _$VerifyResponseImpl;

  factory _VerifyResponse.fromJson(Map<String, dynamic> json) =
      _$VerifyResponseImpl.fromJson;

  @override
  String get status;
  @override
  Map<String, dynamic>? get data;

  /// Create a copy of VerifyResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VerifyResponseImplCopyWith<_$VerifyResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
