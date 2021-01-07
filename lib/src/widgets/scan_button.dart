import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:provider/provider.dart';
import 'package:qr_code_reader_app/providers/scan_list_provider.dart';
import 'package:qr_code_reader_app/utils/utils.dart';
// import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class ScanButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      elevation: 0,
      child: Icon(Icons.filter_center_focus),
      onPressed: () async {
        String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
            '#3D8BEF', 'Cancel', false, ScanMode.QR);
        // final barcodeScanRes = 'https://github.com/reysmerwvr';
        // final barcodeScanRes = 'geo:4.675796139413248, -74.04450906733376';
        if (barcodeScanRes == '-1') {
          return;
        }
        final scanListProvider =
            Provider.of<ScanListProvider>(context, listen: false);
        final newScan = await scanListProvider.newScan(barcodeScanRes);
        launchURL(context, newScan);
      },
    );
  }
}
