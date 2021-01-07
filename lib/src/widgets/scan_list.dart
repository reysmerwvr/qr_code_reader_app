import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:meta/meta.dart';
import 'package:qr_code_reader_app/providers/scan_list_provider.dart';
import 'package:qr_code_reader_app/utils/utils.dart';

class ScanList extends StatelessWidget {
  ScanList({
    @required this.icon,
  });

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    final scanListProvider = Provider.of<ScanListProvider>(context);
    final scans = scanListProvider.scans;

    return ListView.builder(
        itemCount: scans.length,
        itemBuilder: (_, index) => Dismissible(
              key: UniqueKey(),
              background: Container(
                color: Colors.red,
              ),
              onDismissed: (DismissDirection direction) {
                Provider.of<ScanListProvider>(context, listen: false)
                    .deleteScanById(scans[index].id);
              },
              child: ListTile(
                leading: Icon(
                  this.icon,
                  color: Theme.of(context).primaryColor,
                ),
                title: Text(scans[index].value),
                subtitle: Text(scans[index].id.toString()),
                trailing: Icon(
                  Icons.keyboard_arrow_right,
                  color: Colors.grey,
                ),
                onTap: () => launchURL(context, scans[index]),
              ),
            ));
  }
}
