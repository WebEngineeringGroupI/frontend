import 'package:flutter/material.dart';
import 'package:flutter_app/screens/home.dart';
import 'package:flutter_app/services/rest_api_client.dart';

///This map contains the app routing
Map<String, WidgetBuilder> routes({required APIClient restAPIClient}) {
  return <String, WidgetBuilder>{
    '/': (BuildContext context) => Home(restAPIClient: restAPIClient),
  };
}
