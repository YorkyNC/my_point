import 'package:my_point/src/app/imports.dart';
import 'package:my_point/src/core/extensions/build_context_extension.dart';
import 'package:my_point/src/features/payment/presentation/bloc/payment_bloc.dart';

class PaymentSubmitButton extends StatelessWidget {
  const PaymentSubmitButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PaymentBloc, PaymentState>(
      builder: (context, state) {
        return Row(
          children: [
            Expanded(
              child: ElevatedButton(
                onPressed: _isEnabled(state) ? () => _handleSubmit(context) : null,
                child: _buildButtonContent(context, state),
              ),
            ),
          ],
        );
      },
    );
  }

  bool _isEnabled(PaymentState state) => state.maybeWhen(
        cardsLoaded: (card) =>
            card.cardNumber.isNotEmpty &&
            card.expiry.isNotEmpty &&
            card.cvv.isNotEmpty &&
            card.cardNumber.length >= 16 &&
            card.expiry.length >= 4 &&
            card.cvv.length >= 3,
        orElse: () => false,
      );

  void _handleSubmit(BuildContext context) {
    context.read<PaymentBloc>().add(const PaymentEvent.submitCard());
  }

  Widget _buildButtonContent(BuildContext context, PaymentState state) {
    if (state is PaymentSubmitting) {
      return SizedBox(
        width: 24,
        height: 24,
        child: CircularProgressIndicator(
          strokeWidth: 2,
          valueColor: AlwaysStoppedAnimation<Color>(context.colors.white),
        ),
      );
    }

    return Text('Привязать карту', style: context.typography.inter16Bold.copyWith(color: context.colors.white));
  }
}
