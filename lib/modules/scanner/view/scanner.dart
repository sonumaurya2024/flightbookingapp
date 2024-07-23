import 'dart:io';

import 'package:quiz_master/components/app_bar.dart';

import '../../../librearies.dart';

class ScannerScreen extends StatefulWidget {
  final TextEditingController textEditingController;
  const ScannerScreen({super.key, required this.textEditingController});

  @override
  State<ScannerScreen> createState() => _ScannerScreenState();
}

class _ScannerScreenState extends State<ScannerScreen> {
  Barcode? barcode;
  final qrKey = GlobalKey(debugLabel: "QR");
  QRViewController? controller;

  @override
  void reassemble() async {
    super.reassemble();
    if (Platform.isAndroid) {
      await controller!.pauseCamera();
    }
    controller!.resumeCamera();
  }

  bool status = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    status = true;
  }

  @override
  Widget build(BuildContext context) {
    return CommonScreen(
        removePaddings: true,
        appBar: CompAppBar.titleBar(title: "Scan now"),
        child: buildQrview(context));
  }

  Widget buildQrview(BuildContext context) => QRView(
        key: qrKey,
        onQRViewCreated: (control) => onQRViewCreated(control, context),
        overlay: QrScannerOverlayShape(
            borderLength: 20,
            borderRadius: 10,
            borderWidth: 10,
            borderColor: Colors.amber,
            cutOutSize: MediaQuery.of(context).size.width * 0.8),
      );

  onQRViewCreated(QRViewController controller, BuildContext context) {
    controller.scannedDataStream.listen((barcode) {
      if (status) {
        status = false;
        // sendProvider.setQRValue(barcode.code.toString());
        widget.textEditingController.text = barcode.code.toString();
        Navigator.pop(context);
      }
    });
  }
}
