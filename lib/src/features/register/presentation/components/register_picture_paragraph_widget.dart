import 'package:my_point/src/app/imports.dart';
import 'package:my_point/src/core/extensions/build_context_extension.dart';
import 'package:my_point/src/features/register/presentation/components/register_picture_place_holder_widget.dart';

class RegisterPictureParagraphWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool isSecond;
  final List<String> photos;
  final ValueChanged<List<String>> onPhotosChanged;
  const RegisterPictureParagraphWidget({
    super.key,
    required this.title,
    required this.subtitle,
    this.isSecond = false,
    this.photos = const [],
    required this.onPhotosChanged,
  });

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
        Row(
          spacing: 16,
          children: [
            RegisterPicturePlaceHolderWidget(),
            RegisterPicturePlaceHolderWidget(),
          ],
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
              Row(
                spacing: 16,
                children: [
                  RegisterPicturePlaceHolderWidget(),
                  RegisterPicturePlaceHolderWidget(),
                ],
              ),
            ],
          ),
        // Row(
        //   children: [
        //     Expanded(
        //         child: ElevatedButton(
        //             onPressed: () {
        //               // Handle final submission
        //               context.pop();
        //             },
        //             child: Text('Завершить'))),
        //   ],
        // ),
        // SizedBox(height: 20),
      ],
    );
  }
}
