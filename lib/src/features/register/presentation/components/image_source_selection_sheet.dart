import 'package:image_picker/image_picker.dart';
import 'package:my_point/src/app/imports.dart';
import 'package:my_point/src/core/extensions/build_context_extension.dart';
import 'package:my_point/src/core/widgets/popups/sheet_popup.dart';

class ImageSourceSelectionSheet extends StatelessWidget {
  const ImageSourceSelectionSheet({super.key});

  static Future<ImageSource?> show(BuildContext context) async {
    return await showSheetPopup<ImageSource>(
      context,
      backgroundColor: context.colors.white,
      title: Text(
        'Выберите источник',
        style: context.typography.title.copyWith(
          color: context.colors.textprimary,
          fontSize: 18,
        ),
      ),
      builder: (BuildContext context) {
        return const ImageSourceSelectionSheet();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ListTile(
            contentPadding: EdgeInsets.zero,
            leading: Icon(
              Icons.camera_alt,
              color: context.colors.mainAccent,
            ),
            title: Text(
              'Камера',
              style: context.typography.paragraph.copyWith(
                color: context.colors.textprimary,
              ),
            ),
            onTap: () => context.pop(ImageSource.camera),
            tileColor: context.colors.white,
          ),
          SizedBox(height: 8),
          ListTile(
            contentPadding: EdgeInsets.zero,
            leading: Icon(
              Icons.photo_library,
              color: context.colors.mainAccent,
            ),
            title: Text(
              'Галерея',
              style: context.typography.paragraph.copyWith(
                color: context.colors.textprimary,
              ),
            ),
            onTap: () => context.pop(ImageSource.gallery),
            tileColor: context.colors.white,
          ),
          SizedBox(height: 16),
        ],
      ),
    );
  }
}
