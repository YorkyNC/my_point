part of 'payment_bloc.dart';

@freezed
class PaymentEvent with _$PaymentEvent {
  const factory PaymentEvent.cardNumberChanged(String digit) = CardNumberChanged;
  const factory PaymentEvent.expiryChanged(String digit) = ExpiryChanged;
  const factory PaymentEvent.cvvChanged(String digit) = CvvChanged;
  const factory PaymentEvent.cardHolderNameChanged(String name) = CardHolderNameChanged;
  const factory PaymentEvent.backspacePressed() = BackspacePressed;
  const factory PaymentEvent.clearField(PaymentField field) = ClearField;
  const factory PaymentEvent.validateForm() = ValidateForm;
  const factory PaymentEvent.submitCard() = SubmitCard;
  const factory PaymentEvent.resetForm() = ResetForm;
  const factory PaymentEvent.loadStoredCards() = LoadStoredCards;
}
