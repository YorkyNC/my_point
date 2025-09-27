import 'package:my_point/src/app/imports.dart';
import 'package:my_point/src/features/payment/presentation/bloc/payment_bloc.dart';
import 'package:my_point/src/features/payment/presentation/components/payment_adding_form.dart';

class PaymentAddingSheet extends StatelessWidget {
  const PaymentAddingSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) => PaymentBloc(), child: const PaymentAddingForm());
  }
}
