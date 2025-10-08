// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'qr_scan_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

QrScanRequest _$QrScanRequestFromJson(Map<String, dynamic> json) {
  return _QrScanRequest.fromJson(json);
}

/// @nodoc
mixin _$QrScanRequest {
  @JsonKey(name: 'encoded_data')
  String get encodedData =>
      throw _privateConstructorUsedError; //base64 encoded data
  @JsonKey(name: 'current_pvz_id')
  String get currentPvzId => throw _privateConstructorUsedError;

  /// Serializes this QrScanRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of QrScanRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $QrScanRequestCopyWith<QrScanRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QrScanRequestCopyWith<$Res> {
  factory $QrScanRequestCopyWith(
          QrScanRequest value, $Res Function(QrScanRequest) then) =
      _$QrScanRequestCopyWithImpl<$Res, QrScanRequest>;
  @useResult
  $Res call(
      {@JsonKey(name: 'encoded_data') String encodedData,
      @JsonKey(name: 'current_pvz_id') String currentPvzId});
}

/// @nodoc
class _$QrScanRequestCopyWithImpl<$Res, $Val extends QrScanRequest>
    implements $QrScanRequestCopyWith<$Res> {
  _$QrScanRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of QrScanRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? encodedData = null,
    Object? currentPvzId = null,
  }) {
    return _then(_value.copyWith(
      encodedData: null == encodedData
          ? _value.encodedData
          : encodedData // ignore: cast_nullable_to_non_nullable
              as String,
      currentPvzId: null == currentPvzId
          ? _value.currentPvzId
          : currentPvzId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$QrScanRequestImplCopyWith<$Res>
    implements $QrScanRequestCopyWith<$Res> {
  factory _$$QrScanRequestImplCopyWith(
          _$QrScanRequestImpl value, $Res Function(_$QrScanRequestImpl) then) =
      __$$QrScanRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'encoded_data') String encodedData,
      @JsonKey(name: 'current_pvz_id') String currentPvzId});
}

/// @nodoc
class __$$QrScanRequestImplCopyWithImpl<$Res>
    extends _$QrScanRequestCopyWithImpl<$Res, _$QrScanRequestImpl>
    implements _$$QrScanRequestImplCopyWith<$Res> {
  __$$QrScanRequestImplCopyWithImpl(
      _$QrScanRequestImpl _value, $Res Function(_$QrScanRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of QrScanRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? encodedData = null,
    Object? currentPvzId = null,
  }) {
    return _then(_$QrScanRequestImpl(
      encodedData: null == encodedData
          ? _value.encodedData
          : encodedData // ignore: cast_nullable_to_non_nullable
              as String,
      currentPvzId: null == currentPvzId
          ? _value.currentPvzId
          : currentPvzId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$QrScanRequestImpl implements _QrScanRequest {
  const _$QrScanRequestImpl(
      {@JsonKey(name: 'encoded_data') required this.encodedData,
      @JsonKey(name: 'current_pvz_id') required this.currentPvzId});

  factory _$QrScanRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$QrScanRequestImplFromJson(json);

  @override
  @JsonKey(name: 'encoded_data')
  final String encodedData;
//base64 encoded data
  @override
  @JsonKey(name: 'current_pvz_id')
  final String currentPvzId;

  @override
  String toString() {
    return 'QrScanRequest(encodedData: $encodedData, currentPvzId: $currentPvzId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QrScanRequestImpl &&
            (identical(other.encodedData, encodedData) ||
                other.encodedData == encodedData) &&
            (identical(other.currentPvzId, currentPvzId) ||
                other.currentPvzId == currentPvzId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, encodedData, currentPvzId);

  /// Create a copy of QrScanRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$QrScanRequestImplCopyWith<_$QrScanRequestImpl> get copyWith =>
      __$$QrScanRequestImplCopyWithImpl<_$QrScanRequestImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$QrScanRequestImplToJson(
      this,
    );
  }
}

abstract class _QrScanRequest implements QrScanRequest {
  const factory _QrScanRequest(
      {@JsonKey(name: 'encoded_data') required final String encodedData,
      @JsonKey(name: 'current_pvz_id')
      required final String currentPvzId}) = _$QrScanRequestImpl;

  factory _QrScanRequest.fromJson(Map<String, dynamic> json) =
      _$QrScanRequestImpl.fromJson;

  @override
  @JsonKey(name: 'encoded_data')
  String get encodedData; //base64 encoded data
  @override
  @JsonKey(name: 'current_pvz_id')
  String get currentPvzId;

  /// Create a copy of QrScanRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$QrScanRequestImplCopyWith<_$QrScanRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
