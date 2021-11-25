import 'dart:typed_data';
import 'dart:html' as webFile;
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_app/config/constants.dart';
import 'package:flutter_app/services/rest_api_client.dart';


const csvButtonKey = Key('csvButtonKey');

class Csv extends StatefulWidget {
  final RestAPIClient restAPIClient;

  Csv({Key? key, required this.restAPIClient}) : super(key: key);
  @override
  _CsvState createState() => _CsvState();
}

class _CsvState extends State<Csv> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        OutlinedButton(onPressed: addCSVHandler,
            child: Text(
              Constants.CSV_BUTTON,
              key: csvButtonKey,
            )
        ),

        Flexible(
          child: Text(
              Constants.CSV_INFO,
          ),
        ),
      ],
    );
  }

  Future<void> addCSVHandler() async {
    print("handler");
    var csv = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['csv']
    );

    if (csv != null) {
      //User has added a csv file
      var csvBytes = csv.files.single.bytes ?? Uint8List(0);
      String? response = await widget.restAPIClient.shortCSV(csvBytes);
      if (response != null) {
        //Auto download csv file
        var blob = webFile.Blob([response]);
        webFile.AnchorElement(
          href: webFile.Url.createObjectUrl(blob),
        )..setAttribute("download", "file.csv")..click();
      } else {
        //TODO: CASE MALFORMED CSV SENDED
      }
    }
  }
}
