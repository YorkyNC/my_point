// import '../../../app/imports.dart';
// import '../../../core/components/appbar/custom_app_bar.dart';
// import '../../../core/extensions/build_context_extension.dart';
// import '../../../core/widgets/buttons/switchable_icon_button.dart';

// class ForgotPasswordAppBar extends StatelessWidget implements PreferredSizeWidget {
//   const ForgotPasswordAppBar({super.key});

//   @override
//   Size get preferredSize => const Size.fromHeight(60);

//   @override
//   Widget build(BuildContext context) {
//     return CustomAppBar(
//       titleWidget: Row(
//         children: [
//           SwitchableIconButton(
//             onTap: () {
//               context.pop();
//             },
//             icon: context.icons.chevron_left,
//           ),
//           const SizedBox(width: 12),
//           Text(context.loc.passwordRecovery,
//               style: context.typography.textlgBold.copyWith(
//                 color: context.colors.gray800,
//               ))
//         ],
//       ),
//     );
//   }
// }
