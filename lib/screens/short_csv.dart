import 'dart:typed_data';
import 'dart:html' as webFile;
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_app/config/constants.dart';
import 'package:flutter_app/services/api_client.dart';

const csvButtonKey = Key('csvButtonKey');

class ShortCSV extends StatefulWidget {
  final APIClient restAPIClient;

  ShortCSV({Key? key, required this.restAPIClient}) : super(key: key);
  @override
  _ShortCSVState createState() => _ShortCSVState();
}

class _ShortCSVState extends State<ShortCSV> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Flexible(child: SizedBox(height: 25)),
        Text(
          Constants.CSV_INFO,
          style: Theme.of(context).textTheme.subtitle1,
          maxLines: 2,
        ),
        const Flexible(child: SizedBox(height: 10)),
        csvShorteningBox(),
      ],
    );
  }

  Widget csvShorteningBox() {
    var border = BoxDecoration(
        border: Border.all(
      color: const Color.fromRGBO(197, 205, 215, 1.0),
    ));
    var buttonCSVselection = SizedBox(
        height: 50,
        child: OutlinedButton(
            onPressed: addCSVHandler,
            child: Text(
              Constants.CSV_BUTTON,
              key: csvButtonKey,
            )));

    var icon = Icon(Icons.upload_sharp, color: Colors.black45);

    return Container(
        decoration: border,
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                icon,
                buttonCSVselection,
              ],
            ),
          ],
        ));
  }

  Future<void> addCSVHandler() async {
    print("handler");
    var csv = await FilePicker.platform
        .pickFiles(type: FileType.custom, allowedExtensions: ['csv']);

    if (csv != null) {
      //User has added a csv file
      var csvBytes = csv.files.single.bytes ?? Uint8List(0);
      String response = await widget.restAPIClient.shortCSV(csvBytes) ?? "";
      //Auto download csv file
      var blob = webFile.Blob([response]);
      webFile.AnchorElement(
        href: webFile.Url.createObjectUrl(blob),
      )
        ..setAttribute("download", "file.csv")
        ..click();
    }
  }
}
