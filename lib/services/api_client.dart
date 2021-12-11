import 'dart:typed_data';

/// API Client Interface
class APIClient {
  Future<String?> shortURL(String longURL) {
    return Future.value(null);
  }

  Future<String?> shortCSV(Uint8List longCSV) {
    return Future.value(null);
  }

  Future<String?> balanceURLs(List<String> longURLs) {
    return Future.value(null);
  }
}

class UnableToShortURLException implements Exception {
  String _message;

  UnableToShortURLException(this._message);

  String errMsg() => this._message;
}
