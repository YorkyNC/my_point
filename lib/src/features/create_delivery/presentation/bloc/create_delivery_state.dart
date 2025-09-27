part of 'create_delivery_bloc.dart';

@freezed
abstract class CreateDeliveryState with _$CreateDeliveryState {
  const CreateDeliveryState._();
  const factory CreateDeliveryState({
    ItemType? selectedItemType,
    List<ItemType>? itemTypes,
    DateTime? selectedDate,
    @Default(0) int price,
    String? priceError,
    Airport? fromAirport,
    Airport? toAirport,
    @Default([]) List<Airport> airports,
    @Default(false) bool isLoadingAirports,
    String? recipientName,
    String? recipientPhone,
  }) = _CreateDeliveryState;
}
