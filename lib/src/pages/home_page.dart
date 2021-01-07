import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_code_reader_app/providers/scan_list_provider.dart';
import 'package:qr_code_reader_app/providers/ui_provider.dart';
import 'package:qr_code_reader_app/src/pages/directions_page.dart';
import 'package:qr_code_reader_app/src/pages/maps_page.dart';
import 'package:qr_code_reader_app/src/widgets/custom_navigationbar.dart';
import 'package:qr_code_reader_app/src/widgets/scan_button.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text("History"),
        actions: [
          IconButton(
              icon: Icon(Icons.delete_forever),
              onPressed: () {
                Provider.of<ScanListProvider>(context, listen: false)
                    .deleteAllScans();
              })
        ],
      ),
      body: _HomePageBody(),
      bottomNavigationBar: CustomNavigationBar(),
      floatingActionButton: ScanButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class _HomePageBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final uiProvider = Provider.of<UiProvider>(context);
    final currentIndex = uiProvider.selectedMenuOption;
    final scanListProvider =
        Provider.of<ScanListProvider>(context, listen: false);

    switch (currentIndex) {
      case 0:
        scanListProvider.loadScanByType('geo');
        return MapsPage();
      case 1:
        scanListProvider.loadScanByType('http');
        return DirectionsPage();
      default:
        return MapsPage();
    }
  }
}
