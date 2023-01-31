import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class GeneratedQrView extends StatefulWidget {
  const GeneratedQrView({super.key, this.qrData});
  final String? qrData;

  @override
  State<GeneratedQrView> createState() => _GeneratedQrViewState();
}

class _GeneratedQrViewState extends State<GeneratedQrView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Qr Code")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            QrImage(
              data: widget.qrData ?? "null",
              size: 256,
            ),
          ],
        ),
      ),
    );
  }
}
