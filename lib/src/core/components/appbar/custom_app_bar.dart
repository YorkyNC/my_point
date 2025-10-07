// import '../../../app/imports.dart';
// import '../../extensions/build_context_extension.dart';
// import '../../widgets/buttons/switchable_icon_button.dart';
// import 'enum/app_bar_back_button_type.dart';

// class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
//   final String? title;
//   final TextStyle? titleStyle;
//   final String? subtitle;
//   final TextStyle? subtitleStyle;
//   final bool showBackButton;
//   final AppBarBackButtonType backButtonType;
//   final VoidCallback? onBackPressed;
//   final List<Widget> actions;
//   final Widget? leading;
//   final Widget? titleWidget;
//   final bool centerTitle;
//   final Color? backgroundColor;
//   final EdgeInsetsGeometry padding;
//   final double height;
//   final MainAxisAlignment mainAxisAlignment;
//   final CrossAxisAlignment titleCrossAlignment;
//   final PreferredSizeWidget? bottom;
//   final bool moreSpace;
//   final bool isRounded;
//   const CustomAppBar({
//     super.key,
//     this.title,
//     this.titleStyle,
//     this.subtitle,
//     this.subtitleStyle,
//     this.showBackButton = false,
//     this.backButtonType = AppBarBackButtonType.back,
//     this.onBackPressed,
//     this.actions = const [],
//     this.leading,
//     this.titleWidget,
//     this.centerTitle = false,
//     this.backgroundColor,
//     this.padding = const EdgeInsets.fromLTRB(16, 8, 16, 8),
//     this.height = 60,
//     this.mainAxisAlignment = MainAxisAlignment.spaceBetween,
//     this.titleCrossAlignment = CrossAxisAlignment.start,
//     this.bottom,
//     this.moreSpace = false,
//     this.isRounded = false,
//   });

//   @override
//   Size get preferredSize => Size.fromHeight(height + (bottom?.preferredSize.height ?? 0));

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         color: backgroundColor ?? context.colors.white,
//         borderRadius: isRounded
//             ? const BorderRadius.only(bottomLeft: Radius.circular(16), bottomRight: Radius.circular(16))
//             : null,
//       ),
//       child: SafeArea(
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Padding(
//               padding: padding,
//               child: Row(
//                 mainAxisAlignment: centerTitle ? MainAxisAlignment.center : mainAxisAlignment,
//                 children: centerTitle
//                     ? [
//                         if (showBackButton) _buildBackButton(context) else if (leading != null) leading!,
//                         if (showBackButton || leading != null)
//                           moreSpace ? const SizedBox(width: 16) : const SizedBox(width: 12),
//                         Expanded(
//                           child: Center(child: titleWidget ?? (title != null ? _buildTitleSection(context) : null)),
//                         ),
//                         if (showBackButton || leading != null)
//                           moreSpace ? const SizedBox(width: 16) : const SizedBox(width: 12),
//                         if (actions.isNotEmpty) ...actions,
//                       ]
//                     : [
//                         Expanded(
//                           child: Row(
//                             children: [
//                               if (showBackButton) _buildBackButton(context) else if (leading != null) leading!,
//                               if (showBackButton || leading != null)
//                                 moreSpace ? const SizedBox(width: 16) : const SizedBox(width: 12),
//                               if (titleWidget != null) titleWidget! else if (title != null) _buildTitleSection(context),
//                             ],
//                           ),
//                         ),
//                         Row(spacing: 8, children: actions),
//                       ],
//               ),
//             ),
//             if (bottom != null) bottom!,
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildBackButton(BuildContext context) {
//     IconData icon;

//     switch (backButtonType) {
//       case AppBarBackButtonType.back:
//         icon = context.icons.chevron_left;
//         break;
//       case AppBarBackButtonType.close:
//         icon = context.icons.delete_1__remove_add_button_buttons_delete_cross_x_mathematics_multiply_math;
//         break;
//       default:
//         icon = context.icons.chevron_left;
//     }

//     return SwitchableIconButton(icon: icon, onTap: onBackPressed ?? () => context.pop());
//   }

//   Widget _buildTitleSection(BuildContext context) {
//     if (subtitle == null) {
//       return Text(title!,
//           style: titleStyle ?? context.typography.smallParagraphMedium.copyWith(color: context.colors.black));
//     } else {
//       return Column(
//         crossAxisAlignment: titleCrossAlignment,
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Text(title!,
//               style: titleStyle ?? context.typography.smallParagraphMedium.copyWith(color: context.colors.black)),
//           Text(subtitle!,
//               style: subtitleStyle ?? context.typography.smallParagraph.copyWith(color: context.colors.black)),
//         ],
//       );
//     }
//   }
// }
