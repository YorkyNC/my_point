import 'package:my_point/src/app/imports.dart';
import 'package:my_point/src/core/extensions/build_context_extension.dart';
import 'package:my_point/src/core/widgets/popups/sheet_popup.dart';
import 'package:my_point/src/features/create_delivery/presentation/components/destination_widget.dart';

class FromToWidget extends StatelessWidget {
  const FromToWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(context.loc.route, style: context.typography.interText14.copyWith(color: context.colors.black)),
        SizedBox(height: 8),
        Row(
          children: [
            DestinationWidget(
              onTap: () {
                showSheetPopup(
                  title: Text('From', style: context.typography.inter16Bold.copyWith(color: context.colors.black)),
                  context,
                  builder: (context) => SelectDestinationPopup(),
                );
              },
            ),
            SizedBox(width: 8),
            Icon(Icons.swap_horiz, color: context.colors.blue, size: 24),
            SizedBox(width: 8),
            DestinationWidget(
              onTap: () {
                showSheetPopup(
                  title: Text('To', style: context.typography.inter16Bold.copyWith(color: context.colors.black)),
                  context,
                  builder: (context) => SelectDestinationPopup(),
                );
              },
            ),
          ],
        ),
      ],
    );
  }
}

class SelectDestinationPopup extends StatelessWidget {
  const SelectDestinationPopup({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            prefixIcon: Icon(Icons.search, color: context.colors.textGray, size: 24),
            filled: true,
            fillColor: context.colors.gray100,
            hintText: 'Search',
            hintStyle: context.typography.interText14.copyWith(color: context.colors.textGray),
          ),
        ),
        SizedBox(height: 16),
      ],
    );
  }
}
