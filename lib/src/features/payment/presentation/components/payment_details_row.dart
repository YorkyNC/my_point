import 'package:my_point/src/app/imports.dart';
import 'package:my_point/src/features/payment/presentation/components/payment_cvv_field.dart';
import 'package:my_point/src/features/payment/presentation/components/payment_expiry_field.dart';

class PaymentDetailsRow extends StatelessWidget {
  const PaymentDetailsRow({super.key, required this.expiryControllerText, required this.cvvControllerText});
  final TextEditingController expiryControllerText;
  final TextEditingController cvvControllerText;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: ExpiryField(controllerText: expiryControllerText)),
        SizedBox(width: 12),
        Expanded(child: CvvField(controllerText: cvvControllerText)),
      ],
    );
  }
}
