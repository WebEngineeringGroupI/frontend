import 'package:flutter/material.dart';
import 'package:flutter_app/config/constants.dart';
import 'package:flutter_app/services/rest_api.dart';

const singleUrlInputKey = Key('singleUrlInputKey');
const singleUrlShortButton = Key("singleUrlShortButton");
const singleUrlShortenedBox = Key("singleUrlShortenedBox");

class SingleUrl extends StatefulWidget {
  final RestAPIClient restAPIClient;

  SingleUrl({Key? key, required this.restAPIClient}) : super(key: key);

  @override
  _SingleUrlState createState() =>
      _SingleUrlState(restAPIClient: restAPIClient);
}

class _SingleUrlState extends State<SingleUrl> {
  final RestAPIClient restAPIClient;
  bool displayResult = false;
  String shortURL = "";
  String longURL = "";

  @override
  Widget build(BuildContext context) {
    if (displayResult) {
      return urlShortedBox();
    } else {
      return urlShorteningInputBox();
    }
  }

  Widget urlShorteningInputBox() {
    var controller = TextEditingController();
    controller.text = longURL;
    controller.selection = TextSelection.fromPosition(
      TextPosition(offset: controller.text.length),
    );

    var textField = Flexible(
      child: TextField(
        key: singleUrlInputKey,
        controller: controller,
        onChanged: (String? text) {
          setState(() {
            longURL = text == null ? "" : text;
          });
        },
      ),
    );

    var shortButton = Flexible(
      child: ElevatedButton(
          key: singleUrlShortButton,
          onPressed: handleShortURL,
          child: Text(Constants.SHORT_BUTTON)),
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

  void handleShortURL() {
    var shortened = restAPIClient.shortURL(longURL);
    setState(() {
      displayResult = true;
      shortURL = shortened == null ? "" : shortened;
    });
  }

  _SingleUrlState({required this.restAPIClient});
}
