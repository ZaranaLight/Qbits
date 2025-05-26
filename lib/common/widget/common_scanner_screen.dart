import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:qbits/qbits.dart';
import 'package:flutter/material.dart';

class CustomQRScanner extends StatelessWidget {
  final void Function(String code) onCodeDetected;

  const CustomQRScanner({super.key, required this.onCodeDetected});

  @override
  Widget build(BuildContext context) {
    return MobileScanner(
      controller: MobileScannerController(
        detectionSpeed: DetectionSpeed.normal,
        facing: CameraFacing.external,
      ),
      onDetect: (barcodeCapture) {
        final code = barcodeCapture.barcodes.first.rawValue;
        if (code != null && code.isNotEmpty) {
          onCodeDetected(code);
        }
      },
    );
  }
}
