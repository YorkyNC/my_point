import 'package:my_point/src/app/imports.dart';
import 'package:my_point/src/features/payment/presentation/bloc/payment_bloc.dart';
import 'package:my_point/src/features/profile/presentation/components/custom_text_field.dart';

/// Expiry date input field
class ExpiryField extends StatelessWidget {
  const ExpiryField({super.key, required this.controllerText});
  final TextEditingController controllerText;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PaymentBloc, PaymentState>(
      builder: (context, state) {
        final expiry = state.maybeWhen(
          cardsLoaded: (card) => card.expiry,
          orElse: () => '',
        );

        // Format expiry as MM/YY using the utility
        final formattedExpiry = _formatExpiry(expiry);

        return CustomTextField(
          controllerText: controllerText,
          value: formattedExpiry,
          hintText: 'MM/YY',
          isValid: expiry.isNotEmpty && _isValidExpiry(expiry),
          hasContent: expiry.isNotEmpty,
          validator: (value) => _validateExpiry(value),
        );
      },
    );
  }

  String _formatExpiry(String expiry) {
    if (expiry.isEmpty) return '';
    if (expiry.length < 2) return expiry;

    // Format as MM/YY
    final month = expiry.substring(0, 2);
    final year = expiry.length >= 4 ? expiry.substring(2, 4) : expiry.substring(2);

    if (expiry.length >= 4) {
      return '$month/$year';
    } else if (expiry.length >= 2) {
      return '$month/';
    }

    return expiry;
  }

  String? _validateExpiry(String? value) {
    if (value == null || value.isEmpty) {
      return 'Введите срок действия';
    }

    // Remove slash for validation
    final cleanValue = value.replaceAll('/', '');

    if (cleanValue.length < 4) {
      return 'Срок действия должен содержать 4 цифры';
    }
    if (cleanValue.length > 4) {
      return 'Срок действия не может содержать более 4 цифр';
    }
    if (!_isValidExpiry(cleanValue)) {
      return 'Неверный формат срока действия';
    }
    return null;
  }

  bool _isValidExpiry(String expiry) {
    if (expiry.length != 4) return false;

    try {
      final month = int.parse(expiry.substring(0, 2));
      final year = int.parse(expiry.substring(2, 4));

      // Check if month is valid (1-12)
      if (month < 1 || month > 12) return false;

      // Check if year is valid (current year to current year + 20)
      final currentYear = DateTime.now().year % 100; // Get last 2 digits
      final currentMonth = DateTime.now().month;

      if (year < currentYear) return false;
      if (year == currentYear && month < currentMonth) return false;
      if (year > currentYear + 20) return false;

      return true;
    } catch (e) {
      return false;
    }
  }
}
