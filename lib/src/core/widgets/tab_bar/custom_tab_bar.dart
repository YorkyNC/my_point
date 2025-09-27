// import 'package:collection/collection.dart';
// import 'package:flutter/material.dart';
// import '../../extensions/build_context_extension.dart';

// class CustomTabBar extends StatefulWidget {
//   final TabController? controller;
//   final List<Widget> tabs;
//   final void Function(int index)? onTap;

//   const CustomTabBar({
//     super.key,
//     required this.tabs,
//     this.controller,
//     this.onTap,
//   });

//   @override
//   State<CustomTabBar> createState() => _CustomTabBarState();
// }

// class _CustomTabBarState extends State<CustomTabBar> {
//   late TabController _controller;

//   int _currIndex = 0;

//   @override
//   void didChangeDependencies() {
//     _controller = widget.controller ?? DefaultTabController.of(context);
//     _controller.addListener(_onControllerChanged);
//     super.didChangeDependencies();
//   }

//   void _onControllerChanged() {
//     setState(() {
//       _currIndex = _controller.index;
//     });
//   }

//   void _onTap(int index) {
//     widget.onTap?.call(index);
//     _controller.index = index;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.symmetric(vertical: 4),
//       decoration: BoxDecoration(
//         color: context.colors.gray100,
//         borderRadius: BorderRadius.circular(12),
//       ),
//       child: Row(
//         children: [
//           ...widget.tabs.mapIndexed(
//             (index, child) => Expanded(
//               child: Padding(
//                 padding: const EdgeInsets.symmetric(
//                   horizontal: 4,
//                 ),
//                 child: AnimatedContainer(
//                   duration: _controller.animationDuration,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(8),
//                     color: context.colors.white,
//                     border: Border.all(
//                       color: _currIndex == index
//                           ? context.colors.purple500
//                           : context.colors.white,
//                     ),
//                   ),
//                   child: Material(
//                     type: MaterialType.transparency,
//                     child: DefaultTextStyle(
//                       style: context.typography.textsmMedium.copyWith(
//                         color: context.colors.black,
//                       ),
//                       child: InkWell(
//                         borderRadius: BorderRadius.circular(8),
//                         onTap: () => _onTap(index),
//                         child: Container(
//                           alignment: Alignment.center,
//                           padding: const EdgeInsets.symmetric(
//                             vertical: 6,
//                           ),
//                           child: child,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
