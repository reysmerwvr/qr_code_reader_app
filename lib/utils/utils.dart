import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:qr_code_reader_app/providers/db_provider.dart';

launchURL(BuildContext context, ScanModel scan) async {
  if (scan.type == 'http') {
    final url = scan.value;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  } else {
    Navigator.pushNamed(context, 'map', arguments: scan);
  }
}
