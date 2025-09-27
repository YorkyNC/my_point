import 'package:my_point/src/app/imports.dart';
import 'package:my_point/src/features/payment/presentation/bloc/payment_bloc.dart';
import 'package:my_point/src/features/profile/presentation/components/custom_text_field.dart';

class PaymentNumberField extends StatelessWidget {
  const PaymentNumberField({super.key, required this.controllerText});
  final TextEditingController controllerText;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PaymentBloc, PaymentState>(
      builder: (context, state) {
        final cardNumber = state.maybeWhen(
          cardsLoaded: (card) => card.cardNumber,
          orElse: () => '',
        );

        // Format card number with dashes using the utility
        final formattedCardNumber = _formatCardNumber(cardNumber);

        return CustomTextField(
          controllerText: controllerText,
          value: formattedCardNumber,
          hintText: 'Номер карты',
          isValid: cardNumber.isNotEmpty && cardNumber.length >= 16,
          hasContent: cardNumber.isNotEmpty,
          validator: (value) => _validateCardNumber(value),
        );
      },
    );
  }

  String _formatCardNumber(String cardNumber) {
    if (cardNumber.isEmpty) return '';

    // Use the CardFormatter utility for consistent formatting
    final buffer = StringBuffer();
    for (int i = 0; i < cardNumber.length; i++) {
      if (i > 0 && i % 4 == 0) {
        buffer.write('-');
      }
      buffer.write(cardNumber[i]);
    }

    return buffer.toString();
  }

  String? _validateCardNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Введите номер карты';
    }

    // Remove dashes for validation
    final cleanValue = value.replaceAll('-', '');

    if (cleanValue.length < 16) {
      return 'Номер карты должен содержать 16 цифр';
    }
    if (cleanValue.length > 16) {
      return 'Номер карты не может содержать более 16 цифр';
    }
    // Basic Luhn algorithm check for card number validity
    if (!_isValidLuhn(cleanValue)) {
      return 'Неверный номер карты';
    }
    return null;
  }

  bool _isValidLuhn(String cardNumber) {
    if (cardNumber.isEmpty) return false;

    int sum = 0;
    bool isEven = false;

    // Loop through values starting from the rightmost side
    for (int i = cardNumber.length - 1; i >= 0; i--) {
      int digit = int.parse(cardNumber[i]);

      if (isEven) {
        digit *= 2;
        if (digit > 9) {
          digit -= 9;
        }
      }

      sum += digit;
      isEven = !isEven;
    }

    return (sum % 10) == 0;
  }
}
