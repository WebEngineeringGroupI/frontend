import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// This class groups the default app style
class Themes {
  static ThemeData light() => ThemeData(

      /// General
      fontFamily: 'Roboto',
      indicatorColor: Colors.deepPurple,

      /// TextForm decoration
      inputDecorationTheme: const InputDecorationTheme(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color.fromRGBO(197, 205, 215, 1.0),
              width: 2.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color.fromRGBO(197, 205, 215, 1.0),
              width: 2.0),
        ),
        hintStyle: TextStyle(color: Color.fromRGBO(197, 205, 215, 1.0))
      ),

      textSelectionTheme: const TextSelectionThemeData(
        cursorColor: Colors.deepPurple,
      ),

      /// Button widget
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor:MaterialStateProperty.all(Colors.deepPurple),
        )
      ),
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all(Colors.deepPurple),
        )
      ),
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
        headline2: TextStyle(
          fontSize: 20,
          color: Color.fromRGBO(41, 54, 70, 1.0),
          fontWeight: FontWeight.bold,
          overflow: TextOverflow.ellipsis,
        ),
        subtitle1: TextStyle(
          fontSize: 18,
          color: Color.fromRGBO(57, 70, 84, 1.0),
          overflow: TextOverflow.ellipsis,
        ),
      ));
}
