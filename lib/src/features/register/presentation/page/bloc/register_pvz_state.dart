part of 'register_pvz_bloc.dart';

@freezed
abstract class RegisterPvzState with _$RegisterPvzState {
  const RegisterPvzState._();
  const factory RegisterPvzState({
    @Default(false) bool isFirstStepValidate,
    @Default(false) bool isSecondStepValidate,
    @Default(false) bool isLoading,
    @Default(false) bool isSuccess,
    @Default(false) bool isError,
    String? name,
    String? totalArea,
    String? city,
    String? address,
    String? entrance,
    String? apartment,
    String? floor,
    String? intercom,
    String? comment,
    List<String>? photoOfTheEntranceToTheRoom,
    List<String>? photoOfTheRoom,
    List<String>? photoOfThePlaceForShelving,
    String? errorMessage,
    String? successMessage,
  }) = _RegisterPvzState;

  bool get isFirstStepValid {
    return (name?.isNotEmpty ?? false) && (totalArea?.isNotEmpty ?? false);
  }

  bool get isSecondStepValid {
    return (photoOfTheEntranceToTheRoom?.isNotEmpty ?? false) &&
        (photoOfTheRoom?.isNotEmpty ?? false) &&
        (photoOfThePlaceForShelving?.isNotEmpty ?? false);
  }
}
