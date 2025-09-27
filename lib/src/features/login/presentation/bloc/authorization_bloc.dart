import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:my_point/src/core/base/base_bloc/bloc/base_bloc.dart';
import 'package:my_point/src/core/services/storage/storage_service_impl.dart';

part 'authorization_bloc.freezed.dart';
part 'authorization_event.dart';
part 'authorization_state.dart';

@injectable
class AuthorizationBloc extends BaseBloc<AuthorizationEvent, AuthorizationState> {
  AuthorizationBloc() : super(AuthorizationState()) {
    setUpHandlers();
  }

  final StorageServiceImpl _storageService = StorageServiceImpl();

  void setUpHandlers() {
    on<PhoneCodeChanged>(_onPhoneCodeChanged);
    on<PhoneNumberChanged>(_onPhoneNumberChanged);
    on<SignIn>(_onSignIn);
  }

  @override
  void onEventHandler(AuthorizationEvent event, Emitter emit) {
    // This method is required by BaseBloc but we're using the specific handlers
    // The actual event handling is done in the specific methods below
  }

  Future<void> _onPhoneCodeChanged(PhoneCodeChanged event, Emitter<AuthorizationState> emit) async {
    emit(state.copyWith(
      phoneCode: event.phoneCode,
      flag: event.flag,
    ));
  }

  Future<void> _onPhoneNumberChanged(PhoneNumberChanged event, Emitter<AuthorizationState> emit) async {
    emit(state.copyWith(
      phoneNumber: event.phoneNumber,
      isPhoneNumberFilled: event.phoneNumber.isNotEmpty,
    ));
  }

  Future<void> _onSignIn(SignIn event, Emitter<AuthorizationState> emit) async {
    emit(state.copyWith(
      isLoading: true,
    ));
    await Future.delayed(const Duration(seconds: 2));
    emit(state.copyWith(
      isLoading: false,
    ));
  }
}
