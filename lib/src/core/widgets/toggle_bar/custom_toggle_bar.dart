import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';

class CustomSwitch extends StatelessWidget {
  final bool value;
  final Color activeColor;
  final ValueChanged<bool> onToggle;

  const CustomSwitch({
    super.key,
    required this.value,
    required this.activeColor,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return FlutterSwitch(
      width: 54.0,
      height: 28.0,
      toggleSize: 18.0,
      value: value,
      borderRadius: 32.0,
      padding: 4.0,
      activeColor: activeColor,
      inactiveColor: Colors.grey,
      onToggle: onToggle,
    );
  }
}
