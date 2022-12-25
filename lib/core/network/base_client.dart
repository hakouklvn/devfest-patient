import 'dart:convert';
import 'package:http/http.dart' as http;

abstract class CustomBaseClient {
  Future<http.Response> postHttp({required String url, required dynamic body});
  Future<http.Response> putHttp({required String url, required dynamic body});
  Future<http.Response> getHttp(String url);
}

class CustomBaseClientImpl implements CustomBaseClient {
  final http.Client httpClient;
  CustomBaseClientImpl({required this.httpClient});

  @override
  Future<http.Response> getHttp(String url) async {
//  final Uri endPoint = Uri.parse("https://hanuut-api.herokuapp.com/address");
    // final Uri endPoint = Uri.parse("http://localhost:3000/$url");
    final Uri endPoint = Uri.parse("http://192.168.1.8:3000/$url");
    final headers = {
      "Content-Type": "application/json",
      "Accept": "application/json",
    };
    http.Response response = await httpClient.get(endPoint, headers: headers);

    return response;
  }

  @override
  Future<http.Response> postHttp({required String url, required body}) async {
    // final Uri endPoint = Uri.parse("http://localhost:3000/$url");
    final Uri endPoint = Uri.parse("http://192.168.1.8:3000/$url");
    final headers = {
      "Content-Type": "application/json",
      "Accept": "application/json",
    };
    http.Response response = await httpClient.post(
      endPoint,
      headers: headers,
      body: jsonEncode(body),
    );

    return response;
  }

  @override
  Future<http.Response> putHttp({required String url, required body}) async {
    // final Uri endPoint = Uri.parse("http://localhost:3000/$url");
    final Uri endPoint = Uri.parse("http://192.168.1.8:3000/$url");
    final headers = {
      "Content-Type": "application/json",
      "Accept": "application/json",
    };
    http.Response response = await httpClient.put(
      endPoint,
      headers: headers,
      body: jsonEncode(body),
    );

    return response;
  }
}
