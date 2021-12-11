import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/config/constants.dart';
import 'package:flutter_app/services/api_client.dart';
import 'package:flutter_app/widgets/error_message_box.dart';


class MultipleUrl extends StatefulWidget {
  final APIClient restAPIClient;

  MultipleUrl({Key? key, required this.restAPIClient}) : super(key: key);

  @override
  _MultipleUrlState createState() =>
      _MultipleUrlState(restAPIClient: restAPIClient);
}

class _MultipleUrlState extends State<MultipleUrl> {
  final APIClient restAPIClient;
  ScrollController scrollController =  ScrollController();
  TextEditingController longURLController = TextEditingController();
  List<String> longURLList = [];
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
    var textInfo = Flexible(
      child: Text(Constants.MULTIPLE_URLS_INFO,
        style: Theme.of(context).textTheme.subtitle1,
        maxLines: 2,
      ),
    );

    var urlList = Flexible(
      flex: 2,
    child:Container(
      height: 80.0 * longURLList.length,
      child: ListView.builder(
        itemCount: longURLList.length,
        controller: scrollController,
        itemBuilder: (context, index) {
          return Card(
            child: SizedBox(
              child: ListTile(
                trailing: IconButton(
                    onPressed:() => handleDeleteLongUrl(index),
                    icon: Icon(Icons.delete_outline)),
                title: Text(longURLList[index],),
              ),
            ),
          );
        },
      ),
    ));

    var textField = Flexible(
      flex:4,
      child: TextField(
        controller: longURLController,
        decoration: const InputDecoration(
          hintText: Constants.HINT_TEXT,
        ),
      ),
    );

    var addURLButtoon =  Flexible(
      flex: 1,
      child: TextButton(onPressed: handleAddLongURL, child: Text("Add URL"),),
    );
    
    var shortButton = Flexible(
      child: SizedBox(
        height: 50,
        child: ElevatedButton(
            onPressed: handleShortMultipleURL,
            child: const Text(Constants.SHORT_BUTTON)),
      ),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const Flexible(child: SizedBox(height: 25)),
        textInfo,
        urlList,
        const Flexible(child: SizedBox(height: 25)),
        Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              textField,
              addURLButtoon,
            ],
        ),

        const Flexible(child: SizedBox(height: 25)),
        shortButton,
      ],
    );
  }

  Widget urlShortedBox() {
    var shortedLabel = Flexible(
        flex: 2,
        child: Text(
          "Shorted URL:",
          style: Theme.of(context).textTheme.subtitle2,
        )
    );

    var titleText = Flexible(
      flex: 2,
      child: Text(
        "URL shorted",
        style: Theme.of(context).textTheme.headline2,
      ),
    );

    var shortedURL = (shortURL.isEmpty)
        ? Flexible(flex:3, child: errorMessageBox(errorMessage))
        : Flexible(flex: 3, child: clipboardBox()
    );

    var originalsLabel = Flexible(
        flex: 2,
        child: Text(
          "Original URLs:",
          style: Theme.of(context).textTheme.subtitle2,
        )
    );

    var longURLs = Flexible(
      flex: 3,
      child: Container(
        height: 80.0 * longURLList.length,
        child: ListView.builder(
          itemCount: longURLList.length,
          controller: scrollController,
          itemBuilder: (context, index) {
            return Text(longURLList[index]);
          },
        ),
      ),
    );

    var goBackButton = Row(
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
    );

    var box = Container(
      decoration: BoxDecoration(
          border: Border.all(
            color: const Color.fromRGBO(197, 205, 215, 1.0),
          )),
      padding: const EdgeInsets.all(10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          titleText,
          shortedLabel,
          shortedURL,
          originalsLabel,
          longURLs,
          goBackButton,
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

  void handleAddLongURL() {
    setState(() {
      if (longURLController.text.isNotEmpty) {
        longURLList.add(longURLController.text);
      }
      longURLController.text = "";
      scrollController.animateTo(
        scrollController.position.maxScrollExtent + 80,
        curve: Curves.easeOut,
        duration: const Duration(milliseconds: 300),
      );
    });
  }

  handleDeleteLongUrl(index) {
    setState(() {
      if (index >= 0 && index < longURLList.length) {
        longURLList.removeAt(index);
      }
    });
  }
  void handleGoBack() {
    setState(() {
      displayResult = false;
      longURLController.text = "";
      longURLList.clear();
    });
  }

  void handleCopyShortURL() {
    Clipboard.setData(ClipboardData(text: shortURL));
  }

  Future<void> handleShortMultipleURL() async {
    var shortened = await restAPIClient.shortMultipleURL(longURLList);
    try {
      setState(() {
        displayResult = true;
        shortURL = shortened ?? "";
      });
    } catch(err) {
      setState((){
        displayResult = true;
        shortURL = "";
      });
    }
  }

  _MultipleUrlState({required this.restAPIClient});
}
