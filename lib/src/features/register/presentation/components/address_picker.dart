import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_point/src/app/imports.dart';
import 'package:my_point/src/core/extensions/build_context_extension.dart';

class AddressPicker extends StatefulWidget {
  const AddressPicker({super.key});

  @override
  State<AddressPicker> createState() => _AddressPickerState();
}

class _AddressPickerState extends State<AddressPicker> {
  final TextEditingController _addressController = TextEditingController();

  @override
  void dispose() {
    _addressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: SearchFieldWidget(addressController: _addressController),
            ),
            SizedBox(width: 8),
            InkWell(
              splashColor: Colors.transparent,
              hoverColor: Colors.transparent,
              onTap: () {},
              child: Text(
                'Карта',
                style: context.typography.smallParagraphMedium.copyWith(
                  color: context.colors.accent2,
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 20),
        ListTile(
          leading: SvgPicture.asset(context.assetImages.mapPin),
          title: Text('улица Панфилова, 108'),
          titleTextStyle: context.typography.paragraph.copyWith(
            color: context.colors.mainAccent,
          ),
          subtitle: Text('Алматы'),
          subtitleTextStyle: context.typography.smallParagraph.copyWith(
            color: context.colors.lightSecondaryText,
          ),
          onTap: () => context.pop('улица Панфилова, 108'),
        ),
        SizedBox(height: 20),
      ],
    );
  }
}

class SearchFieldWidget extends StatelessWidget {
  const SearchFieldWidget({
    super.key,
    required TextEditingController addressController,
  }) : _addressController = addressController;

  final TextEditingController _addressController;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _addressController,
      style: context.typography.smallParagraph.copyWith(
        color: context.colors.black,
      ),
      decoration: InputDecoration(
        labelStyle: context.typography.smallParagraph.copyWith(
          color: context.colors.lightBorder,
        ),
        isDense: true,
        contentPadding: EdgeInsets.all(8),
        filled: true,
        fillColor: context.colors.gray100,
        prefixIcon: Icon(
          context.icons.magnifying_glass__glass_search_magnifying,
          size: 24,
          color: context.colors.lightSecondaryText,
        ),
        suffixIcon: Icon(
          CupertinoIcons.clear_circled_solid,
          color: context.colors.textprimary,
          size: 20,
        ),
        hintText: 'Поиск',
        hintStyle: context.typography.smallParagraph.copyWith(
          color: context.colors.lightSecondaryText,
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.transparent,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.transparent,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: context.colors.textprimary,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
