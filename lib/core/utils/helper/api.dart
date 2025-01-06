import 'dart:convert';
import 'package:http/http.dart' as http;

class Api {
  Future<dynamic> post({
    required String url,
    required dynamic body,
    required String token,
    required Map<String,String> headers,
  }) async {
    http.Response response = await http.post(
      Uri.parse(url),
      body: body,
      headers: headers,
    );
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception(
        'there is a problem with status code ${response.statusCode} with body ${jsonDecode(response.body)}',
      );
    }
  }

  Future<dynamic> get({required String url}) async {
    // ignore: non_constant_identifier_names
    http.Response Response = await http.get(Uri.parse(url));
    if (Response.statusCode == 200) {
      return jsonDecode(Response.body);
    } else {
      throw Exception(
        'there is a problem with status code ${Response.statusCode} with body ${jsonDecode(Response.body)}',
      );
    }
  }
}