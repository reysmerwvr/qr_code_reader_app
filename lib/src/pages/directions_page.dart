import 'package:flutter/material.dart';
import 'package:qr_code_reader_app/src/widgets/scan_list.dart';

class DirectionsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScanList(icon: Icons.home_outlined);
  }
}
