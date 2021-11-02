import 'package:flutter_app/services/rest_api.dart';

class FakeRestAPIClient implements RestAPIClient {
  late String shortURLExpected;

  @override
  String? shortURL(String longURL) {
    return shortURLExpected;
  }
}
