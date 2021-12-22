import 'dart:typed_data';

import 'package:flutter_app/services/grpc_api_client.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:grpc/grpc_or_grpcweb.dart';

void main() {
  test("when the grpc client is asked to short a csv, it shortens it correctly",
      () async {
    GrpcOrGrpcWebClientChannel channel =
        GrpcOrGrpcWebClientChannel.toSingleEndpoint(
            host: "grpc.webeng.ovh", port: 443, transportSecure: true);
    var client = GRPCAPIClient(channel);
    var shortCSV = await client.shortCSV(csvContents());

    expect(
        shortCSV,
        'https://google.com,https://webeng.ovh/r/cv6VxVdu\n'
        'https://youtube.com,https://webeng.ovh/r/unW6a4Dd');
  });
  test("when the csv contains an empty url", () async {
    GrpcOrGrpcWebClientChannel channel =
        GrpcOrGrpcWebClientChannel.toSingleEndpoint(
            host: "grpc.webeng.ovh", port: 443, transportSecure: true);
    var client = GRPCAPIClient(channel);
    var shortCSV = await client.shortCSV(csvContentsWithEmptyLine());
    await channel.shutdown();

    expect(
        shortCSV,
        'https://google.com,https://webeng.ovh/r/cv6VxVdu\n'
        ',empty URL provided');
  });

  test("when the csv contains an invalid url", () async {
    GrpcOrGrpcWebClientChannel channel =
        GrpcOrGrpcWebClientChannel.toSingleEndpoint(
            host: "grpc.webeng.ovh", port: 443, transportSecure: true);
    var client = GRPCAPIClient(channel);
    var shortCSV = await client.shortCSV(csvContentsWithInvalidURL());
    await channel.shutdown();

    expect(
        shortCSV,
        'https://google.com,https://webeng.ovh/r/cv6VxVdu\n'
        'ftp://youtube.com,invalid long URL specified');
  });

}

Uint8List csvContents() {
  return Uint8List.fromList('https://google.com\n'
          'https://youtube.com'
      .codeUnits);
}

Uint8List csvContentsWithEmptyLine() {
  return Uint8List.fromList('https://google.com\n'.codeUnits);
}

Uint8List csvContentsWithInvalidURL() {
  return Uint8List.fromList('https://google.com\nftp://youtube.com'.codeUnits);
}
