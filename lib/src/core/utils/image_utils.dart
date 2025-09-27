import 'package:flutter/material.dart';

/// Calculates the appropriate aspect ratio and BoxFit for an image based on its dimensions
/// and whether it's being used in a multiple selection context.
///
/// Returns a tuple containing (aspectRatio, BoxFit)
(double, BoxFit) getImageAspectRatioAndFit({
  required int width,
  required int height,
  bool isMultipleSelection = false,
}) {
  if (isMultipleSelection) {
    if (width == height) {
      return (1.0, BoxFit.cover);
    } else if (width > height) {
      return (4.0 / 3.0, BoxFit.cover);
    } else {
      return (3.0 / 4.0, BoxFit.cover);
    }
  }

  if (width == height) {
    return (1.0, BoxFit.cover);
  } else if (width > height) {
    return (4.0 / 3.0, BoxFit.cover);
  } else {
    return (3.0 / 4.0, BoxFit.cover);
  }
}

(double, BoxFit) getAspectRatioAndFit({
  required int width,
  required int height,
  bool isMultipleSelection = false,
}) {
  if (isMultipleSelection) {
    return (1.0, BoxFit.cover);
  }

  if (width == height) {
    return (1.0, BoxFit.cover);
  } else if (width > height) {
    return (4.0 / 3.0, BoxFit.cover);
  } else {
    return (3.0 / 4.0, BoxFit.cover);
  }
}

bool areAllImagesSameOrientation(List<(int, int)> dimensions) {
  if (dimensions.isEmpty) return true;

  final firstIsLandscape = dimensions[0].$1 > dimensions[0].$2;

  return dimensions.every((dim) {
    final isLandscape = dim.$1 > dim.$2;
    return isLandscape == firstIsLandscape;
  });
}

(double, BoxFit) getCommonAspectRatio(List<(int, int)> dimensions) {
  if (dimensions.isEmpty) return (1.0, BoxFit.cover);

  if (areAllImagesSameOrientation(dimensions)) {
    final firstIsLandscape = dimensions[0].$1 > dimensions[0].$2;
    return firstIsLandscape ? (4.0 / 3.0, BoxFit.cover) : (3.0 / 4.0, BoxFit.cover);
  }

  return (1.0, BoxFit.cover);
}
