import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// This class groups the default app style
class Themes {
  static ThemeData light() => ThemeData(

      /// General
      fontFamily: 'Roboto',
      indicatorColor: Colors.deepPurple,

      /// TabBar widget
      tabBarTheme: const TabBarTheme(
          labelColor: Colors.deepPurple,
          unselectedLabelColor: Color.fromRGBO(41, 54, 70, 1.0),
          labelStyle: TextStyle(fontSize: 21),
          unselectedLabelStyle: TextStyle(
            fontSize: 21,
          )),

      /// Text widget
      textTheme: const TextTheme(
        headline1: TextStyle(
          fontSize: 35,
          color: Color.fromRGBO(41, 54, 70, 1.0),
          overflow: TextOverflow.ellipsis,
        ),
        subtitle1: TextStyle(
          fontSize: 18,
          color: Color.fromRGBO(57, 70, 84, 1.0),
          overflow: TextOverflow.ellipsis,
        ),
      ));
}
