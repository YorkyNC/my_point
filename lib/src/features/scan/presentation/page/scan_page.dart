import 'package:flutter/material.dart';
import 'package:my_point/src/app/imports.dart';

import '../components/qr_scanner_widget.dart';
import '../services/permission_service.dart';

class ScanPage extends StatefulWidget {
  const ScanPage({super.key});

  @override
  State<ScanPage> createState() => _ScanPageState();
}

class _ScanPageState extends State<ScanPage> {
  bool _hasPermission = false;
  bool _isCheckingPermission = true;

  @override
  void initState() {
    super.initState();
    _checkPermissions();
  }

  Future<void> _checkPermissions() async {
    final hasPermission = await PermissionService.checkCameraPermission();
    setState(() {
      _hasPermission = hasPermission;
      _isCheckingPermission = false;
    });

    if (!hasPermission) {
      _requestPermission();
    }
  }

  Future<void> _requestPermission() async {
    final granted = await PermissionService.requestCameraPermission();
    setState(() {
      _hasPermission = granted;
    });

    if (!granted) {
      _showPermissionDeniedDialog();
    }
  }

  void _showPermissionDeniedDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: const Text('Camera Permission Required'),
        content: const Text(
          'This app needs camera permission to scan QR codes. '
          'Please grant permission in settings.',
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              Navigator.of(context).pop();
            },
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              // Show instruction to manually enable camera permission in settings
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Please enable camera permission in your device settings'),
                  duration: Duration(seconds: 3),
                ),
              );
            },
            child: const Text('Settings'),
          ),
        ],
      ),
    );
  }

  void _onQRCodeDetected(String qrCode) {
    _showQRCodeResult(qrCode);
  }

  void _showQRCodeResult(String qrCode) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('QR Code Detected'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Content:'),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                qrCode,
                style: const TextStyle(fontFamily: 'monospace'),
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Close'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              // Here you can add logic to copy to clipboard, open URL, etc.
              _handleQRCodeAction(qrCode);
            },
            child: const Text('Action'),
          ),
        ],
      ),
    );
  }

  void _handleQRCodeAction(String qrCode) {
    // Add your QR code handling logic here
    // For example: copy to clipboard, open URL, navigate to specific screen, etc.
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('QR Code processed: ${qrCode.length > 50 ? '${qrCode.substring(0, 50)}...' : qrCode}'),
        duration: const Duration(seconds: 3),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (_isCheckingPermission) {
      return const Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(),
              SizedBox(height: 16),
              Text('Checking permissions...'),
            ],
          ),
        ),
      );
    }

    if (!_hasPermission) {
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text('QR Scanner'),
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.camera_alt_outlined,
                  size: 64,
                  color: Colors.grey[400],
                ),
                const SizedBox(height: 16),
                Text(
                  'Camera Permission Required',
                  style: Theme.of(context).textTheme.headlineSmall,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                Text(
                  'To scan QR codes, please grant camera permission.',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Colors.grey[600],
                      ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: _requestPermission,
                  child: const Text('Grant Permission'),
                ),
              ],
            ),
          ),
        ),
      );
    }

    return QRScannerWidget(
      onQRCodeDetected: _onQRCodeDetected,
      onClose: () => context.pop(),
    );
  }
}
