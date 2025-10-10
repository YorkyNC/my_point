import 'package:image_picker/image_picker.dart';
import 'package:my_point/src/app/imports.dart';
import 'package:my_point/src/core/extensions/build_context_extension.dart';
import 'package:my_point/src/features/register/domain/enum/photo_section_type.dart';
import 'package:my_point/src/features/register/presentation/components/image_source_selection_sheet.dart';
import 'package:my_point/src/features/register/presentation/components/register_picture_place_holder_widget.dart';
import 'package:my_point/src/features/register/presentation/page/bloc/register_pvz_bloc.dart';

class RegisterPictureParagraphWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool isSecond;
  final List<String> photos;
  final ValueChanged<List<String>> onPhotosChanged;
  final PhotoSectionType sectionType;

  const RegisterPictureParagraphWidget({
    super.key,
    required this.title,
    required this.subtitle,
    this.isSecond = false,
    this.photos = const [],
    required this.onPhotosChanged,
    required this.sectionType,
  });

  Future<void> _pickImage(BuildContext context, int index) async {
    final ImageSource? source = await ImageSourceSelectionSheet.show(context);
    if (source == null) return;
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(
      source: source,
      imageQuality: 80,
    );

    if (image != null && context.mounted) {
      final bloc = context.read<RegisterPvzBloc>();

      switch (sectionType) {
        case PhotoSectionType.entranceToRoom:
          bloc.add(AddPhotoToEntranceRoom(image.path));
          break;
        case PhotoSectionType.room:
          bloc.add(AddPhotoToRoom(image.path));
          break;
        case PhotoSectionType.shelving:
          bloc.add(AddPhotoToShelving(image.path));
          break;
      }
    }
  }

  void _removePhoto(BuildContext context, int index) {
    final bloc = context.read<RegisterPvzBloc>();

    switch (sectionType) {
      case PhotoSectionType.entranceToRoom:
        bloc.add(RemovePhotoFromEntranceRoom(index));
        break;
      case PhotoSectionType.room:
        bloc.add(RemovePhotoFromRoom(index));
        break;
      case PhotoSectionType.shelving:
        bloc.add(RemovePhotoFromShelving(index));
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 14),
        Padding(
          padding: const EdgeInsets.only(top: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: context.typography.title.copyWith(
                  color: context.colors.textprimary,
                ),
              ),
              SizedBox(height: 4),
              Text(
                subtitle,
                style: context.typography.smallParagraph.copyWith(
                  color: context.colors.textprimary,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 20),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.285,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: 5,
            separatorBuilder: (context, index) => SizedBox(width: 16),
            itemBuilder: (context, index) {
              final hasPhoto = index < photos.length;
              return RegisterPicturePlaceHolderWidget(
                onTap: () => hasPhoto ? _removePhoto(context, index) : _pickImage(context, index),
                photoPath: hasPhoto ? photos[index] : null,
              );
            },
          ),
        ),
        SizedBox(height: !isSecond ? 40 : 0),
        if (!isSecond)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Дополнительные фотографии',
                      style: context.typography.paragraph.copyWith(
                        color: context.colors.textprimary,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'Вы можете добавить дополнительные фотографии ',
                      style: context.typography.smallParagraph.copyWith(
                        color: context.colors.textprimary,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.285,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  separatorBuilder: (context, index) => SizedBox(width: 16),
                  itemBuilder: (context, index) {
                    final actualIndex = index + 5;
                    final hasPhoto = actualIndex < photos.length;
                    return RegisterPicturePlaceHolderWidget(
                      onTap: () => hasPhoto ? _removePhoto(context, actualIndex) : _pickImage(context, actualIndex),
                      photoPath: hasPhoto ? photos[actualIndex] : null,
                    );
                  },
                ),
              ),
            ],
          ),
      ],
    );
  }
}
