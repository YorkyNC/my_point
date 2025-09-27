import 'package:my_point/src/app/imports.dart';
import 'package:my_point/src/core/extensions/build_context_extension.dart';
import 'package:my_point/src/features/payment/presentation/bloc/payment_bloc.dart';

class KeypadButton extends StatelessWidget {
  const KeypadButton({super.key, required this.text});

  final String text;

  bool get _isBackspace => text == '⌫';
  bool get _isEmpty => text.isEmpty;

  @override
  Widget build(BuildContext context) {
    if (_isEmpty) return const SizedBox.shrink();

    return BlocBuilder<PaymentBloc, PaymentState>(
      builder: (context, state) {
        return GestureDetector(
          onTap: () => _handleTap(context, state),
          child: Container(
            height: 48,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: Colors.transparent),
            child: Center(child: _buildButtonContent(context)),
          ),
        );
      },
    );
  }

  void _handleTap(BuildContext context, PaymentState state) {
    final bloc = context.read<PaymentBloc>();

    // Add safety check to ensure we have a valid state
    if (!state.maybeWhen(
      cardsLoaded: (card) => true,
      orElse: () => false,
    )) {
      return; // Don't process input if state is not valid
    }

    if (_isBackspace) {
      bloc.add(const BackspacePressed());
    } else {
      _handleNumberInput(bloc, text, state);
    }
  }

  Widget _buildButtonContent(BuildContext context) {
    if (_isBackspace) {
      return Icon(Icons.backspace_outlined, color: context.colors.black, size: 24);
    }

    return Text(text, style: context.typography.interTitlle20Semibold.copyWith(color: context.colors.black));
  }

  void _handleNumberInput(PaymentBloc bloc, String digit, PaymentState state) {
    // Add safety check to ensure we have a valid state
    if (!state.maybeWhen(
      cardsLoaded: (card) => true,
      orElse: () => false,
    )) {
      return; // Don't process input if state is not valid
    }

    // Check which field needs input based on current state
    final card = state.maybeWhen(
      cardsLoaded: (card) => card,
      orElse: () => const PaymentViewModel(),
    );

    if (card.cardNumber.length < 16) {
      bloc.add(CardNumberChanged(digit));
    } else if (card.expiry.length < 4) {
      bloc.add(ExpiryChanged(digit));
    } else if (card.cvv.length < 3) {
      bloc.add(CvvChanged(digit));
    }
    // If all fields are full, ignore additional input
  }
}
