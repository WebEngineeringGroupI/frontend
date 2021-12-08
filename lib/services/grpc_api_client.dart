import 'dart:typed_data';
import 'package:flutter_app/services/rest_api_client.dart';
import 'package:grpc/grpc.dart';
import 'package:genproto_dart/api/v1alpha1/url_shortener.pbgrpc.dart';

class GRPCAPIClient implements APIClient {
  final String baseUrl = "http://127.0.0.1:8080";
  final ClientChannel grpcChannel;
  late final URLShorteningClient urlShorteningClient;

  GRPCAPIClient(this.grpcChannel) {
    this.urlShorteningClient = URLShorteningClient(this.grpcChannel);
  }

  @override
  Future<String?> shortURL(String longURL) async {
    Stream<ShortURLsRequest> shortURLRequest() async* {
      yield ShortURLsRequest(url: longURL);
    }

    var shortURLs = urlShorteningClient.shortURLs(shortURLRequest());
    var urlShortened = await shortURLs.first;
    if (urlShortened.hasSuccess()) {
      return urlShortened.success.shortUrl;
    } else {
      throw urlShortened.error.error;
    }
  }

  @override
  Future<String?> shortCSV(Uint8List longCSV) async {
    var fileContents = String.fromCharCodes(longCSV);

    Stream<ShortURLsRequest> shortURLRequest() async* {
      for (var longURL in fileContents.split("\n")) {
        yield ShortURLsRequest(url: longURL);
      }
    }

    var shortURLs = urlShorteningClient.shortURLs(shortURLRequest());
    var csvContents = shortURLs
        .map((e) => e.hasSuccess()
            ? (e.success.longUrl + "," + e.success.shortUrl)
            : (e.error.url + "," + e.error.error))
        .join("\n");
    return await csvContents;
  }

  @override
  Future<String?> shortMultipleURL(List<String> longURLs) {
    // TODO: implement shortMultipleURL
    throw UnimplementedError();
  }
}
