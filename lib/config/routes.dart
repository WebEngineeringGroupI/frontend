import 'package:flutter/material.dart';
import 'package:flutter_app/screens/home.dart';
import 'package:flutter_app/services/rest_api.dart';

///This map contains the app routing
Map<String, WidgetBuilder> routes({required RestAPIClient restAPIClient}) {
  return <String, WidgetBuilder>{
    '/': (BuildContext context) => Home(restAPIClient: restAPIClient),
  };
}
