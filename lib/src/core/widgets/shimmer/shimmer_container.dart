// import 'package:flutter/material.dart';
// import '../../extensions/build_context_extension.dart';
// import 'package:shimmer/shimmer.dart';

// class ShimmerContainer extends StatelessWidget {
//   final double width;
//   final double height;
//   final bool isEight;

//   const ShimmerContainer({
//     required this.width,
//     required this.height,
//     super.key,
//     this.isEight = false,
//   });

//   @override
//   Widget build(BuildContext context) {
//     final colors = context.colors;
//     return Shimmer(
//       gradient: colors.gradientGray80060090deg,
//       direction: ShimmerDirection.ltr,
//       period: const Duration(milliseconds: 1000),
//       child: Container(
//         margin: const EdgeInsets.symmetric(horizontal: 4),
//         height: height,
//         width: width,
//         decoration: BoxDecoration(
//           color: colors.gray600.withValues(alpha: 0.2),
//           borderRadius:
//               isEight ? BorderRadius.circular(8) : BorderRadius.circular(12),
//         ),
//         child: const SizedBox(),
//       ),
//     );
//   }
// }
