import 'package:flutter_svg/svg.dart';
import 'package:my_point/src/app/imports.dart';
import 'package:my_point/src/core/extensions/build_context_extension.dart';
import 'package:my_point/src/core/router/router.dart';
import 'package:my_point/src/features/scan/presentation/page/bloc/bloc/scanner_bloc.dart';

class TorchToggleWidget extends StatelessWidget {
  final bool torchEnabled;
  final bool isBarcode;
  const TorchToggleWidget({
    required this.torchEnabled,
    this.isBarcode = false,
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
          Column(
            children: [
              if (isBarcode)
                InkWell(
                  onTap: () {
                    context.push(RoutePaths.manualBarcodeInput);
                  },
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  child: Row(
                    spacing: 12,
                    children: [
                      SvgPicture.asset(
                        context.assetImages.scanner,
                        width: 20,
                        height: 20,
                      ),
                      Text(
                        'Ввести штрих-код вручную',
                        style: context.typography.mediumParagraph.copyWith(
                          color: context.colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              SizedBox(height: 20),
              InkWell(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                child: Row(
                  spacing: 12,
                  children: [
                    Icon(
                      torchEnabled ? context.icons.camera_off : context.icons.camera,
                      color: context.colors.white,
                      size: 20,
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
                  context.read<ScannerBloc>().add(ScannerTorchToggled());
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
