import 'package:flutter/material.dart';
import 'package:flutter_app/config/constants.dart';

const singleUrlInputKey = Key('singleUrlInputKey');

class SingleUrl extends StatefulWidget {
  @override
  _SingleUrlState createState() => _SingleUrlState();
}

class _SingleUrlState extends State<SingleUrl> {
bool displayResult = false;
  @override
  Widget build(BuildContext context) {
    if (!displayResult) {
    return Column( children: [
      const Flexible(
        child: TextField(
          key: singleUrlInputKey,
        ),
      ),
      Flexible(
        child: ElevatedButton(onPressed: handler,
            child: Text(Constants.SHORT_BUTTON)),
      )
    ],
    );} else {
      return Container();
    }
  }

  void handler() {
    setState(() {
      displayResult = true;
    });
  }
}
