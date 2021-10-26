import 'package:flutter/material.dart';
import 'package:flutter_app/config/constants.dart';

/// Tab bar titles
Widget shortenerTabBar() {
  return const TabBar(
      tabs: [
        Text(
          Constants.URL_TAB,
          maxLines: 5,
        ),
        Text(
          Constants.MULTIPLE_URLS_TAB,
          maxLines: 5,

        ),
        Text(
          Constants.CSV_TAB,
          maxLines: 5,
        ),
      ]
  );
}

/// Tab bar content
Widget shortenerTabBarView() {
  return TabBarView(
      physics: NeverScrollableScrollPhysics(),
      children: [
        Center(child: Text("SingleURL")),
        Center(child: Text("MultipleURL")),
        Center(child: Text("Csv"))
      ]
  );
}