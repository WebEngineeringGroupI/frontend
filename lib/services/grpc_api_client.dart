import 'dart:typed_data';
import 'package:dio/dio.dart';
import 'package:flutter_app/services/api_client.dart';
import 'package:genproto_dart/api/v1alpha1/url_shortener.pbgrpc.dart';
import 'package:grpc/grpc_or_grpcweb.dart';

class GRPCAPIClient implements APIClient {
  late final URLShorteningClient urlShorteningClient;

  GRPCAPIClient(GrpcOrGrpcWebClientChannel grpcChannel) {
    this.urlShorteningClient = URLShorteningClient(grpcChannel);
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
  Future<String> shortCSV(Uint8List longCSV) async {
    var fileContents = String.fromCharCodes(longCSV);
    var shortCSV = <String>[];
    for( var longURL in fileContents.split("\n")) {
      if (longURL.isNotEmpty) {
        var shortURL = urlShorteningClient.shortSingleURL(ShortSingleURLRequest(url: longURL));
        shortCSV.add(await shortURL
            .then((value) => longURL + "," + value.shortUrl)
            .catchError((err) => longURL + "," + "Invalid url provided - Check it out!")
        );
      }
    }
    return shortCSV.join("\n");
  }

  @override
  Future<String?> balanceURLs(List<String> longURLs) async{
    var balanceURLs = urlShorteningClient.balanceURLs(BalanceURLsRequest(urls: longURLs));
    return await balanceURLs
        .onError((error, stackTrace) => throw error.toString())
        .then((value) => value.shortUrl);
  }
}
