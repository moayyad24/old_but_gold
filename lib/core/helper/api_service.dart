import 'package:dio/dio.dart';
import 'package:old_but_gold/core/helper/dependency_injection.dart';
import 'package:old_but_gold/i18n/strings.g.dart';

class ApiService {
  //! start xampp server:
  //! php artisan serve --host=0.0.0.0 --port=8000
  //! php artisan queue:work
  //! final String _baseUrl = "http://192.168.1.111:8000/api/";
  //? Run on a New Server
  //! ngrok http --url=adapting-bass-fine.ngrok-free.app 8000 --host-header=rewrite
  //! php artisan serve --port=8000
  //! php artisan queue:work

  final String _baseUrl = "https://adapting-bass-fine.ngrok-free.app/api/";
  final Dio _dio;

  ApiService(this._dio) {
    _dio.options = BaseOptions(
      baseUrl: _baseUrl,
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
      headers: {
        'Accept': 'application/json',
        'Accept-Language': LocaleSettings.currentLocale.languageCode,
        'Content-Type': 'multipart/form-data',
      },
    ); // Add Dio interceptors for request/response logging
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (RequestOptions options, RequestInterceptorHandler handler) {
          logger.i('''
            🌐 Sending ${options.method} Request:
            URL: ${options.uri}
            Headers: ${options.headers}
            Data: ${options.data}''');
          return handler.next(options);
        },
        onResponse: (Response response, ResponseInterceptorHandler handler) {
          logger.i('''
            ✅ Received Response:
            Status: ${response.statusCode} ${response.statusMessage}
            URL: ${response.requestOptions.uri}
            Data: ${response.data}''');
          return handler.next(response);
        },
        onError: (DioException error, ErrorInterceptorHandler handler) {
          logger.e('''
            ❌ API Error:
            URL: ${error.requestOptions.uri}
            Method: ${error.requestOptions.method}
            Error: ${error.error}
            Response: ${error.response?.data}
            Stack Trace: ${error.stackTrace}''');
          return handler.next(error);
        },
      ),
    );
  }

  /// GET request: Fetch data from the API
  Future<Map<String, dynamic>> get({required String endPoint}) async {
    logger.d('Starting GET request to $endPoint');
    Response response = await _dio.get(endPoint);
    return response.data;
  }

  /// POST request: Send data to the API
  Future<Map<String, dynamic>> post({
    required String endPoint,
    required FormData data,
  }) async {
    logger.d('Starting POST request to $endPoint with data: ${data.fields}');
    Response response = await _dio.post(endPoint, data: data);
    return response.data;
  }

  /// PUT request: Update data on the API
  Future<Map<String, dynamic>> put({
    required String endPoint,
    required Map<String, dynamic> data,
  }) async {
    logger.d('Starting PUT request to $endPoint with data: $data');
    Response response = await _dio.put(endPoint, data: data);
    return response.data;
  }

  /// DELETE request: Remove data from the API
  Future<Map<String, dynamic>> delete({required String endPoint}) async {
    logger.d('Starting DELETE request to $endPoint');
    Response response = await _dio.delete(endPoint);
    return response.data;
  }
}
