import 'package:flutter/material.dart';
import 'package:flutter_app/config/constants.dart';
import 'package:flutter_app/services/rest_api_client.dart';

const singleUrlInputKey = Key('singleUrlInputKey');
const singleUrlShortButton = Key("singleUrlShortButton");
const singleUrlShortenedBox = Key("singleUrlShortenedBox");

class SingleUrl extends StatefulWidget {
  final APIClient restAPIClient;

  SingleUrl({Key? key, required this.restAPIClient}) : super(key: key);

  @override
  _SingleUrlState createState() =>
      _SingleUrlState(restAPIClient: restAPIClient);
}

class _SingleUrlState extends State<SingleUrl> {
  final APIClient restAPIClient;
  TextEditingController longURLController =  TextEditingController();
  bool displayResult = false;
  String shortURL = "";

  @override
  Widget build(BuildContext context) {
    if (displayResult) {
      return urlShortedBox();
    } else {
      return urlShorteningInputBox();
    }
  }

  Widget urlShorteningInputBox() {
    var textField = Flexible(
      child: TextField(
        key: singleUrlInputKey,
        controller: longURLController,
      ),
    );

    var shortButton = Flexible(
      child: ElevatedButton(
          key: singleUrlShortButton,
          onPressed: handleShortURL,
          child: const Text(Constants.SHORT_BUTTON)),
    );

    return Column(
      children: [textField, shortButton],
    );
  }

  Widget urlShortedBox() {
    return Column(
      key: singleUrlShortenedBox,
      children: [Text(shortURL)],
    );
  }

  Future<void> handleShortURL() async {
    var shortened = await restAPIClient.shortURL(longURLController.text);
    setState(() {
      displayResult = true;
      shortURL = shortened ?? "";
    });
  }

  _SingleUrlState({required this.restAPIClient});
}
