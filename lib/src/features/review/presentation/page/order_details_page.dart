// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:intl/intl.dart';
// import 'package:my_point/src/app/imports.dart';
// import 'package:my_point/src/core/extensions/build_context_extension.dart';
// import 'package:my_point/src/core/extensions/item_type_extenstion.dart';
// import 'package:my_point/src/core/services/injectable/injectable_service.dart';
// import 'package:my_point/src/core/widgets/popups/sheet_popup.dart';
// import 'package:my_point/src/features/create_delivery/domain%20/enum/item_type.dart';
// import 'package:my_point/src/features/create_delivery/presentation/bloc/create_delivery_bloc.dart';
// import 'package:my_point/src/features/create_delivery/presentation/components/airport_selection_sheet.dart';
// import 'package:my_point/src/features/create_delivery/presentation/components/builde_selectable_field.dart';
// import 'package:my_point/src/features/create_delivery/presentation/components/contact_selection_sheet.dart';
// import 'package:my_point/src/features/create_delivery/presentation/components/custom_calendar.dart';
// import 'package:my_point/src/features/create_delivery/presentation/components/from_to_widget.dart';
// import 'package:my_point/src/features/create_delivery/presentation/components/item_type_widget.dart';
// import 'package:my_point/src/features/create_delivery/presentation/components/photo_upload_widget.dart';
// import 'package:my_point/src/features/create_delivery/presentation/components/section_widget.dart';

