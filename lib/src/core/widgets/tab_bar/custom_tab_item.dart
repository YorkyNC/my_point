// import 'package:flutter/material.dart';
// import '../../extensions/build_context_extension.dart';
// import '../../theme/typography.dart';

// class CustomTabItem extends StatelessWidget {
//   final String label;
//   final int index;
//   final bool isSelected;
//   final Function(int) onTap;
//   final bool showIndicator;
//   final Color color;

//   const CustomTabItem({
//     super.key,
//     required this.label,
//     required this.index,
//     required this.isSelected,
//     required this.onTap,
//     this.showIndicator = false,
//     required this.color,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: () => onTap(index),
//       child: SizedBox(
//         width: 343,
//         height: 36,
//         child: Center(
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               if (showIndicator)
//                 Container(
//                   decoration: BoxDecoration(color: color),
//                   width: 18,
//                   height: 2,
//                   margin: const EdgeInsets.only(right: 4.0),
//                 ),
//               Text(label,
//                   style: isSelected
//                       ? const FigmaTextStyles().typography1Regular.copyWith(
//                             color: context.colors.black,
//                           )
//                       : const FigmaTextStyles().typography1Regular.copyWith(
//                             color: context.colors.gray600,
//                           )),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
