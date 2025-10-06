import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_point/src/core/extensions/build_context_extension.dart';
import 'package:my_point/src/features/scan/presentation/page/bloc/bloc/q_r_bloc.dart';

class TorchToggleWidget extends StatelessWidget {
  final bool torchEnabled;
  const TorchToggleWidget({
    required this.torchEnabled,
    super.key,
    required this.screenSize,
    required this.scanAreaHeight,
  });

  final Size screenSize;
  final double scanAreaHeight;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: screenSize.height / 2 + scanAreaHeight / 2 + 40,
      left: 0,
      right: 0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            child: Row(
              spacing: 12,
              children: [
                Icon(
                  torchEnabled ? Icons.flash_off : Icons.flash_on,
                  color: context.colors.white,
                  size: 28,
                ),
                Text(
                  'Включить вспышку',
                  style: context.typography.mediumParagraph.copyWith(
                    color: context.colors.white,
                  ),
                )
              ],
            ),
            onTap: () {
              context.read<QRBloc>().add(ToggleTorch());
            },
          ),
        ],
      ),
    );
  }
}
