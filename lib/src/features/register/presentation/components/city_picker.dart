import 'package:my_point/src/app/imports.dart';
import 'package:my_point/src/core/extensions/build_context_extension.dart';
import 'package:my_point/src/features/register/presentation/components/address_picker.dart';

class CityPicker extends StatefulWidget {
  const CityPicker({super.key});

  @override
  State<CityPicker> createState() => _CityPickerState();
}

class _CityPickerState extends State<CityPicker> {
  final TextEditingController _addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SearchFieldWidget(addressController: _addressController),
        SizedBox(height: 20),
        ListTile(
          splashColor: Colors.transparent,
          hoverColor: Colors.transparent,
          contentPadding: EdgeInsets.zero,
          trailing: Icon(
            Icons.check_circle_sharp,
            color: context.colors.mainAccent,
          ),
          title: Text('Astana'),
          titleTextStyle: context.typography.mediumParagraph.copyWith(
            color: context.colors.textprimary,
          ),
          onTap: () {
            context.pop('Astana');
          },
        ),
      ],
    );
  }
}
