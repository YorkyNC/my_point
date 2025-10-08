// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'barcode_scan_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

BarcodeScanRequest _$BarcodeScanRequestFromJson(Map<String, dynamic> json) {
  return _BarcodeScanRequest.fromJson(json);
}

/// @nodoc
mixin _$BarcodeScanRequest {
  String get barcode => throw _privateConstructorUsedError;
  String get pvzId => throw _privateConstructorUsedError;

  /// Serializes this BarcodeScanRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BarcodeScanRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BarcodeScanRequestCopyWith<BarcodeScanRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BarcodeScanRequestCopyWith<$Res> {
  factory $BarcodeScanRequestCopyWith(
          BarcodeScanRequest value, $Res Function(BarcodeScanRequest) then) =
      _$BarcodeScanRequestCopyWithImpl<$Res, BarcodeScanRequest>;
  @useResult
  $Res call({String barcode, String pvzId});
}

/// @nodoc
class _$BarcodeScanRequestCopyWithImpl<$Res, $Val extends BarcodeScanRequest>
    implements $BarcodeScanRequestCopyWith<$Res> {
  _$BarcodeScanRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BarcodeScanRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? barcode = null,
    Object? pvzId = null,
  }) {
    return _then(_value.copyWith(
      barcode: null == barcode
          ? _value.barcode
          : barcode // ignore: cast_nullable_to_non_nullable
              as String,
      pvzId: null == pvzId
          ? _value.pvzId
          : pvzId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BarcodeScanRequestImplCopyWith<$Res>
    implements $BarcodeScanRequestCopyWith<$Res> {
  factory _$$BarcodeScanRequestImplCopyWith(_$BarcodeScanRequestImpl value,
          $Res Function(_$BarcodeScanRequestImpl) then) =
      __$$BarcodeScanRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String barcode, String pvzId});
}

/// @nodoc
class __$$BarcodeScanRequestImplCopyWithImpl<$Res>
    extends _$BarcodeScanRequestCopyWithImpl<$Res, _$BarcodeScanRequestImpl>
    implements _$$BarcodeScanRequestImplCopyWith<$Res> {
  __$$BarcodeScanRequestImplCopyWithImpl(_$BarcodeScanRequestImpl _value,
      $Res Function(_$BarcodeScanRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of BarcodeScanRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? barcode = null,
    Object? pvzId = null,
  }) {
    return _then(_$BarcodeScanRequestImpl(
      barcode: null == barcode
          ? _value.barcode
          : barcode // ignore: cast_nullable_to_non_nullable
              as String,
      pvzId: null == pvzId
          ? _value.pvzId
          : pvzId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BarcodeScanRequestImpl implements _BarcodeScanRequest {
  const _$BarcodeScanRequestImpl({required this.barcode, required this.pvzId});

  factory _$BarcodeScanRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$BarcodeScanRequestImplFromJson(json);

  @override
  final String barcode;
  @override
  final String pvzId;

  @override
  String toString() {
    return 'BarcodeScanRequest(barcode: $barcode, pvzId: $pvzId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BarcodeScanRequestImpl &&
            (identical(other.barcode, barcode) || other.barcode == barcode) &&
            (identical(other.pvzId, pvzId) || other.pvzId == pvzId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, barcode, pvzId);

  /// Create a copy of BarcodeScanRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BarcodeScanRequestImplCopyWith<_$BarcodeScanRequestImpl> get copyWith =>
      __$$BarcodeScanRequestImplCopyWithImpl<_$BarcodeScanRequestImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BarcodeScanRequestImplToJson(
      this,
    );
  }
}

abstract class _BarcodeScanRequest implements BarcodeScanRequest {
  const factory _BarcodeScanRequest(
      {required final String barcode,
      required final String pvzId}) = _$BarcodeScanRequestImpl;

  factory _BarcodeScanRequest.fromJson(Map<String, dynamic> json) =
      _$BarcodeScanRequestImpl.fromJson;

  @override
  String get barcode;
  @override
  String get pvzId;

  /// Create a copy of BarcodeScanRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BarcodeScanRequestImplCopyWith<_$BarcodeScanRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
