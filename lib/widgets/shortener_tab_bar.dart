import 'package:flutter/material.dart';
import 'package:flutter_app/config/constants.dart';
import 'package:flutter_app/screens/short_csv.dart';
import 'package:flutter_app/screens/balance_urls.dart';
import 'package:flutter_app/screens/short_url.dart';
import 'package:flutter_app/services/api_client.dart';

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
    ShortURL(restAPIClient: restAPIClient),
    BalanceURLs(restAPIClient: restAPIClient),
    ShortCSV(restAPIClient: restAPIClient)
  ]);
}
