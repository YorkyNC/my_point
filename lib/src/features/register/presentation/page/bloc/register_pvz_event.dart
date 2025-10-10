part of 'register_pvz_bloc.dart';

sealed class RegisterPvzEvent {
  const RegisterPvzEvent();
}

class RegisterPvzStarted extends RegisterPvzEvent {
  const RegisterPvzStarted();
}

class RegisterPvzNameChanged extends RegisterPvzEvent {
  final String name;
  const RegisterPvzNameChanged(this.name);
}

class RegisterPvzTotalAreaChanged extends RegisterPvzEvent {
  final String totalArea;
  const RegisterPvzTotalAreaChanged(this.totalArea);
}

class RegisterPvzCityChanged extends RegisterPvzEvent {
  final String city;
  const RegisterPvzCityChanged(this.city);
}

class RegisterPvzAddressChanged extends RegisterPvzEvent {
  final String address;
  const RegisterPvzAddressChanged(this.address);
}

class RegisterPvzEntranceChanged extends RegisterPvzEvent {
  final String entrance;
  const RegisterPvzEntranceChanged(this.entrance);
}

class RegisterPvzApartmentChanged extends RegisterPvzEvent {
  final String apartment;
  const RegisterPvzApartmentChanged(this.apartment);
}

class RegisterPvzFloorChanged extends RegisterPvzEvent {
  final String floor;
  const RegisterPvzFloorChanged(this.floor);
}

class RegisterPvzIntercomChanged extends RegisterPvzEvent {
  final String intercom;
  const RegisterPvzIntercomChanged(this.intercom);
}

class RegisterPvzCommentChanged extends RegisterPvzEvent {
  final String comment;
  const RegisterPvzCommentChanged(this.comment);
}

class RegisterPvzPhotoOfTheEntranceToTheRoomChanged extends RegisterPvzEvent {
  final List<String> photoOfTheEntranceToTheRoom;
  const RegisterPvzPhotoOfTheEntranceToTheRoomChanged(this.photoOfTheEntranceToTheRoom);
}

class RegisterPvzPhotoOfTheRoomChanged extends RegisterPvzEvent {
  final List<String> photoOfTheRoom;
  const RegisterPvzPhotoOfTheRoomChanged(this.photoOfTheRoom);
}

class RegisterPvzPhotoOfThePlaceForShelvingChanged extends RegisterPvzEvent {
  final List<String> photoOfThePlaceForShelving;
  const RegisterPvzPhotoOfThePlaceForShelvingChanged(this.photoOfThePlaceForShelving);
}

class ValidateFirstStep extends RegisterPvzEvent {
  final String name;
  final String totalArea;
  final String city;
  final String address;
  final String entrance;
  final String apartment;
  final String floor;
  final String intercom;
  final String comment;
  const ValidateFirstStep(this.name, this.totalArea, this.city, this.address, this.entrance, this.apartment, this.floor,
      this.intercom, this.comment);
}

class ValidateSecondStep extends RegisterPvzEvent {
  final List<String> photoOfTheEntranceToTheRoom;
  final List<String> photoOfTheRoom;
  final List<String> photoOfThePlaceForShelving;
  const ValidateSecondStep(this.photoOfTheEntranceToTheRoom, this.photoOfTheRoom, this.photoOfThePlaceForShelving);
}

class Submit extends RegisterPvzEvent {
  final RegisterPvzRequest request;
  const Submit(this.request);
}
