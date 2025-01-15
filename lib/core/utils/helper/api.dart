import 'package:dio/dio.dart';

class ApiServer {
  final String _baseUrl = 'https://fcm.googleapis.com/v1/';
  final Dio _dio;

  ApiServer(this._dio);

  Future<Map<String, dynamic>> post(
      {
      required String endPoint,
      required Map<String, dynamic> data,
      required Map<String, dynamic> headers,
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

  Future<Map<String,dynamic>> get() async {
    // ignore: unnecessary_string_interpolations
    var response = await _dio.get('$_baseUrl');
    return response.data;
  }
}