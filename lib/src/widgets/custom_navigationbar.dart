import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_code_reader_app/providers/ui_provider.dart';

class CustomNavigationBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final uiProvider = Provider.of<UiProvider>(context);
    final currentIndex = uiProvider.selectedMenuOption;

    return BottomNavigationBar(
      elevation: 0,
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.map), title: Text('Maps')),
        BottomNavigationBarItem(
            icon: Icon(Icons.brightness_5), title: Text('Directions'))
      ],
      currentIndex: currentIndex,
      onTap: (value) => uiProvider.selectedMenuOption = value,
    );
  }
}
