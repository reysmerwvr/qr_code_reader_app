import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_code_reader_app/providers/scan_list_provider.dart';
import 'package:qr_code_reader_app/providers/ui_provider.dart';
import 'package:qr_code_reader_app/src/pages/home_page.dart';
import 'package:qr_code_reader_app/src/pages/map_page.dart';
import 'package:qr_code_reader_app/src/pages/maps_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (BuildContext _) => new UiProvider()),
        ChangeNotifierProvider(
            create: (BuildContext _) => new ScanListProvider())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'QR Reader App',
        initialRoute: 'home',
        routes: {
          'home': (BuildContext context) => HomePage(),
          'maps': (BuildContext context) => MapsPage(),
          'map': (BuildContext context) => MapPage(),
        },
        theme: ThemeData(
            primaryColor: Colors.deepPurple,
            floatingActionButtonTheme: FloatingActionButtonThemeData(
                backgroundColor: Colors.deepPurple)),
      ),
    );
  }
}
