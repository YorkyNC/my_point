// import 'dart:typed_data';

// import 'package:flutter/material.dart';
// import 'adaptive_image.dart';
// import '../../../../extensions/build_context_extension.dart';

// class AdaptiveUserAvatar extends StatelessWidget {
//   const AdaptiveUserAvatar({
//     super.key,
//     required this.imageUri,
//     this.borderRadius = const BorderRadius.all(Radius.circular(8)),
//     this.size = 40.0,
//     this.fit = BoxFit.cover,
//   }) : rawData = null;

//   const AdaptiveUserAvatar.data({
//     super.key,
//     required this.rawData,
//     this.borderRadius = const BorderRadius.all(Radius.circular(8)),
//     this.size = 40.0,
//     this.fit = BoxFit.cover,
//   }) : imageUri = null;

//   final Uint8List? rawData;
//   final BoxFit fit;
//   final double? size;
//   final BorderRadius borderRadius;
//   final String? imageUri;

//   @override
//   Widget build(BuildContext context) {
//     Widget widget;
//     if (imageUri != null) {
//       widget = AdaptiveImage(
//         imageUri: imageUri!,
//         fit: fit,
//       );
//     } else if (rawData != null) {
//       widget = Image.memory(
//         rawData!,
//         fit: fit,
//       );
//     } else {
//       return Icon(
//         context.icons
//             .user_circle_single__circle_geometric_human_person_single_user,
//         size: size,
//         color: context.colors.gray500,
//       );
//     }

//     return SizedBox(
//       height: size,
//       width: size,
//       child: ClipRRect(
//         borderRadius: borderRadius,
//         child: widget,
//       ),
//     );
//   }
// }
