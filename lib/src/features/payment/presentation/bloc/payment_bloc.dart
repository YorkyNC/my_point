import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_point/src/features/payment/domain/enum/payment_field.dart';

part 'payment_bloc.freezed.dart';
part 'payment_event.dart';
part 'payment_state.dart';

class PaymentBloc extends Bloc<PaymentEvent, PaymentState> {
  PaymentBloc() : super(const PaymentState.cardsLoaded(PaymentViewModel())) {
    on<CardNumberChanged>(_onCardNumberChanged);
    on<ExpiryChanged>(_onExpiryChanged);
    on<CvvChanged>(_onCvvChanged);
    on<CardHolderNameChanged>(_onCardHolderNameChanged);
    on<BackspacePressed>(_onBackspacePressed);
    on<ClearField>(_onClearField);
    on<ValidateForm>(_onValidateForm);
    on<SubmitCard>(_onSubmitCard);
    on<ResetForm>(_onResetForm);
    on<LoadStoredCards>(_onLoadStoredCards);

    // Initialize the viewModel with the initial state
    viewModel = const PaymentViewModel();
  }

  PaymentViewModel viewModel = const PaymentViewModel();

  void _onCardNumberChanged(CardNumberChanged event, Emitter<PaymentState> emit) {
    final newCardNumber = viewModel.cardNumber + event.digit;

    if (newCardNumber.length <= CardLimits.maxCardNumberLength) {
      final updatedFormData = viewModel.copyWith(
        cardNumber: newCardNumber,
      );
      viewModel = updatedFormData;
      final fieldErrors = _validateField(PaymentField.cardNumber, newCardNumber);

      emit(
        PaymentState.cardsLoaded(updatedFormData),
      );
    }
  }

  void _onExpiryChanged(ExpiryChanged event, Emitter<PaymentState> emit) {
    final newExpiry = viewModel.expiry + event.digit;

    if (newExpiry.length <= CardLimits.maxExpiryLength) {
      final updatedFormData = viewModel.copyWith(expiry: newExpiry);
      viewModel = updatedFormData;
      final fieldErrors = _validateField(PaymentField.expiry, newExpiry);

      emit(
        PaymentState.cardsLoaded(updatedFormData),
      );
    }
  }

  void _onCvvChanged(CvvChanged event, Emitter<PaymentState> emit) {
    final newCvv = viewModel.cvv + event.digit;

    if (newCvv.length <= CardLimits.maxCvvLength) {
      final updatedFormData = viewModel.copyWith(cvv: newCvv);
      viewModel = updatedFormData;
      final fieldErrors = _validateField(PaymentField.cvv, newCvv);

      emit(
        PaymentState.cardsLoaded(updatedFormData),
      );
    }
  }

  void _onCardHolderNameChanged(CardHolderNameChanged event, Emitter<PaymentState> emit) {
    final updatedFormData = viewModel.copyWith(cardHolderName: event.name);
    viewModel = updatedFormData; // Update the instance variable
    final fieldErrors = _validateField(PaymentField.cardHolderName, event.name);

    emit(
      PaymentState.cardsLoaded(updatedFormData),
    );
  }

  void _onBackspacePressed(BackspacePressed event, Emitter<PaymentState> emit) {
    PaymentViewModel updatedFormData = viewModel;

    // Remove from the last filled field in order: CVV -> Expiry -> Card Number
    if (viewModel.cvv.isNotEmpty) {
      updatedFormData = viewModel.copyWith(cvv: viewModel.cvv.substring(0, viewModel.cvv.length - 1));
    } else if (viewModel.expiry.isNotEmpty) {
      updatedFormData = viewModel.copyWith(
        expiry: viewModel.expiry.substring(0, viewModel.expiry.length - 1),
      );
    } else if (viewModel.cardNumber.isNotEmpty) {
      updatedFormData = viewModel.copyWith(
        cardNumber: viewModel.cardNumber.substring(0, viewModel.cardNumber.length - 1),
      );
    }

    viewModel = updatedFormData; // Update the instance variable
    final fieldErrors = _validateAllFields(updatedFormData);

    emit(
      PaymentState.cardsLoaded(updatedFormData),
    );
  }

