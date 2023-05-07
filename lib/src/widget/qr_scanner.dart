import 'package:flutter/material.dart';
import 'package:mobile_scan/src/widget/scanner_overlay.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class QRScanner extends StatelessWidget {
  final Function(BarcodeCapture barcodes) onDetect;
  const QRScanner({
    super.key,
    required this.onDetect,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        MobileScanner(
          onDetect: onDetect,
          scanWindow: Rect.fromCenter(
            center: MediaQuery.of(context).size.center(Offset.zero),
            width: 200,
            height: 200,
          ),
        ),
        ScannerOverlay(
          overlayColour: Colors.black.withOpacity(0.5),
          width: 200,
          height: 200,
        )
      ],
    );
  }
}
