// import 'package:flutter/material.dart';
// import 'shimmer_container.dart';

// class ShimmerNullableWrapper<T> extends StatelessWidget {
//   final double width;
//   final double height;
//   final T? value;
//   final Widget Function(BuildContext, T) builder;

//   const ShimmerNullableWrapper({
//     required this.width,
//     required this.height,
//     this.value,
//     required this.builder,
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     final value = this.value;
//     if (value == null) {
//       return ShimmerContainer(
//         width: width,
//         height: height,
//       );
//     }
//     return builder(context, value);
//   }
// }