  void _onClearField(ClearField event, Emitter<PaymentState> emit) {
    PaymentViewModel updatedFormData;

    switch (event.field) {
      case PaymentField.cardNumber:
        updatedFormData = viewModel.copyWith(cardNumber: '');
        break;
      case PaymentField.expiry:
        updatedFormData = viewModel.copyWith(expiry: '');
        break;
      case PaymentField.cvv:
        updatedFormData = viewModel.copyWith(cvv: '');
        break;
      case PaymentField.cardHolderName:
        updatedFormData = viewModel.copyWith(cardHolderName: '');
        break;
    }

    viewModel = updatedFormData; // Update the instance variable
    final fieldErrors = _validateAllFields(updatedFormData);

    emit(
      PaymentState.cardsLoaded(updatedFormData),
    );
  }

  void _onValidateForm(ValidateForm event, Emitter<PaymentState> emit) {
    emit(const PaymentState.validating());

    final fieldErrors = _validateAllFields(viewModel);

    emit(
      PaymentState.cardsLoaded(viewModel),
    );
  }

  Future<void> _onSubmitCard(SubmitCard event, Emitter<PaymentState> emit) async {
    final fieldErrors = _validateAllFields(viewModel);

    if (!_isFormValid(viewModel, fieldErrors)) {
      emit(PaymentState.failure(
        message: 'Пожалуйста, заполните все поля корректно',
      ));
      return;
    }

    emit(const PaymentState.submitting());

    // TODO: Implement actual payment card saving logic
    // For now, simulate success
    await Future.delayed(const Duration(seconds: 1));
    emit(const PaymentState.success(message: 'Карта успешно добавлена'));
  }

  void _onResetForm(ResetForm event, Emitter<PaymentState> emit) {
    viewModel = const PaymentViewModel(); // Reset the viewModel
    emit(PaymentState.cardsLoaded(viewModel)); // Emit initial cardsLoaded state
  }

  Future<void> _onLoadStoredCards(LoadStoredCards event, Emitter<PaymentState> emit) async {
    emit(const PaymentState.cardsLoading());

    // TODO: Implement actual stored cards loading logic
    // For now, simulate empty cards list
    await Future.delayed(const Duration(seconds: 1));
    emit(PaymentState.cardsLoaded(PaymentViewModel()));
  }

  Map<PaymentField, String?> _validateField(PaymentField field, String value) {
    final updatedFormData = _updateFormDataField(viewModel, field, value);
    return _validateAllFields(updatedFormData);
  }

  PaymentViewModel _updateFormDataField(PaymentViewModel formData, PaymentField field, String value) {
    switch (field) {
      case PaymentField.cardNumber:
        return formData.copyWith(cardNumber: value);
      case PaymentField.expiry:
        return formData.copyWith(expiry: value);
      case PaymentField.cvv:
        return formData.copyWith(cvv: value);
      case PaymentField.cardHolderName:
        return formData.copyWith(cardHolderName: value);
    }
  }

  Map<PaymentField, String?> _validateAllFields(PaymentViewModel formData) {
    final errors = <PaymentField, String?>{};

    // Validate card number
    if (formData.cardNumber.isNotEmpty && !CardValidator.isCardNumberValid(formData.cardNumber)) {
      errors[PaymentField.cardNumber] = 'Некорректный номер карты';
    }

    // Validate expiry
    if (formData.expiry.isNotEmpty && !CardValidator.isExpiryValid(formData.expiry)) {
      errors[PaymentField.expiry] = 'Некорректная дата истечения';
    }

    // Validate CVV
    if (formData.cvv.isNotEmpty && !CardValidator.isCvvValid(formData.cvv)) {
      errors[PaymentField.cvv] = 'Некорректный CVV';
    }

    return errors;
  }

  bool _isFormValid(PaymentViewModel formData, Map<PaymentField, String?> fieldErrors) {
    return formData.cardNumber.length == CardLimits.maxCardNumberLength &&
        formData.expiry.length == CardLimits.maxExpiryLength &&
        formData.cvv.length == CardLimits.maxCvvLength &&
        fieldErrors.values.every((error) => error == null);
  }

