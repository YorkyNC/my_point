import 'dart:io';

import 'package:flutter/material.dart';

class AdaptiveImage extends StatelessWidget {
  const AdaptiveImage({
    super.key,
    required this.imageUri,
    this.fit = BoxFit.cover,
  });

  final BoxFit fit;
  final String imageUri;

  @override
  Widget build(BuildContext context) {
    final ImageProvider imageProvider;
    if (imageUri.startsWith("file://") || imageUri.startsWith("/")) {
      imageProvider = FileImage(File(imageUri.replaceAll("file://", "")));
    } else {
      imageProvider = NetworkImage(imageUri);
    }
    return Image(
      image: imageProvider,
      fit: fit,
    );
  }
}
