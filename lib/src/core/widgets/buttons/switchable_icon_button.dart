import 'package:flutter/material.dart';
import '../../extensions/build_context_extension.dart';
import 'custom_icon_button.dart';

class SwitchableIconButton extends StatelessWidget {
  final VoidCallback onTap;
  final GestureTapDownCallback? onTapDown;
  final GestureTapUpCallback? onTapUp;
  final bool selected;
  final IconData icon;
  final double size;
  final EdgeInsets padding;

  const SwitchableIconButton({
    super.key,
    required this.onTap,
    this.onTapDown,
    this.onTapUp,
    required this.icon,
    this.selected = false,
    this.size = 20,
    this.padding = const EdgeInsets.all(12),
  });

  @override
  Widget build(BuildContext context) {
    return CustomIconButton(
      icon: icon,
      onTap: onTap,
      onTapDown: onTapDown,
      onTapUp: onTapUp,
      backgroundColor: selected ? context.colors.brand400 : null,
      borderSide: selected ? BorderSide.none : null,
      size: size,
      padding: padding,
      iconColor: selected ? context.colors.white : null,
    );
  }
}
