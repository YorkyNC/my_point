// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sign_in_response_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SignInResponseDto _$SignInResponseDtoFromJson(Map<String, dynamic> json) {
  return _SignInResponseDto.fromJson(json);
}

/// @nodoc
mixin _$SignInResponseDto {
  String get phone => throw _privateConstructorUsedError;

  /// Serializes this SignInResponseDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SignInResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SignInResponseDtoCopyWith<SignInResponseDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignInResponseDtoCopyWith<$Res> {
  factory $SignInResponseDtoCopyWith(
          SignInResponseDto value, $Res Function(SignInResponseDto) then) =
      _$SignInResponseDtoCopyWithImpl<$Res, SignInResponseDto>;
  @useResult
  $Res call({String phone});
}

/// @nodoc
class _$SignInResponseDtoCopyWithImpl<$Res, $Val extends SignInResponseDto>
    implements $SignInResponseDtoCopyWith<$Res> {
  _$SignInResponseDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SignInResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? phone = null,
  }) {
    return _then(_value.copyWith(
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SignInResponseDtoImplCopyWith<$Res>
    implements $SignInResponseDtoCopyWith<$Res> {
  factory _$$SignInResponseDtoImplCopyWith(_$SignInResponseDtoImpl value,
          $Res Function(_$SignInResponseDtoImpl) then) =
      __$$SignInResponseDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String phone});
}

/// @nodoc
class __$$SignInResponseDtoImplCopyWithImpl<$Res>
    extends _$SignInResponseDtoCopyWithImpl<$Res, _$SignInResponseDtoImpl>
    implements _$$SignInResponseDtoImplCopyWith<$Res> {
  __$$SignInResponseDtoImplCopyWithImpl(_$SignInResponseDtoImpl _value,
      $Res Function(_$SignInResponseDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of SignInResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? phone = null,
  }) {
    return _then(_$SignInResponseDtoImpl(
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SignInResponseDtoImpl implements _SignInResponseDto {
  const _$SignInResponseDtoImpl({required this.phone});

  factory _$SignInResponseDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$SignInResponseDtoImplFromJson(json);

  @override
  final String phone;

  @override
  String toString() {
    return 'SignInResponseDto(phone: $phone)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SignInResponseDtoImpl &&
            (identical(other.phone, phone) || other.phone == phone));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, phone);

  /// Create a copy of SignInResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SignInResponseDtoImplCopyWith<_$SignInResponseDtoImpl> get copyWith =>
      __$$SignInResponseDtoImplCopyWithImpl<_$SignInResponseDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SignInResponseDtoImplToJson(
      this,
    );
  }
}

abstract class _SignInResponseDto implements SignInResponseDto {
  const factory _SignInResponseDto({required final String phone}) =
      _$SignInResponseDtoImpl;

  factory _SignInResponseDto.fromJson(Map<String, dynamic> json) =
      _$SignInResponseDtoImpl.fromJson;

  @override
  String get phone;

  /// Create a copy of SignInResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SignInResponseDtoImplCopyWith<_$SignInResponseDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
