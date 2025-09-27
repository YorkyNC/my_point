// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_delivery_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CreateDeliveryState {
  ItemType? get selectedItemType => throw _privateConstructorUsedError;
  List<ItemType>? get itemTypes => throw _privateConstructorUsedError;
  DateTime? get selectedDate => throw _privateConstructorUsedError;
  int get price => throw _privateConstructorUsedError;
  String? get priceError => throw _privateConstructorUsedError;
  Airport? get fromAirport => throw _privateConstructorUsedError;
  Airport? get toAirport => throw _privateConstructorUsedError;
  List<Airport> get airports => throw _privateConstructorUsedError;
  bool get isLoadingAirports => throw _privateConstructorUsedError;
  String? get recipientName => throw _privateConstructorUsedError;
  String? get recipientPhone => throw _privateConstructorUsedError;

  /// Create a copy of CreateDeliveryState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CreateDeliveryStateCopyWith<CreateDeliveryState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateDeliveryStateCopyWith<$Res> {
  factory $CreateDeliveryStateCopyWith(
          CreateDeliveryState value, $Res Function(CreateDeliveryState) then) =
      _$CreateDeliveryStateCopyWithImpl<$Res, CreateDeliveryState>;
  @useResult
  $Res call(
      {ItemType? selectedItemType,
      List<ItemType>? itemTypes,
      DateTime? selectedDate,
      int price,
      String? priceError,
      Airport? fromAirport,
      Airport? toAirport,
      List<Airport> airports,
      bool isLoadingAirports,
      String? recipientName,
      String? recipientPhone});

  $AirportCopyWith<$Res>? get fromAirport;
  $AirportCopyWith<$Res>? get toAirport;
}

