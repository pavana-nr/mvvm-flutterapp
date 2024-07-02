import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class BaseApiResponse {
  Future<dynamic> getGETApiResponse(String url) async {
    var uri = Uri.parse(url);
    var response = await http.get(uri);
    if (kDebugMode) {
      print(response.body);
    }
    if (response.statusCode == 200) {}
  }

  Future<dynamic> getPOSTApiResponse(String url, dynamic data) async {
    var uri = Uri.parse(url);
    var response = await http.post(uri);
    if (kDebugMode) {
      print(response.body);
    }
    if (response.statusCode == 200) {}
  }
}
