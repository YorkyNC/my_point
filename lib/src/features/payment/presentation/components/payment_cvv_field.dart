import 'package:my_point/src/app/imports.dart';
import 'package:my_point/src/features/payment/presentation/bloc/payment_bloc.dart';
import 'package:my_point/src/features/profile/presentation/components/custom_text_field.dart';

/// CVV input field
class CvvField extends StatelessWidget {
  const CvvField({super.key, required this.controllerText});
  final TextEditingController controllerText;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PaymentBloc, PaymentState>(
      builder: (context, state) {
        final cvv = state.maybeWhen(
          cardsLoaded: (card) => card.cvv,
          orElse: () => '',
        );
        return CustomTextField(
          controllerText: controllerText,
          value: cvv,
          hintText: 'CVV',
          isValid: cvv.isNotEmpty && _isValidCvv(cvv),
          hasContent: cvv.isNotEmpty,
          validator: (value) => _validateCvv(value),
        );
      },
    );
  }

  String? _validateCvv(String? value) {
    if (value == null || value.isEmpty) {
      return 'Введите CVV';
    }
    if (value.length < 3) {
      return 'CVV должен содержать 3-4 цифры';
    }
    if (value.length > 4) {
      return 'CVV не может содержать более 4 цифр';
    }
    if (!_isValidCvv(value)) {
      return 'Неверный CVV';
    }
    return null;
  }

  bool _isValidCvv(String cvv) {
    if (cvv.length < 3 || cvv.length > 4) return false;

    // Check if all characters are digits
    return RegExp(r'^\d+$').hasMatch(cvv);
  }
}
