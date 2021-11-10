import 'package:flutter/material.dart';
import 'package:flutter_app/config/themes.dart';
import 'package:flutter_app/config/constants.dart';
import 'package:flutter_app/config/routes.dart';
import 'package:flutter_app/services/backend_rest_api_client.dart';
import 'package:flutter_app/services/rest_api_client.dart';

void main() {
  runApp(MyApp(restAPIClient: BackendRestAPIClient()));
}

class MyApp extends StatelessWidget {
  final RestAPIClient restAPIClient;

  const MyApp({Key? key, required this.restAPIClient}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Constants.APP_TITLE,
      theme: Themes.light(),
      initialRoute: "/",
      routes: routes(restAPIClient: restAPIClient),
    );
  }
}
