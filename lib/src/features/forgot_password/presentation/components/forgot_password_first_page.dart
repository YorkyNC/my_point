// import '../../../../core/extensions/build_context_extension.dart';
// import '../../../login/presentation/custom_snack_bar.dart';

// import '../../../../app/imports.dart';
// import '../../../login/presentation/components/email_text_form_field.dart';

// class ForgotPasswordFirstPage extends StatefulWidget {
//   const ForgotPasswordFirstPage({
//     super.key,
//     required this.formKey,
//     required this.emailController,
//     required this.pageController,
//     required this.callback,
//   });

//   final GlobalKey<FormState> formKey;
//   final TextEditingController emailController;
//   final PageController pageController;
//   final VoidCallback callback;

//   @override
//   State<ForgotPasswordFirstPage> createState() => _ForgotPasswordFirstPageState();
// }

// class _ForgotPasswordFirstPageState extends State<ForgotPasswordFirstPage> {
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Padding(
//         padding: const EdgeInsets.symmetric(
//           vertical: 8,
//         ),
//         child: Container(
//           padding: const EdgeInsets.symmetric(
//             horizontal: 16,
//             vertical: 40,
//           ),
//           decoration: BoxDecoration(
//             color: context.colors.white,
//             borderRadius: BorderRadius.circular(12),
//           ),
//           child: Form(
//             key: widget.formKey,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   context.loc.forgotYourPassword,
//                   style: context.typography.textxlBold.copyWith(
//                     color: context.colors.black,
//                   ),
//                 ),
//                 const SizedBox(height: 4),
//                 Text(
//                   context.loc.enterYourLinkedEmailToReceiveTheLetter,
//                   style: context.typography.textmdRegular.copyWith(
//                     color: context.colors.gray500,
//                   ),
//                 ),
//                 const SizedBox(height: 20),
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       context.loc.mail,
//                       style: context.typography.textsmMedium.copyWith(
//                         color: context.colors.gray700,
//                       ),
//                     ),
//                     SizedBox(height: 6),
//                     EmailTextFormField(
//                       emailController: widget.emailController,
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: 20),
//                 Row(
//                   children: [
//                     Expanded(
//                       child: ElevatedButton(
//                           onPressed: () {
//                             if (widget.formKey.currentState!.validate()) {
//                               widget.callback();
//                             } else {
//                               ScaffoldMessenger.of(context).hideCurrentSnackBar();
//                               ScaffoldMessenger.of(context).showSnackBar(
//                                 CustomSnackBar.show(
//                                   title: 'Пожалуйста, введите корректный email',
//                                   seconds: 3,
//                                   context: context,
//                                   color: context.colors.error500,
//                                 ),
//                               );
//                             }
//                           },
//                           child: Text(context.loc.getCode)),
//                     )
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
