import 'package:dio/dio.dart';
import 'package:old_but_gold/core/constants/db_keys.dart';
import 'package:old_but_gold/core/helper/dependency_injection.dart';
import 'package:old_but_gold/core/helper/navigation_service.dart';
import 'package:old_but_gold/core/helper/shared_preference.dart';
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

  final String _baseUrl = "http://192.168.1.117:8000/api/";
  final Dio _dio;
  final Dio _authDio;
  ApiService(this._dio) : _authDio = Dio() {
    _initDio();
  }
  Future<void> _initDio() async {
    final token = await getIt.get<LocalStorageService>().getSecuredString(
      DbKeys.userToken,
    );
    _authDio.options.baseUrl = _baseUrl;
    _dio.options = BaseOptions(
      baseUrl: _baseUrl,
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
      headers: {
        'Accept': 'application/json',
        'Accept-Language': LocaleSettings.currentLocale.languageCode,
        'Content-Type': 'multipart/form-data',
        'Authorization': 'Bearer $token',
      },
    );

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
            Status Code: ${error.response?.statusCode}
            Method: ${error.requestOptions.method}
            Error: ${error.error}
            Response: ${error.response?.data}
            ''');
          return handler.next(error);
        },
      ),
    );
    _dio.interceptors.add(
      QueuedInterceptorsWrapper(
        onError: (error, handler) async {
          if (error.response?.statusCode == 401) {
            logger.i('🔄 Attempting token refresh...');
            try {
              // Log refresh attempt
              logger.d('🔐 Starting token refresh process');

              final newToken = await _refreshToken();
              logger.i('✅ Token refresh successful');

              // Save new token with logging
              logger.d('💾 Saving new token to secure storage');
              await getIt.get<LocalStorageService>().setSecuredString(
                DbKeys.userToken,
                newToken,
              );

              // Update request headers
              logger.d('🔄 Updating request headers with new token');
              error.requestOptions.headers['Authorization'] =
                  'Bearer $newToken';

              // Log retry attempt
              logger.d(
                '🔄 Retrying original request to ${error.requestOptions.path}',
              );
              final retryResponse = await _dio.fetch(error.requestOptions);
              logger.i('✅ Request succeeded after token refresh');

              handler.resolve(retryResponse);
            } catch (e, stackTrace) {
              logger.e(
                '❌ Token refresh failed',
                error: e,
                stackTrace: stackTrace,
              );
              logger.w(
                '⚠️ Original request will fail due to token refresh failure',
              ); // Clear stored tokens
              await getIt.get<LocalStorageService>().deleteSecuredStorage();
              getIt.get<NavigationService>().logoutToLogin();
              handler.reject(error);
            }
          } else {
            logger.d(
              '⏩ Skipping token refresh (not a 401 or refresh endpoint)',
            );
            handler.reject(error);
          }
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
    final token = await getIt.get<LocalStorageService>().getSecuredString(
      DbKeys.userToken,
    );
    Response response = await _dio.post(
      endPoint,
      data: data,
      options: Options(
        headers: {
          'Accept': 'application/json',
          'Accept-Language': LocaleSettings.currentLocale.languageCode,
          'Content-Type': 'multipart/form-data',
          'Authorization': 'Bearer $token',
        },
      ),
    );
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

  Future<String> _refreshToken() async {
    final token = await getIt.get<LocalStorageService>().getSecuredString(
      DbKeys.userToken,
    );
    final response = await _authDio.post(
      'refresh',
      options: Options(
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
      ),
    );
    return response.data['data']['token'];
  }
}