/// @nodoc
class _$CreateDeliveryStateCopyWithImpl<$Res, $Val extends CreateDeliveryState>
    implements $CreateDeliveryStateCopyWith<$Res> {
  _$CreateDeliveryStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CreateDeliveryState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedItemType = freezed,
    Object? itemTypes = freezed,
    Object? selectedDate = freezed,
    Object? price = null,
    Object? priceError = freezed,
    Object? fromAirport = freezed,
    Object? toAirport = freezed,
    Object? airports = null,
    Object? isLoadingAirports = null,
    Object? recipientName = freezed,
    Object? recipientPhone = freezed,
  }) {
    return _then(_value.copyWith(
      selectedItemType: freezed == selectedItemType
          ? _value.selectedItemType
          : selectedItemType // ignore: cast_nullable_to_non_nullable
              as ItemType?,
      itemTypes: freezed == itemTypes
          ? _value.itemTypes
          : itemTypes // ignore: cast_nullable_to_non_nullable
              as List<ItemType>?,
      selectedDate: freezed == selectedDate
          ? _value.selectedDate
          : selectedDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
      priceError: freezed == priceError
          ? _value.priceError
          : priceError // ignore: cast_nullable_to_non_nullable
              as String?,
      fromAirport: freezed == fromAirport
          ? _value.fromAirport
          : fromAirport // ignore: cast_nullable_to_non_nullable
              as Airport?,
      toAirport: freezed == toAirport
          ? _value.toAirport
          : toAirport // ignore: cast_nullable_to_non_nullable
              as Airport?,
      airports: null == airports
          ? _value.airports
          : airports // ignore: cast_nullable_to_non_nullable
              as List<Airport>,
      isLoadingAirports: null == isLoadingAirports
          ? _value.isLoadingAirports
          : isLoadingAirports // ignore: cast_nullable_to_non_nullable
              as bool,
      recipientName: freezed == recipientName
          ? _value.recipientName
          : recipientName // ignore: cast_nullable_to_non_nullable
              as String?,
      recipientPhone: freezed == recipientPhone
          ? _value.recipientPhone
          : recipientPhone // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  /// Create a copy of CreateDeliveryState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AirportCopyWith<$Res>? get fromAirport {
    if (_value.fromAirport == null) {
      return null;
    }

    return $AirportCopyWith<$Res>(_value.fromAirport!, (value) {
      return _then(_value.copyWith(fromAirport: value) as $Val);
    });
  }

  /// Create a copy of CreateDeliveryState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AirportCopyWith<$Res>? get toAirport {
    if (_value.toAirport == null) {
      return null;
    }

    return $AirportCopyWith<$Res>(_value.toAirport!, (value) {
      return _then(_value.copyWith(toAirport: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CreateDeliveryStateImplCopyWith<$Res>
    implements $CreateDeliveryStateCopyWith<$Res> {
  factory _$$CreateDeliveryStateImplCopyWith(_$CreateDeliveryStateImpl value,
          $Res Function(_$CreateDeliveryStateImpl) then) =
      __$$CreateDeliveryStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {ItemType? selectedItemType,
      List<ItemType>? itemTypes,
      DateTime? selectedDate,
      int price,
      String? priceError,
      Airport? fromAirport,
      Airport? toAirport,
      List<Airport> airports,
      bool isLoadingAirports,
      String? recipientName,
      String? recipientPhone});

  @override
  $AirportCopyWith<$Res>? get fromAirport;
  @override
  $AirportCopyWith<$Res>? get toAirport;
}

/// @nodoc
class __$$CreateDeliveryStateImplCopyWithImpl<$Res>
    extends _$CreateDeliveryStateCopyWithImpl<$Res, _$CreateDeliveryStateImpl>
    implements _$$CreateDeliveryStateImplCopyWith<$Res> {
  __$$CreateDeliveryStateImplCopyWithImpl(_$CreateDeliveryStateImpl _value,
      $Res Function(_$CreateDeliveryStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of CreateDeliveryState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedItemType = freezed,
    Object? itemTypes = freezed,
    Object? selectedDate = freezed,
    Object? price = null,
    Object? priceError = freezed,
    Object? fromAirport = freezed,
    Object? toAirport = freezed,
    Object? airports = null,
    Object? isLoadingAirports = null,
    Object? recipientName = freezed,
    Object? recipientPhone = freezed,
  }) {
    return _then(_$CreateDeliveryStateImpl(
      selectedItemType: freezed == selectedItemType
          ? _value.selectedItemType
          : selectedItemType // ignore: cast_nullable_to_non_nullable
              as ItemType?,
      itemTypes: freezed == itemTypes
          ? _value._itemTypes
          : itemTypes // ignore: cast_nullable_to_non_nullable
              as List<ItemType>?,
      selectedDate: freezed == selectedDate
          ? _value.selectedDate
          : selectedDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
      priceError: freezed == priceError
          ? _value.priceError
          : priceError // ignore: cast_nullable_to_non_nullable
              as String?,
      fromAirport: freezed == fromAirport
          ? _value.fromAirport
          : fromAirport // ignore: cast_nullable_to_non_nullable
              as Airport?,
      toAirport: freezed == toAirport
          ? _value.toAirport
          : toAirport // ignore: cast_nullable_to_non_nullable
              as Airport?,
      airports: null == airports
          ? _value._airports
          : airports // ignore: cast_nullable_to_non_nullable
              as List<Airport>,
      isLoadingAirports: null == isLoadingAirports
          ? _value.isLoadingAirports
          : isLoadingAirports // ignore: cast_nullable_to_non_nullable
              as bool,
      recipientName: freezed == recipientName
          ? _value.recipientName
          : recipientName // ignore: cast_nullable_to_non_nullable
              as String?,
      recipientPhone: freezed == recipientPhone
          ? _value.recipientPhone
          : recipientPhone // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$CreateDeliveryStateImpl extends _CreateDeliveryState {
  const _$CreateDeliveryStateImpl(
      {this.selectedItemType,
      final List<ItemType>? itemTypes,
      this.selectedDate,
      this.price = 0,
      this.priceError,
      this.fromAirport,
      this.toAirport,
      final List<Airport> airports = const [],
      this.isLoadingAirports = false,
      this.recipientName,
      this.recipientPhone})
      : _itemTypes = itemTypes,
        _airports = airports,
        super._();

  @override
  final ItemType? selectedItemType;
  final List<ItemType>? _itemTypes;
  @override
  List<ItemType>? get itemTypes {
    final value = _itemTypes;
    if (value == null) return null;
    if (_itemTypes is EqualUnmodifiableListView) return _itemTypes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final DateTime? selectedDate;
  @override
  @JsonKey()
  final int price;
  @override
  final String? priceError;
  @override
  final Airport? fromAirport;
  @override
  final Airport? toAirport;
  final List<Airport> _airports;
  @override
  @JsonKey()
  List<Airport> get airports {
    if (_airports is EqualUnmodifiableListView) return _airports;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_airports);
  }

  @override
  @JsonKey()
  final bool isLoadingAirports;
  @override
  final String? recipientName;
  @override
  final String? recipientPhone;

  @override
  String toString() {
    return 'CreateDeliveryState(selectedItemType: $selectedItemType, itemTypes: $itemTypes, selectedDate: $selectedDate, price: $price, priceError: $priceError, fromAirport: $fromAirport, toAirport: $toAirport, airports: $airports, isLoadingAirports: $isLoadingAirports, recipientName: $recipientName, recipientPhone: $recipientPhone)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateDeliveryStateImpl &&
            (identical(other.selectedItemType, selectedItemType) ||
                other.selectedItemType == selectedItemType) &&
            const DeepCollectionEquality()
                .equals(other._itemTypes, _itemTypes) &&
            (identical(other.selectedDate, selectedDate) ||
                other.selectedDate == selectedDate) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.priceError, priceError) ||
                other.priceError == priceError) &&
            (identical(other.fromAirport, fromAirport) ||
                other.fromAirport == fromAirport) &&
            (identical(other.toAirport, toAirport) ||
                other.toAirport == toAirport) &&
            const DeepCollectionEquality().equals(other._airports, _airports) &&
            (identical(other.isLoadingAirports, isLoadingAirports) ||
                other.isLoadingAirports == isLoadingAirports) &&
            (identical(other.recipientName, recipientName) ||
                other.recipientName == recipientName) &&
            (identical(other.recipientPhone, recipientPhone) ||
                other.recipientPhone == recipientPhone));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      selectedItemType,
      const DeepCollectionEquality().hash(_itemTypes),
      selectedDate,
      price,
      priceError,
      fromAirport,
      toAirport,
      const DeepCollectionEquality().hash(_airports),
      isLoadingAirports,
      recipientName,
      recipientPhone);

  /// Create a copy of CreateDeliveryState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateDeliveryStateImplCopyWith<_$CreateDeliveryStateImpl> get copyWith =>
      __$$CreateDeliveryStateImplCopyWithImpl<_$CreateDeliveryStateImpl>(
          this, _$identity);
}

abstract class _CreateDeliveryState extends CreateDeliveryState {
  const factory _CreateDeliveryState(
      {final ItemType? selectedItemType,
      final List<ItemType>? itemTypes,
      final DateTime? selectedDate,
      final int price,
      final String? priceError,
      final Airport? fromAirport,
      final Airport? toAirport,
      final List<Airport> airports,
      final bool isLoadingAirports,
      final String? recipientName,
      final String? recipientPhone}) = _$CreateDeliveryStateImpl;
  const _CreateDeliveryState._() : super._();

  @override
  ItemType? get selectedItemType;
  @override
  List<ItemType>? get itemTypes;
  @override
  DateTime? get selectedDate;
  @override
  int get price;
  @override
  String? get priceError;
  @override
  Airport? get fromAirport;
  @override
  Airport? get toAirport;
  @override
  List<Airport> get airports;
  @override
  bool get isLoadingAirports;
  @override
  String? get recipientName;
  @override
  String? get recipientPhone;

  /// Create a copy of CreateDeliveryState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreateDeliveryStateImplCopyWith<_$CreateDeliveryStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
