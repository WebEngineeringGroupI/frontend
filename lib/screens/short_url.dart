import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/config/constants.dart';
import 'package:flutter_app/services/api_client.dart';
import 'package:flutter_app/widgets/error_message_box.dart';

const singleUrlInputKey = Key('singleUrlInputKey');
const singleUrlShortButton = Key("singleUrlShortButton");
const singleUrlShortenedBox = Key("singleUrlShortenedBox");

class ShortURL extends StatefulWidget {
  final APIClient restAPIClient;

  ShortURL({Key? key, required this.restAPIClient}) : super(key: key);

  @override
  _ShortURLState createState() => _ShortURLState(restAPIClient: restAPIClient);
}

class _ShortURLState extends State<ShortURL> {
  final APIClient restAPIClient;
  TextEditingController longURLController = TextEditingController();
  bool displayResult = false;
  String shortURL = "";
  String errorMessage = "Invalid url "
      "provided - Check it out!";

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
        decoration: const InputDecoration(
          hintText: Constants.HINT_TEXT,
        ),
      ),
    );

    var shortButton = Flexible(
      child: SizedBox(
        height: 50,
        child: ElevatedButton(
            key: singleUrlShortButton,
            onPressed: handleShortURL,
            child: const Text(Constants.SHORT_BUTTON)),
      ),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const Flexible(child: SizedBox(height: 25)),
        textField,
        const Flexible(child: SizedBox(height: 25)),
        shortButton,
      ],
    );
  }

  Widget urlShortedBox() {
    var box = Container(
      decoration: BoxDecoration(
          border: Border.all(
        color: const Color.fromRGBO(197, 205, 215, 1.0),
      )),
      padding: EdgeInsets.all(10.0),
      child: Column(
        key: singleUrlShortenedBox,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            flex: 2,
            child: Text(
              "URL shorted",
              style: Theme.of(context).textTheme.headline2,
            ),
          ),
          Flexible(
              flex: 2,
              child: Text(
                "Shorted URL:",
                style: Theme.of(context).textTheme.subtitle2,
              )),
          (shortURL.isEmpty)
              ? Flexible(flex: 3, child: errorMessageBox(errorMessage))
              : Flexible(flex: 3, child: clipboardBox()),
          Flexible(
              flex: 2,
              child: Text(
                "Original URL:",
                style: Theme.of(context).textTheme.subtitle2,
              )),
          Flexible(flex: 2, child: Text(longURLController.text)),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SizedBox(
                height: 50,
                child: ElevatedButton(
                  onPressed: handleGoBack,
                  child: Text(Constants.GO_BACK_BUTTON),
                ),
              )
            ],
          )
        ],
      ),
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const Flexible(child: SizedBox(height: 25)),
        Expanded(child: box)
      ],
    );
  }

  Widget clipboardBox() {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(
        color: const Color.fromRGBO(197, 205, 215, 1.0),
      )),
      padding: EdgeInsets.symmetric(horizontal: 5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
              flex: 4,
              child: Text(
                shortURL,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              )),
          Flexible(
              child: IconButton(
                  onPressed: handleCopyShortURL, icon: const Icon(Icons.copy)))
        ],
      ),
    );
  }

  void handleGoBack() {
    setState(() {
      displayResult = false;
      longURLController.text = "";
    });
  }

  void handleCopyShortURL() {
    Clipboard.setData(ClipboardData(text: shortURL));
  }

  Future<void> handleShortURL() async {
    try {
      var shortened = await restAPIClient.shortURL(longURLController.text);
      setState(() {
        displayResult = true;
        shortURL = shortened ?? "";
      });
    } catch (err) {
      setState(() {
        displayResult = true;
        shortURL = "";
      });
    }
  }

  _ShortURLState({required this.restAPIClient});
}
