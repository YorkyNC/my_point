// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'verify_data_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

VerifyDataResponse _$VerifyDataResponseFromJson(Map<String, dynamic> json) {
  return _VerifyDataResponse.fromJson(json);
}

/// @nodoc
mixin _$VerifyDataResponse {
  String get accessToken => throw _privateConstructorUsedError;
  String get tokenType => throw _privateConstructorUsedError;
  int get expiresIn => throw _privateConstructorUsedError;

  /// Serializes this VerifyDataResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of VerifyDataResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VerifyDataResponseCopyWith<VerifyDataResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VerifyDataResponseCopyWith<$Res> {
  factory $VerifyDataResponseCopyWith(
          VerifyDataResponse value, $Res Function(VerifyDataResponse) then) =
      _$VerifyDataResponseCopyWithImpl<$Res, VerifyDataResponse>;
  @useResult
  $Res call({String accessToken, String tokenType, int expiresIn});
}

/// @nodoc
class _$VerifyDataResponseCopyWithImpl<$Res, $Val extends VerifyDataResponse>
    implements $VerifyDataResponseCopyWith<$Res> {
  _$VerifyDataResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VerifyDataResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accessToken = null,
    Object? tokenType = null,
    Object? expiresIn = null,
  }) {
    return _then(_value.copyWith(
      accessToken: null == accessToken
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String,
      tokenType: null == tokenType
          ? _value.tokenType
          : tokenType // ignore: cast_nullable_to_non_nullable
              as String,
      expiresIn: null == expiresIn
          ? _value.expiresIn
          : expiresIn // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VerifyDataResponseImplCopyWith<$Res>
    implements $VerifyDataResponseCopyWith<$Res> {
  factory _$$VerifyDataResponseImplCopyWith(_$VerifyDataResponseImpl value,
          $Res Function(_$VerifyDataResponseImpl) then) =
      __$$VerifyDataResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String accessToken, String tokenType, int expiresIn});
}

/// @nodoc
class __$$VerifyDataResponseImplCopyWithImpl<$Res>
    extends _$VerifyDataResponseCopyWithImpl<$Res, _$VerifyDataResponseImpl>
    implements _$$VerifyDataResponseImplCopyWith<$Res> {
  __$$VerifyDataResponseImplCopyWithImpl(_$VerifyDataResponseImpl _value,
      $Res Function(_$VerifyDataResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of VerifyDataResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accessToken = null,
    Object? tokenType = null,
    Object? expiresIn = null,
  }) {
    return _then(_$VerifyDataResponseImpl(
      accessToken: null == accessToken
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String,
      tokenType: null == tokenType
          ? _value.tokenType
          : tokenType // ignore: cast_nullable_to_non_nullable
              as String,
      expiresIn: null == expiresIn
          ? _value.expiresIn
          : expiresIn // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$VerifyDataResponseImpl implements _VerifyDataResponse {
  const _$VerifyDataResponseImpl(
      {required this.accessToken,
      required this.tokenType,
      required this.expiresIn});

  factory _$VerifyDataResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$VerifyDataResponseImplFromJson(json);

  @override
  final String accessToken;
  @override
  final String tokenType;
  @override
  final int expiresIn;

  @override
  String toString() {
    return 'VerifyDataResponse(accessToken: $accessToken, tokenType: $tokenType, expiresIn: $expiresIn)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VerifyDataResponseImpl &&
            (identical(other.accessToken, accessToken) ||
                other.accessToken == accessToken) &&
            (identical(other.tokenType, tokenType) ||
                other.tokenType == tokenType) &&
            (identical(other.expiresIn, expiresIn) ||
                other.expiresIn == expiresIn));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, accessToken, tokenType, expiresIn);

  /// Create a copy of VerifyDataResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VerifyDataResponseImplCopyWith<_$VerifyDataResponseImpl> get copyWith =>
      __$$VerifyDataResponseImplCopyWithImpl<_$VerifyDataResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VerifyDataResponseImplToJson(
      this,
    );
  }
}

abstract class _VerifyDataResponse implements VerifyDataResponse {
  const factory _VerifyDataResponse(
      {required final String accessToken,
      required final String tokenType,
      required final int expiresIn}) = _$VerifyDataResponseImpl;

  factory _VerifyDataResponse.fromJson(Map<String, dynamic> json) =
      _$VerifyDataResponseImpl.fromJson;

  @override
  String get accessToken;
  @override
  String get tokenType;
  @override
  int get expiresIn;

  /// Create a copy of VerifyDataResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VerifyDataResponseImplCopyWith<_$VerifyDataResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
