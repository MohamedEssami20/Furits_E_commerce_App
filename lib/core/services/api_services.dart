import 'package:dio/dio.dart';

class ApiServices {
  static final Dio _dio = Dio();
  static Future<dynamic> get(String path,
      {Map<String, dynamic>? queryParameters}) async {
    var response = await _dio.get(
      path,
      queryParameters: queryParameters,
    );
    return response.data;
  }

   Future<dynamic> post(String path, {Map<String, dynamic>? data, Options? options}) async {
    var response = await _dio.post(path, data: data);
    return response.data;
  }

   Future<dynamic> put(String path, {Map<String, dynamic>? data}) async {
    var response = await _dio.put(path, data: data);
    return response.data;
  }

   Future<dynamic> delete(String path,
      {Map<String, dynamic>? data}) async {
    var response = await _dio.delete(path, data: data);
    return response.data;
  }
}
