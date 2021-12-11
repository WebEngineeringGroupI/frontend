import 'package:flutter/material.dart';
import 'package:flutter_app/config/themes.dart';
import 'package:flutter_app/config/constants.dart';
import 'package:flutter_app/config/routes.dart';
import 'package:flutter_app/services/grpc_api_client.dart';
import 'package:flutter_app/services/api_client.dart';
import 'package:grpc/grpc_or_grpcweb.dart';

String urlEnvironment() {
  const env = String.fromEnvironment("env");
  switch (env) {
    case "prod":
      return "https://webeng.ovh";
    default:
      return "http://localhost:8080";
  }
}

GrpcOrGrpcWebClientChannel grpcChannel() {
  const env = String.fromEnvironment("env");
  switch (env) {
    case "prod":
      return GrpcOrGrpcWebClientChannel.toSingleEndpoint(host: "grpc.webeng.ovh", port: 443, transportSecure: true);
    default:
      return GrpcOrGrpcWebClientChannel.toSingleEndpoint(host: "localhost", port: 8081, transportSecure: false);
  }
}

void main() {
  runApp(MyApp(restAPIClient: GRPCAPIClient(grpcChannel())));
}

class MyApp extends StatelessWidget {
  final APIClient restAPIClient;

  const MyApp({Key? key, required this.restAPIClient}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Constants.APP_TITLE,
      theme: Themes.light(),
      initialRoute: "/",
      routes: routes(restAPIClient: restAPIClient),
    );
  }
}
