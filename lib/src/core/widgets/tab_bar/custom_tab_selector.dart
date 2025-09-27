// import 'package:flutter/material.dart';
// import '../../extensions/build_context_extension.dart';
// import 'custom_tab_item.dart';

// class CustomTabSelector extends StatelessWidget {
//   final String title1;
//   final String title2;
//   final bool showIndicator;
//   final int selectedIndex;
//   final Function(int) onTabSelected;
//   final Color indicatorColors;

//   const CustomTabSelector({
//     super.key,
//     required this.selectedIndex,
//     required this.onTabSelected,
//     required this.title1,
//     required this.title2,
//     required this.showIndicator,
//     required this.indicatorColors,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 4.0),
//       decoration: BoxDecoration(
//         color: const Color(0xFFF8FAFC),
//         borderRadius: BorderRadius.circular(12.0),
//       ),
//       child: Stack(
//         children: <Widget>[
//           AnimatedContainer(
//             duration: const Duration(milliseconds: 300),
//             curve: Curves.easeInOut,
//             alignment: selectedIndex == 0
//                 ? Alignment.centerLeft
//                 : Alignment.centerRight,
//             child: Container(
//               width: MediaQuery.of(context).size.width * 0.85 / 2,
//               height: 36,
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(8.0),
//               ),
//             ),
//           ),
//           Row(
//             children: <Widget>[
//               Expanded(
//                 child: CustomTabItem(
//                   label: title1,
//                   showIndicator: showIndicator,
//                   index: 0,
//                   isSelected: selectedIndex == 0,
//                   onTap: onTabSelected,
//                   color: indicatorColors,
//                 ),
//               ),
//               Expanded(
//                 child: CustomTabItem(
//                   label: title2,
//                   showIndicator: showIndicator,
//                   index: 1,
//                   isSelected: selectedIndex == 1,
//                   onTap: onTabSelected,
//                   color: context.colors.gray500,
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
