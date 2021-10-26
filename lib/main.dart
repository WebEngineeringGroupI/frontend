import 'package:flutter/material.dart';
import 'package:flutter_app/config/themes.dart';
import 'package:flutter_app/config/constants.dart';
import 'package:flutter_app/config/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Constants.APP_TITLE,
      theme: Themes.light(),
      initialRoute: "/",
      routes: routes(),
    );
  }
}
