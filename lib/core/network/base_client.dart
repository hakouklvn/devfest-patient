import 'dart:convert';
import 'package:http/http.dart' as http;

import '../resources/exceptions.dart';
import 'network_checker.dart';

abstract class CustomBaseClient {
  Future<http.Response> postHttp({required String url, required dynamic body});
  Future<http.StreamedResponse> multiPartPost(
      {required String url, required String body});
  Future<http.Response> putHttp({required String url, required dynamic body});
  Future<http.Response> getHttp(String url);
}

class CustomBaseClientImpl implements CustomBaseClient {
  final http.Client httpClient;
  final NetworkChecker networkChecker;

  CustomBaseClientImpl({
    required this.httpClient,
    required this.networkChecker,
  });

  Uri generateURI(String url) {
    // final Uri endPoint = Uri.parse("http://192.168.1.11:3000/$url");
    final Uri endPoint = Uri.parse("https://hanuut.onrender.com/$url");
    return endPoint;
  }

  @override
  Future<http.Response> getHttp(String url) async {
    final Uri endPoint = generateURI(url);
    final headers = {
      "Content-Type": "application/json",
      "Accept": "application/json",
    };

    if (await networkChecker.hasConnection) {
      http.Response response = await httpClient.get(endPoint, headers: headers);
      return response;
    }

    throw NetworkException();
  }

  @override
  Future<http.Response> postHttp({required String url, required body}) async {
    final Uri endPoint = generateURI(url);
    final headers = {
      "Content-Type": "application/json",
      "Accept": "application/json",
    };

    if (await networkChecker.hasConnection) {
      http.Response response = await httpClient.post(
        endPoint,
        headers: headers,
        body: jsonEncode(body),
      );

      return response;
    }

    throw NetworkException();
  }

  @override
  Future<http.StreamedResponse> multiPartPost(
      {required String url, required String body}) async {
    final Uri endPoint = generateURI(url);

    var request = http.MultipartRequest('POST', endPoint);
    request.files.add(await http.MultipartFile.fromPath('image', body));

    if (await networkChecker.hasConnection) {
      http.StreamedResponse response = await request.send();

      return response;
    }

    throw NetworkException();
  }

  @override
  Future<http.Response> putHttp({required String url, required body}) async {
    final Uri endPoint = generateURI(url);
    final headers = {
      "Content-Type": "application/json",
      "Accept": "application/json",
    };

    if (await networkChecker.hasConnection) {
      http.Response response = await httpClient.put(
        endPoint,
        headers: headers,
        body: jsonEncode(body),
      );

      return response;
    }

    throw NetworkException();
  }
}