// class OrderDetailsPage extends StatelessWidget {
//   const OrderDetailsPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final TextEditingController priceController = TextEditingController();
//     final FocusNode priceFocusNode = FocusNode();
//     final GlobalKey formKey = GlobalKey<FormState>();
//     return BlocProvider(
//       create: (context) => getIt<CreateDeliveryBloc>(),
//       child: Scaffold(
//         backgroundColor: context.colors.bg,
//         appBar: AppBar(
//           title: Text('Детали заказа', style: context.typography.inter16Medium.copyWith(color: context.colors.black)),
//           centerTitle: true,
//           leading: IconButton(
//             onPressed: () {
//               context.pop();
//             },
//             icon: Icon(context.icons.chevron_left, color: context.colors.black),
//           ),
//           backgroundColor: context.colors.white,
//         ),
//         body: GestureDetector(
//           behavior: HitTestBehavior.opaque,
//           onTap: () {
//             FocusScope.of(context).unfocus();
//           },
//           child: BlocBuilder<CreateDeliveryBloc, CreateDeliveryState>(
//             builder: (context, state) {
//               return SafeArea(
//                 child: SingleChildScrollView(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       SizedBox(height: 8),
//                       Container(
//                         padding: const EdgeInsets.all(16),
//                         decoration: BoxDecoration(color: context.colors.white, borderRadius: BorderRadius.circular(16)),
//                         child: Column(
//                           mainAxisSize: MainAxisSize.min,
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             FromToWidget(),
//                             SizedBox(height: 16),
//                             BlocBuilder<CreateDeliveryBloc, CreateDeliveryState>(
//                               builder: (context, state) {
//                                 return Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     Text(
//                                       context.loc.itemType,
//                                       style: context.typography.interText14.copyWith(color: context.colors.black),
//                                     ),
//                                     SizedBox(height: 8),
//                                     SingleChildScrollView(
//                                       scrollDirection: Axis.horizontal,
//                                       child: Row(
//                                         children: (state.itemTypes ?? ItemType.values)
//                                             .map(
//                                               (itemType) => Padding(
//                                                 padding: const EdgeInsets.only(right: 8),
//                                                 child: ItemTypeWidget(
//                                                   title: itemType.getTitle(),
//                                                   itemType: itemType,
//                                                   isSelected: state.selectedItemType == itemType,
//                                                   onTap: () {
//                                                     context.read<CreateDeliveryBloc>().add(
//                                                           CreateDeliveryItemTypeSelected(itemType),
//                                                         );
//                                                   },
//                                                 ),
//                                               ),
//                                             )
//                                             .toList(),
//                                       ),
//                                     ),
//                                   ],
//                                 );
//                               },
//                             ),
//                           ],
//                         ),
//                       ),
//                       SizedBox(height: 8),
//                       Container(
//                         padding: const EdgeInsets.all(16),
//                         decoration: BoxDecoration(color: context.colors.white, borderRadius: BorderRadius.circular(16)),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             SectionWidget(
//                               title: 'Срок доставки',
//                               child: BuildeSelectableField(
//                                 isSelected: state.selectedDate != null,
//                                 placeholder: state.selectedDate != null
//                                     ? DateFormat('dd.MM.yyyy').format(state.selectedDate!)
//                                     : 'Выбрать дату',
//                                 icon: Icons.calendar_today,
//                                 onTap: () {
//                                   final bloc = context.read<CreateDeliveryBloc>();
//                                   showSheetPopup(
//                                     context,
//                                     title: Text('Выберите дату'),
//                                     builder: (context) => CustomCalendar(
//                                       firstDay: DateTime(2025, 1, 1),
//                                       lastDay: DateTime(2025, 12, 31),
//                                       selectable: true,
//                                       onDateSelected: (date) {
//                                         context.pop();
//                                         bloc.add(CreateDeliveryDateSelected(date));
//                                       },
//                                     ),
//                                   );
//                                 },
//                               ),
//                             ),
//                             SizedBox(height: 15),
//                             SectionWidget(
//                               title: 'Предлагаемая сумма за доставку',
//                               child: TextField(
//                                 key: formKey,
//                                 focusNode: priceFocusNode,
//                                 controller: priceController,
//                                 style: state.priceError != null
//                                     ? context.typography.interText16.copyWith(color: context.colors.red)
//                                     : context.typography.interText16.copyWith(color: context.colors.black),
//                                 keyboardType: TextInputType.number,
//                                 textInputAction: TextInputAction.done,
//                                 inputFormatters: [FilteringTextInputFormatter.digitsOnly],
//                                 onChanged: (value) {
//                                   context.read<CreateDeliveryBloc>().add(CreateDeliveryPriceChanged(value));
//                                 },
//                                 onSubmitted: (value) {
//                                   FocusScope.of(context).unfocus();
//                                 },
//                                 decoration: InputDecoration(
//                                   suffixIcon: priceController.text.isNotEmpty
//                                       ? GestureDetector(
//                                           onTap: () {
//                                             priceController.clear();
//                                             context.read<CreateDeliveryBloc>().add(CreateDeliveryPriceChanged(''));
//                                           },
//                                           child: Icon(Icons.delete, color: context.colors.gray),
//                                         )
//                                       : null,
//                                   fillColor: context.colors.gray100,
//                                   filled: true,
//                                   hintText: 'Минимальная цена от 5000 ₸',
//                                   hintStyle: context.typography.interText16.copyWith(color: context.colors.textGray),
//                                   errorText: state.priceError,
//                                   errorStyle: context.typography.interText14.copyWith(color: context.colors.red),
//                                   border: InputBorder.none,
//                                   enabledBorder: InputBorder.none,
//                                   focusedBorder: InputBorder.none,
//                                   errorBorder: InputBorder.none,
//                                   focusedErrorBorder: state.priceError != null
//                                       ? OutlineInputBorder(
//                                           borderRadius: BorderRadius.circular(8),
//                                           borderSide: BorderSide(color: context.colors.red),
//                                         )
//                                       : InputBorder.none,
//                                   disabledBorder: InputBorder.none,
//                                   contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 12.5),
//                                 ),
//                               ),
//                             ),
//                             SizedBox(height: 15),
//                             SectionWidget(
//                               title: 'Откуда забрать',
//                               child: BuildeSelectableField(
//                                 placeholder: state.fromAirport?.name ?? 'Выберите аэропорт',
//                                 icon: Icons.arrow_forward_ios,
//                                 isSelected: state.fromAirport != null,
//                                 onTap: () {
//                                   final bloc = context.read<CreateDeliveryBloc>();
//                                   if (state.airports.isEmpty) {
//                                     bloc.add(CreateDeliveryLoadAirports());
//                                   }
//                                   showSheetPopup(
//                                     context,
//                                     title: Text('Откуда забрать'),
//                                     builder: (context) => BlocProvider.value(
//                                       value: bloc,
//                                       child: AirportSelectionSheet(isFromAirport: true),
//                                     ),
//                                   );
//                                 },
//                               ),
//                             ),
//                             SizedBox(height: 15),
//                             SectionWidget(
//                               title: 'Куда доставить',
//                               child: BuildeSelectableField(
//                                 placeholder: state.toAirport?.name ?? 'Выберите аэропорт',
//                                 icon: Icons.arrow_forward_ios,
//                                 isSelected: state.toAirport != null,
//                                 onTap: () {
//                                   final bloc = context.read<CreateDeliveryBloc>();
//                                   if (state.airports.isEmpty) {
//                                     bloc.add(CreateDeliveryLoadAirports());
//                                   }
//                                   showSheetPopup(
//                                     context,
//                                     title: Text('Куда доставить'),
//                                     builder: (context) => BlocProvider.value(
//                                       value: bloc,
//                                       child: AirportSelectionSheet(isFromAirport: false),
//                                     ),
//                                   );
//                                 },
//                               ),
//                             ),
//                             SizedBox(height: 15),
//                             SectionWidget(
//                               title: 'Получатель',
//                               child: BuildeSelectableField(
//                                 placeholder: state.recipientName != null
//                                     ? '${state.recipientName} ${state.recipientPhone}'
//                                     : 'Выбрать получателя',
//                                 icon: Icons.arrow_forward_ios,
//                                 isSelected: state.recipientName != null,
//                                 onTap: () {
//                                   final bloc = context.read<CreateDeliveryBloc>();
//                                   showSheetPopup(
//                                     context,
//                                     title: Text('Получатель'),
//                                     builder: (context) => ContactSelectionSheet(
//                                       onContactSelected: (contact) {
//                                         final phone = contact.phones.isNotEmpty ? contact.phones.first.number : '';
//                                         bloc.add(CreateDeliveryRecipientSelected(contact.displayName, phone));
//                                       },
//                                     ),
//                                   );
//                                 },
//                               ),
//                             ),
//                             SizedBox(height: 15),
//                             SectionWidget(
//                               title: 'Мессенджер',
//                               child: BuildeSelectableField(
//                                 placeholder: 'WhatsApp/Telegram',
//                                 icon: Icons.arrow_forward_ios,
//                                 onTap: () {
//                                   showSheetPopup(
//                                     context,
//                                     title: Text('Выберите мессенджер'),
//                                     builder: (context) => Container(height: 300, color: Colors.white),
//                                   );
//                                 },
//                               ),
//                             ),
//                             SizedBox(height: 15),
//                             SectionWidget(
//                               title: 'Фотографии посылки (обязательно)',
//                               child: PhotoUploadWidget(
//                                 photos: const [],
//                                 onAddPhoto: () {
//                                   showSheetPopup(
//                                     context,
//                                     title: Text('Загрузить фото'),
//                                     builder: (context) => Container(height: 300, color: Colors.white),
//                                   );
//                                 },
//                                 onRemovePhoto: (index) {
//                                   // TODO: Remove photo at index
//                                 },
//                               ),
//                             ),
//                             SizedBox(height: 15),
//                             SectionWidget(
//                               title: 'Комментарий к перевозчику (опционально)',
//                               child: BuildeSelectableField(
//                                 placeholder: 'Комментарий',
//                                 icon: Icons.arrow_forward_ios,
//                                 onTap: () {
//                                   // TODO: Navigate to messenger selection
//                                 },
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                       SizedBox(height: 16),
//                       Padding(
//                         padding: const EdgeInsets.all(16),
//                         child: Row(
//                           children: [
//                             Expanded(
//                               child: ElevatedButton(
//                                 onPressed: () {
//                                   // TODO: Handle create delivery
//                                 },
//                                 child: Text('Сохранить изменения'),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               );
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }
