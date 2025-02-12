import 'package:dio/dio.dart';

class ApiServer {
  final String _baseUrl = 'http://102.214.165.242:8080/api/device/';
  final Dio _dio;

  ApiServer(this._dio);

  Future<Map<String, dynamic>> post({
    required String endPoint,
    required Map<String, dynamic> data,
    required Map<String, String> headers,
  }) async {
    var response = await _dio.post(
      '$_baseUrl$endPoint',
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
