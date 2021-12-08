import 'package:flutter/material.dart';
import 'package:flutter_app/config/constants.dart';
import 'package:flutter_app/screens/csv.dart';
import 'package:flutter_app/screens/multiple_url.dart';
import 'package:flutter_app/screens/single_url.dart';
import 'package:flutter_app/services/rest_api_client.dart';

const csvTabKey = Key('csvTabKey');

/// Tab bar titles
Widget shortenerTabBar() {
  return const TabBar(tabs: [
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
      key: csvTabKey,
    ),
  ]);
}

/// Tab bar content
Widget shortenerTabBarView({required APIClient restAPIClient}) {
  return TabBarView(physics: const NeverScrollableScrollPhysics(), children: [
    SingleUrl(restAPIClient: restAPIClient),
    MultipleUrl(restAPIClient: restAPIClient),
    Csv(restAPIClient: restAPIClient)
  ]);
}
