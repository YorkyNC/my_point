import 'package:flutter_multi_formatter/formatters/masked_input_formatter.dart';
import 'package:my_point/src/app/imports.dart';
import 'package:my_point/src/core/extensions/build_context_extension.dart';
import 'package:my_point/src/features/login/presentation/bloc/authorization_bloc.dart';

class AuthorizationTextFieldWidget extends StatelessWidget {
  const AuthorizationTextFieldWidget({
    super.key,
    required this.bloc,
    required TextEditingController phoneController,
    required this.onChanged,
  }) : _phoneController = phoneController;

  final AuthorizationBloc bloc;
  final Function(String) onChanged;
  final TextEditingController _phoneController;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: context.colors.lightSecondaryText,
            width: 1.0,
          ),
        ),
      ),
      child: TextField(
        onChanged: (value) => onChanged(value),
        controller: _phoneController,
        style: context.typography.smallParagraph.copyWith(
          color: context.colors.black,
        ),
        keyboardType: TextInputType.phone,
        inputFormatters: [MaskedInputFormatter('(###) ###-####')],
        decoration: InputDecoration(
          isDense: true,
          contentPadding: EdgeInsets.symmetric(vertical: 15),
          hintText: '(_ _ _) _ _ _-_ _ -_ _',
          hintStyle: context.typography.smallParagraph.copyWith(
            color: context.colors.textGray,
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.transparent,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.transparent,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.transparent,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.transparent,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    );
  }
}
