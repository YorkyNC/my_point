import 'package:my_point/src/app/imports.dart';
import 'package:my_point/src/features/payment/presentation/components/keypad_button.dart';

class PaymentCustomKeypad extends StatelessWidget {
  const PaymentCustomKeypad({super.key});

  static const List<List<String>> _keypadLayout = [
    ['1', '2', '3'],
    ['4', '5', '6'],
    ['7', '8', '9'],
    ['', '0', '⌫'],
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: _keypadLayout
          .map((row) => _buildKeypadRow(context, row))
          .expand((row) => [row, const SizedBox(height: 24)])
          .take(_keypadLayout.length * 2 - 1)
          .toList(),
    );
  }

  Widget _buildKeypadRow(BuildContext context, List<String> rowKeys) {
    return Row(
      children: rowKeys
          .map((key) => KeypadButton(text: key))
          .expand((button) => [Expanded(child: button), const SizedBox(width: 16)])
          .take(rowKeys.length * 2 - 1)
          .toList(),
    );
  }
}
