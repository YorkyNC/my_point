import 'package:flutter/material.dart';
import 'package:my_point/src/app/imports.dart';
import 'package:my_point/src/core/extensions/build_context_extension.dart';

class PhotoUploadWidget extends StatelessWidget {
  final List<String> photos;
  final VoidCallback? onAddPhoto;
  final Function(int)? onRemovePhoto;

  const PhotoUploadWidget({
    super.key,
    this.photos = const [],
    this.onAddPhoto,
    this.onRemovePhoto,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: onAddPhoto,
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 12.5),
            decoration: BoxDecoration(
              color: context.colors.gray100,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: Text(
                'Добавить фото ${photos.length}/3',
                style: context.typography.interText16.copyWith(
                  color: context.colors.blue,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 16),
        Row(
          children: List.generate(3, (index) {
            final hasPhoto = index < photos.length;
            return Expanded(
              child: Container(
                margin: EdgeInsets.only(right: index < 2 ? 8 : 0),
                height: 80,
                decoration: BoxDecoration(
                  color: context.colors.white,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: context.colors.gray300,
                    width: 1,
                    style: BorderStyle.solid,
                  ),
                ),
                child: hasPhoto
                    ? Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.network(
                              photos[index],
                              width: double.infinity,
                              height: double.infinity,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                return _buildPlaceholder(context);
                              },
                            ),
                          ),
                          if (onRemovePhoto != null)
                            Positioned(
                              top: 4,
                              right: 4,
                              child: GestureDetector(
                                onTap: () => onRemovePhoto!(index),
                                child: Container(
                                  padding: const EdgeInsets.all(2),
                                  decoration: BoxDecoration(
                                    color: context.colors.red,
                                    shape: BoxShape.circle,
                                  ),
                                  child: const Icon(
                                    Icons.close,
                                    color: Colors.white,
                                    size: 12,
                                  ),
                                ),
                              ),
                            ),
                        ],
                      )
                    : _buildPlaceholder(context),
              ),
            );
          }),
        ),
      ],
    );
  }

  Widget _buildPlaceholder(BuildContext context) {
    return Center(
      child: Icon(
        Icons.image,
        size: 32,
        color: context.colors.gray400,
      ),
    );
  }
}