  String _mapFailureToMessage(PaymentFailure failure) {
    // TODO: Implement proper failure mapping when PaymentFailure is defined
    return 'Произошла ошибка. Попробуйте позже';
  }
}

class PaymentException implements Exception {
  const PaymentException(this.message);

  final String message;
}

abstract class CardLimits {
  // TODO: move to constants
  static const int maxCardNumberLength = 16;
  static const int maxExpiryLength = 4;
  static const int maxCvvLength = 3;
}

abstract class CardFormatter {
  static String formatCardNumber(String number) {
    final digitsOnly = number.replaceAll(RegExp(r'[^\d]'), '');

    final buffer = StringBuffer();
    for (int i = 0; i < digitsOnly.length; i++) {
      if (i > 0 && i % 4 == 0) {
        buffer.write('-');
      }
      buffer.write(digitsOnly[i]);
    }

    return buffer.toString();
  }

  static String formatExpiry(String expiry) {
    final digitsOnly = expiry.replaceAll(RegExp(r'[^\d]'), '');

    if (digitsOnly.length >= 2) {
      return '${digitsOnly.substring(0, 2)}/${digitsOnly.substring(2)}';
    }

    return digitsOnly;
  }
}

abstract class CardValidator {
  static bool isCardNumberValid(String number) {
    final digitsOnly = number.replaceAll(RegExp(r'[^\d]'), '');

    if (digitsOnly.length != 16) return false;

    return _luhnCheck(digitsOnly);
  }

  static bool isExpiryValid(String expiry) {
    final digitsOnly = expiry.replaceAll(RegExp(r'[^\d]'), '');

    if (digitsOnly.length != 4) return false;

    final month = int.tryParse(digitsOnly.substring(0, 2));
    final year = int.tryParse(digitsOnly.substring(2, 4));

    if (month == null || year == null) return false;
    if (month < 1 || month > 12) return false;

    final now = DateTime.now();
    final currentYear = now.year % 100;
    final currentMonth = now.month;

    if (year < currentYear) return false;
    if (year == currentYear && month < currentMonth) return false;

    return true;
  }

  static bool isCvvValid(String cvv) {
    return cvv.length == 3 && int.tryParse(cvv) != null;
  }

  static bool _luhnCheck(String number) {
    int sum = 0;
    bool isEven = false;

    for (int i = number.length - 1; i >= 0; i--) {
      int digit = int.parse(number[i]);

      if (isEven) {
        digit *= 2;
        if (digit > 9) {
          digit = (digit % 10) + 1;
        }
      }

      sum += digit;
      isEven = !isEven;
    }

    return sum % 10 == 0;
  }
}

// 2. Value Objects for validation
class CardNumber extends Equatable {
  final String value;

  const CardNumber._(this.value);

  factory CardNumber.create(String value) {
    final sanitized = value.replaceAll(RegExp(r'[^\d]'), '');
    if (!CardValidator.isCardNumberValid(sanitized)) {
      throw ArgumentError('Invalid card number');
    }
    return CardNumber._(sanitized);
  }

  String get formatted => CardFormatter.formatCardNumber(value);
  String get masked => '****-****-****-${value.substring(value.length - 4)}';

  @override
  List<Object> get props => [value];
}

class ExpiryDate extends Equatable {
  final String month;
  final String year;

  const ExpiryDate._(this.month, this.year);

  factory ExpiryDate.create(String expiry) {
    final sanitized = expiry.replaceAll(RegExp(r'[^\d]'), '');
    if (sanitized.length != 4) {
      throw ArgumentError('Expiry must be 4 digits');
    }

    final month = sanitized.substring(0, 2);
    final year = sanitized.substring(2, 4);

    if (!CardValidator.isExpiryValid('$month$year')) {
      throw ArgumentError('Invalid expiry date');
    }

    return ExpiryDate._(month, year);
  }

  String get formatted => '$month/$year';
  String get value => '$month$year';

  @override
  List<Object> get props => [month, year];
}

class CVV extends Equatable {
  final String value;

  const CVV._(this.value);

  factory CVV.create(String value) {
    if (!CardValidator.isCvvValid(value)) {
      throw ArgumentError('Invalid CVV');
    }
    return CVV._(value);
  }

  @override
  List<Object> get props => [value];
}
