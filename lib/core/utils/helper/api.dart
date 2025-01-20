import 'package:dio/dio.dart';

class ApiServer {
  final Dio _dio;

  ApiServer(this._dio);

  Future<Map<String, dynamic>> post({
    required String url,
    required Map<String, dynamic> data,
    required Map<String, String> headers,
  }) async {
    var response = await _dio.post(
      url,
      data: data,
      options: Options(
        headers: headers,
      ),
    );
    return response.data;
  }

  Future<Map<String, dynamic>> get({required String endPoint}) async {
    // ignore: unnecessary_string_interpolations
    var response = await _dio.get('$endPoint');
    return response.data;
  }
}
