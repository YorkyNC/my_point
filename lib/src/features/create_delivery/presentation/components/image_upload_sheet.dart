import 'package:my_point/src/app/imports.dart';
import 'package:my_point/src/features/create_delivery/presentation/components/image_item_widget.dart';

class ImageUploadSheet extends StatelessWidget {
  const ImageUploadSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ImageItemWidget(
          title: 'Сделать фото',
          icon: Icons.camera_alt_outlined,
          onTap: () {
            // TODO: Upload photo
          },
        ),
        ImageItemWidget(
          title: 'Выбрать из альбома',
          icon: Icons.photo_library_outlined,
          onTap: () {
            // TODO: Upload photo
          },
        ),
      ],
    );
  }
}
