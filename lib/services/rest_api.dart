class RestAPIClient {
  String? shortURL(String longURL) {
    return null;
  }
}

class UnableToShortURLException implements Exception {
  String _message;

  UnableToShortURLException(this._message);

  String errMsg() => this._message;
}
