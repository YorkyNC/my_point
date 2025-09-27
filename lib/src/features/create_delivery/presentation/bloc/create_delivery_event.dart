part of 'create_delivery_bloc.dart';

sealed class CreateDeliveryEvent {
  const CreateDeliveryEvent();
}

class CreateDeliveryStarted extends CreateDeliveryEvent {}

class CreateDeliveryItemTypeSelected extends CreateDeliveryEvent {
  final ItemType itemType;

  CreateDeliveryItemTypeSelected(this.itemType);
}

class CreateDeliveryResetSelection extends CreateDeliveryEvent {}

class CreateDeliveryDateSelected extends CreateDeliveryEvent {
  final DateTime date;

  CreateDeliveryDateSelected(this.date);
}

class CreateDeliveryPriceChanged extends CreateDeliveryEvent {
  final String price;

  CreateDeliveryPriceChanged(this.price);
}

class CreateDeliveryLoadAirports extends CreateDeliveryEvent {}

class CreateDeliveryFromAirportSelected extends CreateDeliveryEvent {
  final Airport airport;

  CreateDeliveryFromAirportSelected(this.airport);
}

class CreateDeliveryToAirportSelected extends CreateDeliveryEvent {
  final Airport airport;

  CreateDeliveryToAirportSelected(this.airport);
}

class CreateDeliveryRecipientSelected extends CreateDeliveryEvent {
  final String name;
  final String phone;

  CreateDeliveryRecipientSelected(this.name, this.phone);
}
