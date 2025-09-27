// import 'package:flutter_svg/svg.dart';
// import 'package:my_point/src/app/imports.dart';
// import 'package:my_point/src/core/base/base_bloc/bloc/base_bloc_widget.dart';
// import 'package:my_point/src/core/extensions/build_context_extension.dart';
// import 'package:my_point/src/core/router/router.dart';
// import 'package:my_point/src/core/services/injectable/injectable_service.dart';
// import 'package:my_point/src/features/authorization/presentaion/bloc/authorization_bloc.dart';

// class AuthorizationPage extends StatefulWidget {
//   const AuthorizationPage({super.key});

//   @override
//   State<AuthorizationPage> createState() => _AuthorizationPageState();
// }

// class _AuthorizationPageState extends State<AuthorizationPage> {
//   final String phoneHeroTag = 'phone_number';
//   final TextEditingController _phoneController = TextEditingController();

//   @override
//   void initState() {
//     super.initState();
//   }

//   @override
//   void dispose() {
//     _phoneController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return BaseBlocWidget<AuthorizationBloc, AuthorizationEvent, AuthorizationState>(
//       bloc: getIt<AuthorizationBloc>(),
//       listener: (context, state) {
//         // if (state.) {
//         //   // Handle success
//         //   ScaffoldMessenger.of(context).showSnackBar(
//         //         SnackBar(
//         //             content: Text(state.errorMessage ?? '',
//         //                 style: context.typography.inter16Medium.copyWith(color: context.colors.black))),
//         //   );
//         // } else if (state.errorMessage != null) {
//         //   // Handle error
//         //   ScaffoldMessenger.of(context).showSnackBar(
//         //         SnackBar(
//         //             content: Text(state.errorMessage ?? '',
//         //                 style: context.typography.inter16Medium.copyWith(color: context.colors.black))),
//         //   );
//         // }
//       },
//       builder: (context, state, bloc) {
//         return Scaffold(
//           backgroundColor: context.colors.white,
//           body: SafeArea(
//             child: Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 16),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   SizedBox(height: 40),
//                   SvgPicture.asset(context.assetImages.jetJoin),
//                   SizedBox(height: 24),
//                   Text(
//                     'Введите свой номер телефона, чтобы получить код подтверждения.',
//                     style: context.typography.interText16.copyWith(
//                       color: context.colors.black,
//                     ),
//                   ),
//                   SizedBox(height: 16),
//                   Row(
//                     children: [
//                       InkWell(
//                         splashColor: Colors.transparent,
//                         highlightColor: Colors.transparent,
//                         onTap: () {
//                           context.push(RoutePaths.numberSearch, extra: phoneHeroTag);
//                         },
//                         child: Container(
//                           padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
//                           decoration: BoxDecoration(
//                             color: context.colors.gray100,
//                             borderRadius: BorderRadius.circular(8),
//                           ),
//                           child: Row(
//                             spacing: 8,
//                             children: [
//                               Icon(
//                                 Icons.phone_android_outlined,
//                                 color: context.colors.textGray,
//                               ),
//                               Text(
//                                 '+7',
//                                 style: context.typography.inter16Medium.copyWith(
//                                   color: context.colors.textGray,
//                                 ),
//                               ),
//                               Icon(
//                                 Icons.arrow_downward_rounded,
//                                 color: context.colors.textGray,
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                       SizedBox(width: 8),
//                       Expanded(
//                         child: TextField(
//                           onChanged: (value) => bloc.add(PhoneNumberChanged(value)),
//                           controller: _phoneController,
//                           style: context.typography.inter16Medium.copyWith(
//                             color: context.colors.black,
//                           ),
//                           keyboardType: TextInputType.phone,
//                           inputFormatters: [
//                             FilteringTextInputFormatter.digitsOnly,
//                           ],
//                           decoration: InputDecoration(
//                             isDense: true,
//                             contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
//                             filled: true,
//                             fillColor: context.colors.gray100,
//                             hintText: 'Номер телефона',
//                             hintStyle: context.typography.interText16.copyWith(
//                               color: context.colors.textGray,
//                             ),
//                             border: OutlineInputBorder(
//                               borderSide: BorderSide(
//                                 color: Colors.transparent,
//                               ),
//                               borderRadius: BorderRadius.circular(8),
//                             ),
//                             enabledBorder: OutlineInputBorder(
//                               borderSide: BorderSide(
//                                 color: Colors.transparent,
//                               ),
//                               borderRadius: BorderRadius.circular(8),
//                             ),
//                             focusedBorder: OutlineInputBorder(
//                               borderSide: BorderSide(
//                                 color: context.colors.gray200,
//                                 width: 1,
//                               ),
//                               borderRadius: BorderRadius.circular(8),
//                             ),
//                             errorBorder: OutlineInputBorder(
//                               borderSide: BorderSide(
//                                 color: context.colors.error400,
//                               ),
//                               borderRadius: BorderRadius.circular(8),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                   SizedBox(height: 16),
//                   Align(
//                     alignment: Alignment.center,
//                     child: ElevatedButton(
//                       style: ElevatedButton.styleFrom(
//                         minimumSize: Size(double.infinity, 48),
//                       ),
//                       onPressed: state.isPhoneNumberFilled
//                           ? () {
//                               bloc.add(Submit());
//                               context.push(RoutePaths.otp, extra: _phoneController.text);
//                             }
//                           : null,
//                       child: Text(
//                         context.loc.continueNext,
//                         style: context.typography.inter16Medium,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }
// }
