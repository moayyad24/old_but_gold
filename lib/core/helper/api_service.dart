import 'package:dio/dio.dart';

class ApiService {
  final String _baseUrl = "http://192.168.1.111:8000/api/";
  final Dio _dio;

  ApiService(this._dio) {
    _dio.options = BaseOptions(
      baseUrl: _baseUrl,
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
      headers: {
        'Accept': 'application/json',
        'Accept-Language': 'ar',
        'Content-Type': 'multipart/form-data',
      },
    );
  }

  /// GET request: Fetch data from the API
  Future<Map<String, dynamic>> get({required String endPoint}) async {
    Response response = await _dio.get(endPoint);
    return response.data;
  }

  /// POST request: Send data to the API
  Future<Map<String, dynamic>> post({
    required String endPoint,
    required FormData data,
  }) async {
    Response response = await _dio.post(endPoint, data: data);
    return response.data;
  }

  /// PUT request: Update data on the API
  Future<Map<String, dynamic>> put({
    required String endPoint,
    required Map<String, dynamic> data,
  }) async {
    Response response = await _dio.put(endPoint, data: data);
    return response.data;
  }

  /// DELETE request: Remove data from the API
  Future<Map<String, dynamic>> delete({required String endPoint}) async {
    Response response = await _dio.delete(endPoint);
    return response.data;
  }
}
