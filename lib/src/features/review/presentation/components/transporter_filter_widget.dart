// import 'package:my_point/src/app/imports.dart';
// import 'package:my_point/src/core/extensions/build_context_extension.dart';
// import 'package:my_point/src/core/extensions/item_type_extenstion.dart';
// import 'package:my_point/src/features/create_delivery/domain%20/enum/item_type.dart';
// import 'package:my_point/src/features/create_delivery/presentation/components/from_to_widget.dart';
// import 'package:my_point/src/features/create_delivery/presentation/components/item_type_widget.dart';

// class TransporterFilterWidget extends StatelessWidget {
//   const TransporterFilterWidget({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.all(16),
//       decoration: BoxDecoration(color: context.colors.white, borderRadius: const BorderRadius.all(Radius.circular(12))),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           FromToWidget(),
//           SizedBox(height: 16),
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(context.loc.itemType, style: context.typography.interText14.copyWith(color: context.colors.black)),
//               SizedBox(height: 8),
//               SingleChildScrollView(
//                 scrollDirection: Axis.horizontal,
//                 child: Row(
//                   children: (ItemType.values)
//                       .map(
//                         (itemType) => Padding(
//                           padding: const EdgeInsets.only(right: 8),
//                           child: ItemTypeWidget(
//                             title: itemType.getTitle(),
//                             itemType: itemType,
//                             isSelected: false,
//                             onTap: () {},
//                           ),
//                         ),
//                       )
//                       .toList(),
//                 ),
//               ),
//             ],
//           ),
//           SizedBox(height: 16),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Container(
//                 padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
//                 decoration: BoxDecoration(
//                   color: context.colors.white,
//                   borderRadius: const BorderRadius.all(Radius.circular(8)),
//                   border: Border.all(color: context.colors.blue),
//                 ),
//                 child: Row(
//                   children: [
//                     Icon(Icons.filter, color: context.colors.blue),
//                     SizedBox(width: 8),
//                     Text('Фильтры', style: context.typography.interText14.copyWith(color: context.colors.black)),
//                   ],
//                 ),
//               ),
//               Row(
//                 children: [
//                   Icon(Icons.restore, color: context.colors.gray),
//                   SizedBox(width: 4),
//                   Text(
//                     maxLines: 1,
//                     overflow: TextOverflow.ellipsis,
//                     'Сбросить фильтры',
//                     style: context.typography.interText12.copyWith(color: context.colors.gray),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
