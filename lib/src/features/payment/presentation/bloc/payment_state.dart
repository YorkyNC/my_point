part of 'payment_bloc.dart';

@freezed
class PaymentState with _$PaymentState {
  const factory PaymentState.initial() = PaymentInitial;

  const factory PaymentState.validating() = PaymentValidating;

  const factory PaymentState.submitting() = PaymentSubmitting;

  const factory PaymentState.success({required String message}) = PaymentSuccess;

  const factory PaymentState.failure({required String message}) = PaymentFailure;

  const factory PaymentState.cardsLoading() = PaymentCardsLoading;

  const factory PaymentState.cardsLoaded(PaymentViewModel card) = PaymentCardsLoaded;
}

@freezed
class PaymentViewModel with _$PaymentViewModel {
  const factory PaymentViewModel({
    @Default('') String cardNumber,
    @Default('') String expiry,
    @Default('') String cvv,
    @Default('') String cardHolderName,
  }) = _PaymentViewModel;
}
