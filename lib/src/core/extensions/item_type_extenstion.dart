// import 'package:flutter/widgets.dart';
// import 'package:my_point/src/features/create_delivery/domain%20/enum/item_type.dart';

// import 'build_context_extension.dart';

// extension ItemTypeExtension on ItemType {
//   String get name => switch (this) {
//         ItemType.document => 'Document',
//         ItemType.box => 'Box',
//         ItemType.baggage => 'Baggage',
//         ItemType.backpack => 'Backpack',
//       };

//   TextSpan _getBulletPoint(BuildContext context) {
//     return TextSpan(
//       text: '• ',
//       style: TextStyle(
//         fontWeight: FontWeight.bold,
//         color: context.colors.black,
//       ),
//     );
//   }

//   String getImage(BuildContext context) {
//     switch (this) {
//       case ItemType.document:
//         return context.assetImages.yellowFolder;
//       case ItemType.box:
//         return context.assetImages.yellowBox;
//       case ItemType.baggage:
//         return context.assetImages.yellowSuitcase;
//       case ItemType.backpack:
//         return context.assetImages.yellowBackpack;
//     }
//   }

//   String getTitle() {
//     switch (this) {
//       case ItemType.document:
//         return 'Документы';
//       case ItemType.box:
//         return 'Коробка';
//       case ItemType.baggage:
//         return 'Багаж';
//       case ItemType.backpack:
//         return 'Рюкзак';
//     }
//   }

//   String getWeight() {
//     switch (this) {
//       case ItemType.document:
//         return 'до 2 кг';
//       case ItemType.box:
//         return 'до 8 кг';
//       case ItemType.baggage:
//         return 'до 10 кг';
//       case ItemType.backpack:
//         return 'до 20-23 кг';
//     }
//   }

//   List<TextSpan> getRequirementsText(ItemType type, BuildContext context) {
//     switch (type) {
//       case ItemType.document:
//         return [
//           _getBulletPoint(context),
//           TextSpan(
//             text: 'Максимальный размер: до формата А4 (21×29,7 см), толщина до 2 см\n\n',
//           ),
//           _getBulletPoint(context),
//           TextSpan(
//             text: 'Вес: до 2 кг\n\n',
//           ),
//           _getBulletPoint(context),
//           TextSpan(
//             text: 'Упаковка: конверт или плотная папка\n\n',
//           ),
//           _getBulletPoint(context),
//           TextSpan(
//             text:
//                 'Запрещено: паспорта, ценные бумаги, оригиналы нотариальных документов (только при наличии разрешения)\n\n',
//           ),
//           _getBulletPoint(context),
//           TextSpan(
//             text: 'Запрещено к вывозу: ',
//           ),
//           TextSpan(
//             text:
//                 'государственные документы, архивные материалы, культурные ценности, документы с государственной тайной\n',
//           ),
//         ];

//       case ItemType.box:
//         return [
//           _getBulletPoint(context),
//           TextSpan(
//             text: 'Упаковка: конверт или плотная папка\n\n',
//           ),
//           _getBulletPoint(context),
//           TextSpan(
//             text: 'Максимальный вес: до 8 кг\n\n',
//           ),
//           _getBulletPoint(context),
//           TextSpan(
//             text: 'Размеры: длина до 120 см, ширина и высота — до 80 см\n\n',
//           ),
//           _getBulletPoint(context),
//           TextSpan(
//             text: 'Упаковка: прочная коробка, исключающая повреждение содержимого\n\n',
//           ),
//           _getBulletPoint(context),
//           TextSpan(
//             text:
//                 'Запрещено: жидкости, аэрозоли, батареи, продукты питания без упаковки, хрупкие или ценные предметы без согласования\n',
//           ),
//         ];

//       case ItemType.baggage:
//         return [
//           _getBulletPoint(context),
//           TextSpan(
//             text: 'Максимальный размер: 100×75×43 см\n\n',
//           ),
//           _getBulletPoint(context),
//           TextSpan(
//             text: 'Вес: до 32 кг\n\n',
//           ),
//           _getBulletPoint(context),
//           TextSpan(
//             text: 'Упаковка: чемодан, сумка, кофр\n\n',
//           ),
//           _getBulletPoint(context),
//           TextSpan(
//             text: 'Запрещено: острые предметы, взрывчатые вещества, легковоспламеняющиеся материалы\n',
//           ),
//         ];

//       case ItemType.backpack:
//         return [
//           _getBulletPoint(context),
//           TextSpan(
//             text: 'Максимальный размер: 55×40×20 см\n\n',
//           ),
//           _getBulletPoint(context),
//           TextSpan(
//             text: 'Вес: до 10 кг\n\n',
//           ),
//           _getBulletPoint(context),
//           TextSpan(
//             text: 'Упаковка: рюкзак, сумка, пакет\n\n',
//           ),
//           _getBulletPoint(context),
//           TextSpan(
//             text: 'Запрещено: электронные устройства без защиты, стеклянные предметы\n',
//           ),
//         ];
//     }
//   }
// }
