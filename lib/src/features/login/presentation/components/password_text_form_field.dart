// import 'package:flutter/material.dart';
// import '../../../../core/extensions/build_context_extension.dart';

// class PasswordTextFormField extends StatefulWidget {
//   PasswordTextFormField({
//     super.key,
//     required this.passwordController,
//     required this.isPasswordVisible,
//     this.onPasswordVisibilityChanged,
//     this.errorText = 'Пожалуйста, введите пароль',
//     this.confirm = false,
//   });

//   final TextEditingController passwordController;
//   final bool isPasswordVisible;
//   final VoidCallback? onPasswordVisibilityChanged;
//   final bool? confirm;
//   final String? errorText;

//   @override
//   State<PasswordTextFormField> createState() => _PasswordTextFormFieldState();
// }

// class _PasswordTextFormFieldState extends State<PasswordTextFormField> {
//   @override
//   Widget build(BuildContext context) {
//     return TextFormField(
//       keyboardType: TextInputType.visiblePassword,
//       controller: widget.passwordController,
//       validator: (value) {
//         if (value == null || value.isEmpty) {
//           return widget.errorText;
//         }
//         return null;
//       },
//       cursorHeight: 24,
//       style: context.typography.textmdRegular.copyWith(
//         color: context.colors.gray700,
//       ),
//       obscureText: !widget.isPasswordVisible,
//       obscuringCharacter: '*',
//       cursorColor: context.colors.brand500,
//       decoration: InputDecoration(
//         contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 14),
//         errorStyle: context.typography.textsmRegular.copyWith(
//           color: context.colors.error500,
//         ),
//         labelText: widget.confirm! ? 'Повторите пароль' : 'Пароль',
//         labelStyle: context.typography.textmdRegular.copyWith(
//           color: context.colors.gray500,
//         ),
//         floatingLabelBehavior: FloatingLabelBehavior.never,
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(8),
//           borderSide: BorderSide(color: context.colors.gray300),
//         ),
//         enabledBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(8),
//           borderSide: BorderSide(color: context.colors.gray300),
//         ),
//         focusedBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(8),
//           borderSide: BorderSide(color: context.colors.brand300),
//         ),
//         errorBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(8),
//           borderSide: BorderSide(color: context.colors.error300),
//         ),
//         suffixIcon: IconButton(
//           icon: Icon(
//               widget.isPasswordVisible ? context.icons.invisible_2 : context.icons.visible__eye_eyeball_open_view,
//               color: context.colors.gray500),
//           onPressed: () {
//             widget.onPasswordVisibilityChanged?.call();
//           },
//         ),
//       ),
//     );
//   }
// }
