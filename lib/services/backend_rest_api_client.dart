import 'dart:convert';
import 'dart:typed_data';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_app/services/rest_api_client.dart';
import 'package:http_parser/http_parser.dart';


class BackendRestAPIClient implements RestAPIClient {
  final String baseUrl = "http://127.0.0.1:8080";


  @override
  Future<String?> shortURL(String longURL) async {
    var dio = Dio();
    try {
      final response = await dio.post(
        baseUrl + "/api/v1/link",
        data: {'url': longURL},
      );
      return jsonDecode(response.data)['url'];
    } catch(err) {
      return null;
    }
  }

  @override
  Future<String?> shortCSV(Uint8List longCSV) async {

    FormData _formData = FormData.fromMap({
      "file": MultipartFile.fromBytes(longCSV, contentType: MediaType.parse('text/csv')),
    });
    Dio dio =  Dio();
    try {
      final response = await dio.post(baseUrl + "/csv", data: _formData);
      return response.data;
    } catch(err) {
      print(err);
      return null;
    }
  }

}