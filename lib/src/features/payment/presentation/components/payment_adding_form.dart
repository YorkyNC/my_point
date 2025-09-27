import 'package:my_point/src/app/imports.dart';
import 'package:my_point/src/core/extensions/build_context_extension.dart';
import 'package:my_point/src/features/payment/presentation/bloc/payment_bloc.dart';
import 'package:my_point/src/features/payment/presentation/components/payment_custom_keypad.dart';
import 'package:my_point/src/features/payment/presentation/components/payment_details_row.dart';
import 'package:my_point/src/features/payment/presentation/components/payment_number_field.dart';
import 'package:my_point/src/features/payment/presentation/components/payment_submit_button.dart';

class PaymentAddingForm extends StatefulWidget {
  const PaymentAddingForm({super.key});

  @override
  State<PaymentAddingForm> createState() => _PaymentAddingFormState();
}

class _PaymentAddingFormState extends State<PaymentAddingForm> {
  late final TextEditingController _cardNumberController;
  late final TextEditingController _expiryController;
  late final TextEditingController _cvvController;

  @override
  void initState() {
    super.initState();
    _cardNumberController = TextEditingController();
    _expiryController = TextEditingController();
    _cvvController = TextEditingController();
  }

  @override
  void dispose() {
    _cardNumberController.dispose();
    _expiryController.dispose();
    _cvvController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PaymentBloc, PaymentState>(
      listener: _handleStateChanges,
      builder: (context, state) {
        // Ensure we have a valid state
        final currentState = state.maybeWhen(
          cardsLoaded: (card) => state,
          orElse: () => const PaymentState.cardsLoaded(PaymentViewModel()),
        );

        return Form(
          key: GlobalKey<FormState>(), // Add a key to the form
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              PaymentNumberField(controllerText: _cardNumberController),
              const SizedBox(height: 16),
              PaymentDetailsRow(expiryControllerText: _expiryController, cvvControllerText: _cvvController),
              const SizedBox(height: 40),
              const PaymentCustomKeypad(),
              const SizedBox(height: 32),
              const PaymentSubmitButton(),
            ],
          ),
        );
      },
    );
  }

  void _handleStateChanges(BuildContext context, PaymentState state) {
    if (state is PaymentSuccess) {
      _showSuccessMessage(context);
      Navigator.of(context).pop();
    } else if (state is PaymentFailure) {
      _showErrorMessage(context, state.message);
    }
  }

  void _showSuccessMessage(BuildContext context) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: const Text('Карта успешно привязана!'), backgroundColor: context.colors.brand500));
  }

  void _showErrorMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message), backgroundColor: context.colors.red));
  }
}
