import 'package:my_point/src/app/imports.dart';
import 'package:my_point/src/core/extensions/build_context_extension.dart';
import 'package:my_point/src/features/payment/presentation/components/payment_widget.dart';

class PaymentMethodPage extends StatelessWidget {
  const PaymentMethodPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.bgWhite,
      appBar: AppBar(
        backgroundColor: context.colors.bgWhite,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            context.pop();
          },
          icon: Icon(Icons.arrow_back_ios_new, color: context.colors.black),
        ),
        title: Text(
          context.loc.paymentMethod,
          style: context.typography.inter16Bold.copyWith(color: context.colors.black),
        ),
      ),
      body: PaymentWidget(),
    );
  }
}
