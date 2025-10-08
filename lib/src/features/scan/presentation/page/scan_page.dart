import 'package:my_point/src/app/imports.dart';
import 'package:my_point/src/core/extensions/build_context_extension.dart';
import 'package:my_point/src/core/services/injectable/injectable_service.dart';
import 'package:my_point/src/features/login/presentation/components/custom_snack_bar.dart';
import 'package:my_point/src/features/scan/presentation/page/bloc/bloc/scanner_bloc.dart';

import '../components/barcode_scanner_widget.dart';
import '../components/qr_scanner_widget.dart';
import '../components/scanner_result_dialog_widget.dart';

class ScanPage extends StatefulWidget {
  const ScanPage({super.key});

  @override
  State<ScanPage> createState() => _ScanPageState();
}

class _ScanPageState extends State<ScanPage> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late ScannerBloc _qrBloc;
  final GlobalKey<BarcodeScannerWidgetState> _barcodeKey = GlobalKey<BarcodeScannerWidgetState>();
  final GlobalKey<QRScannerWidgetState> _qrKey = GlobalKey<QRScannerWidgetState>();

  @override
  void initState() {
    super.initState();
    _qrBloc = getIt<ScannerBloc>()..add(ScannerStarted());
    _tabController = TabController(length: 2, vsync: this, initialIndex: 0);
    _tabController.addListener(_onTabChanged);
  }

  void _onTabChanged() {
    if (!_tabController.indexIsChanging && mounted) {
      _qrBloc.add(ScannerReseted());
      _qrBloc.add(ScannerStarted());

      if (_tabController.index == 0) {
        _qrKey.currentState?.stopScanning();
        Future.delayed(const Duration(milliseconds: 100), () {
          _barcodeKey.currentState?.startScanning();
        });
      } else {
        _barcodeKey.currentState?.stopScanning();
        Future.delayed(const Duration(milliseconds: 100), () {
          _qrKey.currentState?.startScanning();
        });
      }
    }
  }

  @override
  void dispose() {
    _barcodeKey.currentState?.stopScanning();
    _qrKey.currentState?.stopScanning();

    _tabController.removeListener(_onTabChanged);
    _tabController.dispose();
    _qrBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _qrBloc,
      child: BlocListener<ScannerBloc, ScannerState>(
        listener: (context, state) {
          if (state.qrCode != null && state.processedQRCode == null && !state.isLoading && state.isSuccess) {
            ScannerResultDialogWidget.show(
              context,
              code: state.qrCode!,
              isQRCode: true,
            );
            context.read<ScannerBloc>().add(ScannerReseted());
            context.read<ScannerBloc>().add(ScannerStarted());
          } else if (state.barcodeCode != null &&
              state.processedQRCode == null &&
              !state.isLoading &&
              state.isSuccess) {
            ScannerResultDialogWidget.show(
              context,
              code: state.barcodeCode!,
              isQRCode: false,
            );
            context.read<ScannerBloc>().add(ScannerReseted());
            context.read<ScannerBloc>().add(ScannerStarted());
          } else {}

          if (state.processedQRCode != null) {
            ScaffoldMessenger.of(context).showSnackBar(
              CustomSnackBar.show(
                color: context.colors.success500,
                title: state.processedQRCode!,
                seconds: 3,
                context: context,
              ),
            );
            context.read<ScannerBloc>().add(ScannerReseted());
            context.read<ScannerBloc>().add(ScannerStarted());
          }
          if (state.errorMessage != null) {
            ScaffoldMessenger.of(context).showSnackBar(
              CustomSnackBar.show(
                color: context.colors.error500,
                title: state.errorMessage!,
                seconds: 3,
                context: context,
              ),
            );
          }
        },
        child: Scaffold(
          extendBodyBehindAppBar: true,
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(20),
                bottomLeft: Radius.circular(20),
              ),
            ),
            leading: Icon(context.icons.chevron_left, size: 24),
            actions: [
              IconButton(
                onPressed: () {},
                icon: Icon(
                  context.icons.help,
                  size: 24,
                ),
              ),
            ],
            title: Text('Сканирование посылок'),
            titleTextStyle: context.typography.mediumParagraph,
            backgroundColor: context.colors.mainAccent,
            foregroundColor: context.colors.white,
            elevation: 0,
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(48),
              child: Container(
                decoration: BoxDecoration(
                  color: context.colors.mainAccent,
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                  ),
                ),
                child: TabBar(
                  dividerColor: Colors.transparent,
                  tabAlignment: TabAlignment.fill,
                  padding: EdgeInsets.zero,
                  controller: _tabController,
                  indicatorColor: context.colors.white,
                  labelColor: context.colors.white,
                  unselectedLabelColor: context.colors.white,
                  labelStyle: context.typography.semiBold2,
                  unselectedLabelStyle: context.typography.semiBold2,
                  tabs: const [
                    Tab(text: 'Штрих-код'),
                    Tab(text: 'QR-код'),
                  ],
                ),
              ),
            ),
          ),
          body: TabBarView(
            physics: const NeverScrollableScrollPhysics(),
            controller: _tabController,
            children: [
              BarcodeScannerWidget(key: _barcodeKey),
              QRScannerWidget(key: _qrKey),
            ],
          ),
        ),
      ),
    );
  }
}
