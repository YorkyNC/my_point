import 'package:my_point/src/app/imports.dart';
import 'package:my_point/src/core/extensions/build_context_extension.dart';
import 'package:my_point/src/features/login/presentation/bloc/authorization_bloc.dart';

class LoginTextFieldWidget extends StatelessWidget {
  const LoginTextFieldWidget({
    super.key,
    required TextEditingController controller,
    required this.bloc,
    required this.hint,
    required this.suffixIcon,
    required this.keyboardType,
    required this.onChanged,
    required this.formKey,
    this.obscureText,
    this.visibleIcon,
    this.onSuffixIconTap,
    this.error,
    this.validator,
    this.errorText,
  }) : _controller = controller;
  final String hint;
  final TextEditingController _controller;
  final AuthorizationBloc bloc;
  final IconData suffixIcon;
  final TextInputType keyboardType;
  final Function(String) onChanged;
  final GlobalKey<FormState> formKey;
  final bool? obscureText;
  final bool? visibleIcon;
  final VoidCallback? onSuffixIconTap;
  final bool? error;
  final String? Function(String?)? validator;
  final String? errorText;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: TextFormField(
        obscureText: obscureText ?? false,
        keyboardType: keyboardType,
        controller: _controller,
        onChanged: onChanged,
        validator: validator,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        decoration: InputDecoration(
          suffixIcon: onSuffixIconTap != null
              ? GestureDetector(
                  onTap: onSuffixIconTap,
                  child: Icon(suffixIcon, color: context.colors.textprimary),
                )
              : Icon(suffixIcon, color: context.colors.textprimary),
          isDense: true,
          contentPadding: EdgeInsets.symmetric(vertical: 15),
          border: UnderlineInputBorder(
            borderSide: BorderSide(
              color: error == true ? context.colors.lightErrorBorder : context.colors.lightSecondaryText,
            ),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: error == true ? context.colors.lightErrorBorder : context.colors.lightSecondaryText,
            ),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: error == true ? context.colors.lightErrorBorder : context.colors.textprimary,
              width: 1,
            ),
          ),
          errorBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: context.colors.lightErrorBorder),
          ),
          focusedErrorBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: context.colors.lightErrorBorder, width: 1),
          ),
          errorStyle: context.typography.interlinear.copyWith(
            color: context.colors.lightErrorBorder,
          ),
          errorText: errorText,
          labelStyle: context.typography.smallParagraph.copyWith(
            color: context.colors.textprimary,
          ),
          floatingLabelBehavior: FloatingLabelBehavior.never,
          hintText: hint,
          hintStyle: context.typography.smallParagraph.copyWith(
            color: context.colors.lightSecondaryText,
          ),
        ),
      ),
    );
  }
}
