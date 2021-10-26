import 'package:flutter/material.dart';
import 'package:flutter_app/screens/home.dart';

///This map contains the app routing
Map<String, WidgetBuilder> routes() {
  return <String, WidgetBuilder>{
    '/': (BuildContext context) => Home(),
  };
}
