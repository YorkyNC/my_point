// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sign_in_response_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SignInResponseEntity _$SignInResponseEntityFromJson(Map<String, dynamic> json) {
  return _SignInResponseEntity.fromJson(json);
}

/// @nodoc
mixin _$SignInResponseEntity {
  String get phone => throw _privateConstructorUsedError;

  /// Serializes this SignInResponseEntity to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SignInResponseEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SignInResponseEntityCopyWith<SignInResponseEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignInResponseEntityCopyWith<$Res> {
  factory $SignInResponseEntityCopyWith(SignInResponseEntity value,
          $Res Function(SignInResponseEntity) then) =
      _$SignInResponseEntityCopyWithImpl<$Res, SignInResponseEntity>;
  @useResult
  $Res call({String phone});
}

/// @nodoc
class _$SignInResponseEntityCopyWithImpl<$Res,
        $Val extends SignInResponseEntity>
    implements $SignInResponseEntityCopyWith<$Res> {
  _$SignInResponseEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SignInResponseEntity
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
abstract class _$$SignInResponseEntityImplCopyWith<$Res>
    implements $SignInResponseEntityCopyWith<$Res> {
  factory _$$SignInResponseEntityImplCopyWith(_$SignInResponseEntityImpl value,
          $Res Function(_$SignInResponseEntityImpl) then) =
      __$$SignInResponseEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String phone});
}

/// @nodoc
class __$$SignInResponseEntityImplCopyWithImpl<$Res>
    extends _$SignInResponseEntityCopyWithImpl<$Res, _$SignInResponseEntityImpl>
    implements _$$SignInResponseEntityImplCopyWith<$Res> {
  __$$SignInResponseEntityImplCopyWithImpl(_$SignInResponseEntityImpl _value,
      $Res Function(_$SignInResponseEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of SignInResponseEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? phone = null,
  }) {
    return _then(_$SignInResponseEntityImpl(
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SignInResponseEntityImpl implements _SignInResponseEntity {
  const _$SignInResponseEntityImpl({required this.phone});

  factory _$SignInResponseEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$SignInResponseEntityImplFromJson(json);

  @override
  final String phone;

  @override
  String toString() {
    return 'SignInResponseEntity(phone: $phone)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SignInResponseEntityImpl &&
            (identical(other.phone, phone) || other.phone == phone));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, phone);

  /// Create a copy of SignInResponseEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SignInResponseEntityImplCopyWith<_$SignInResponseEntityImpl>
      get copyWith =>
          __$$SignInResponseEntityImplCopyWithImpl<_$SignInResponseEntityImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SignInResponseEntityImplToJson(
      this,
    );
  }
}

abstract class _SignInResponseEntity implements SignInResponseEntity {
  const factory _SignInResponseEntity({required final String phone}) =
      _$SignInResponseEntityImpl;

  factory _SignInResponseEntity.fromJson(Map<String, dynamic> json) =
      _$SignInResponseEntityImpl.fromJson;

  @override
  String get phone;

  /// Create a copy of SignInResponseEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SignInResponseEntityImplCopyWith<_$SignInResponseEntityImpl>
      get copyWith => throw _privateConstructorUsedError;
}
