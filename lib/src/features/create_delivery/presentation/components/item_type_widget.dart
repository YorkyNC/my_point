// import 'package:flutter/cupertino.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:my_point/src/app/imports.dart';
// import 'package:my_point/src/core/extensions/build_context_extension.dart';
// import 'package:my_point/src/core/extensions/item_type_extenstion.dart';
// import 'package:my_point/src/core/widgets/popups/sheet_popup.dart';
// import 'package:my_point/src/features/create_delivery/domain%20/enum/item_type.dart';

// class ItemTypeWidget extends StatelessWidget {
//   final ItemType itemType;
//   final VoidCallback onTap;
//   final bool isSelected;
//   final String title;

//   const ItemTypeWidget({
//     super.key,
//     required this.itemType,
//     required this.isSelected,
//     required this.onTap,
//     required this.title,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Opacity(
//       opacity: isSelected ? 1 : 0.7,
//       child: InkWell(
//         splashColor: Colors.transparent,
//         highlightColor: Colors.transparent,
//         onTap: onTap,
//         child: Container(
//           padding: const EdgeInsets.all(8),
//           decoration: BoxDecoration(
//             color: isSelected ? context.colors.gray100 : context.colors.white,
//             borderRadius: BorderRadius.circular(8),
//           ),
//           child: Stack(
//             children: [
//               Padding(
//                 padding: const EdgeInsets.only(left: 0, right: 24, top: 0, bottom: 0),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     SvgPicture.asset(
//                       itemType.getImage(context),
//                       height: 32,
//                       width: 32,
//                     ),
//                     SizedBox(height: 4),
//                     Text(itemType.name, style: context.typography.interText12.copyWith(color: context.colors.black)),
//                     SizedBox(height: 4),
//                     Text(itemType.getWeight(),
//                         style: context.typography.interText12.copyWith(color: context.colors.textGray)),
//                   ],
//                 ),
//               ),
//               Positioned(
//                 top: 0,
//                 right: 0,
//                 child: InkWell(
//                   onTap: () {
//                     showSheetPopup(
//                       context,
//                       title: Text(title, style: context.typography.inter16Bold.copyWith(color: context.colors.black)),
//                       builder: (context) => Column(
//                         mainAxisSize: MainAxisSize.min,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Container(
//                             padding: const EdgeInsets.all(16),
//                             decoration: BoxDecoration(
//                               color: context.colors.gray100,
//                               borderRadius: BorderRadius.circular(16),
//                             ),
//                             child: Column(
//                               mainAxisSize: MainAxisSize.min,
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text(
//                                   'Требования к посылке:',
//                                   style: context.typography.interText14.copyWith(
//                                     fontWeight: FontWeight.w600,
//                                     color: context.colors.black,
//                                   ),
//                                 ),
//                                 SizedBox(height: 12),
//                                 SingleChildScrollView(
//                                   child: RichText(
//                                     text: TextSpan(
//                                       style: context.typography.interText16.copyWith(color: context.colors.black),
//                                       children: itemType.getRequirementsText(itemType, context),
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                     );
//                   },
//                   child: Icon(CupertinoIcons.exclamationmark_circle, color: context.colors.gray, size: 16),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
