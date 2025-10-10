import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:my_point/src/features/register/domain/request/register_pvz_request.dart';
import 'package:my_point/src/features/register/domain/usecases/register_pvz_use_case.dart';

part 'register_pvz_bloc.freezed.dart';
part 'register_pvz_event.dart';
part 'register_pvz_state.dart';

@injectable
class RegisterPvzBloc extends Bloc<RegisterPvzEvent, RegisterPvzState> {
  RegisterPvzBloc(this._registerPvzUseCase) : super(RegisterPvzState()) {
    setUpHandlers();
  }
  final RegisterPvzUseCase _registerPvzUseCase;
  void setUpHandlers() {
    on<RegisterPvzStarted>(_onRegisterPvzStarted);
    on<RegisterPvzNameChanged>(_onRegisterPvzNameChanged);
    on<RegisterPvzTotalAreaChanged>(_onRegisterPvzTotalAreaChanged);
    on<RegisterPvzCityChanged>(_onRegisterPvzCityChanged);
    on<RegisterPvzAddressChanged>(_onRegisterPvzAddressChanged);
    on<RegisterPvzEntranceChanged>(_onRegisterPvzEntranceChanged);
    on<RegisterPvzApartmentChanged>(_onRegisterPvzApartmentChanged);
    on<RegisterPvzFloorChanged>(_onRegisterPvzFloorChanged);
    on<RegisterPvzIntercomChanged>(_onRegisterPvzIntercomChanged);
    on<RegisterPvzCommentChanged>(_onRegisterPvzCommentChanged);
    on<RegisterPvzPhotoOfTheEntranceToTheRoomChanged>(_onRegisterPvzPhotoOfTheEntranceToTheRoomChanged);
    on<RegisterPvzPhotoOfTheRoomChanged>(_onRegisterPvzPhotoOfTheRoomChanged);
    on<RegisterPvzPhotoOfThePlaceForShelvingChanged>(_onRegisterPvzPhotoOfThePlaceForShelvingChanged);
    on<ValidateFirstStep>(_onRegisterPvzValidateFirstStep);
    on<ValidateSecondStep>(_onRegisterPvzValidateSecondStep);
    on<Submit>(_onRegisterPvzSubmit);
  }

  void _onRegisterPvzValidateFirstStep(ValidateFirstStep event, Emitter emit) {
    emit(state.copyWith(isFirstStepValidate: true));
  }

  void _onRegisterPvzValidateSecondStep(ValidateSecondStep event, Emitter emit) {
    emit(state.copyWith(isSecondStepValidate: true));
  }

  void _onRegisterPvzSubmit(Submit event, Emitter emit) async {
    emit(state.copyWith(isLoading: true));
    final result = await _registerPvzUseCase.execute(event.request);
    result.fold(
      (failure) => emit(state.copyWith(isLoading: false, errorMessage: failure.message)),
      (success) => emit(state.copyWith(isLoading: false, successMessage: success.message ?? '')),
    );
  }

  void _onRegisterPvzStarted(RegisterPvzStarted event, Emitter emit) {
    emit(state.copyWith(isLoading: true));
  }

  void _onRegisterPvzNameChanged(RegisterPvzNameChanged event, Emitter emit) {
    emit(state.copyWith(name: event.name));
  }

  void _onRegisterPvzTotalAreaChanged(RegisterPvzTotalAreaChanged event, Emitter emit) {
    emit(state.copyWith(totalArea: event.totalArea));
  }

  void _onRegisterPvzCityChanged(RegisterPvzCityChanged event, Emitter emit) {
    emit(state.copyWith(city: event.city));
  }

  void _onRegisterPvzAddressChanged(RegisterPvzAddressChanged event, Emitter emit) {
    emit(state.copyWith(address: event.address));
  }

  void _onRegisterPvzEntranceChanged(RegisterPvzEntranceChanged event, Emitter emit) {
    emit(state.copyWith(entrance: event.entrance));
  }

  void _onRegisterPvzApartmentChanged(RegisterPvzApartmentChanged event, Emitter emit) {
    emit(state.copyWith(apartment: event.apartment));
  }

  void _onRegisterPvzFloorChanged(RegisterPvzFloorChanged event, Emitter emit) {
    emit(state.copyWith(floor: event.floor));
  }

  void _onRegisterPvzIntercomChanged(RegisterPvzIntercomChanged event, Emitter emit) {
    emit(state.copyWith(intercom: event.intercom));
  }

  void _onRegisterPvzCommentChanged(RegisterPvzCommentChanged event, Emitter emit) {
    emit(state.copyWith(comment: event.comment));
  }

  void _onRegisterPvzPhotoOfTheEntranceToTheRoomChanged(
      RegisterPvzPhotoOfTheEntranceToTheRoomChanged event, Emitter emit) {
    emit(state.copyWith(photoOfTheEntranceToTheRoom: event.photoOfTheEntranceToTheRoom));
  }

  void _onRegisterPvzPhotoOfTheRoomChanged(RegisterPvzPhotoOfTheRoomChanged event, Emitter emit) {
    emit(state.copyWith(photoOfTheRoom: event.photoOfTheRoom));
  }

  void _onRegisterPvzPhotoOfThePlaceForShelvingChanged(
      RegisterPvzPhotoOfThePlaceForShelvingChanged event, Emitter emit) {
    emit(state.copyWith(photoOfThePlaceForShelving: event.photoOfThePlaceForShelving));
  }
}
