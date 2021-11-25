import 'dart:typed_data';

import 'package:flutter_app/services/rest_api_client.dart';

class FakeRestAPIClient implements RestAPIClient {
  late String shortURLExpected;

  @override
  Future<String?> shortURL(String longURL) {
    return Future<String>.value(shortURLExpected);
  }

  @override
  Future<String?> shortCSV(Uint8List longCSV) {
    throw UnimplementedError();
  }




}
