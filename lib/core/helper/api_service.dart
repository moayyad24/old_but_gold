import 'dart:async';

import 'package:dio/dio.dart';
import 'package:old_but_gold/core/constants/db_keys.dart';
import 'package:old_but_gold/core/helper/dependency_injection.dart';
import 'package:old_but_gold/core/helper/navigation_service.dart';
import 'package:old_but_gold/core/helper/shared_preference.dart';
import 'package:old_but_gold/i18n/strings.g.dart';

//! start xampp server:
//! php artisan serve --host=0.0.0.0 --port=8000
//! php artisan queue:work
//! final String baseUrl = "http://192.168.1.111:8000/api/";
//? Run on a New Server
//! ngrok http --url=adapting-bass-fine.ngrok-free.app 8000 --host-header=rewrite
//! php artisan serve --port=8000
//! php artisan queue:work

class ApiService {
  final Dio _dio;
  final Dio _authDio;
  final String baseUrl;
  // Refresh control
  bool _isRefreshing = false;
  Completer<void>? _refreshCompleter;

  ApiService._internal({
    required Dio dio,
    required Dio authDio,
    required this.baseUrl,
  }) : _dio = dio,
       _authDio = authDio;

  /// async factory that initializes interceptors and options
  static Future<ApiService> create({
    required Dio dio,
    required String baseUrl,
  }) async {
    final authDio = Dio(BaseOptions(baseUrl: baseUrl));
    final svc = ApiService._internal(
      dio: dio,
      authDio: authDio,
      baseUrl: baseUrl,
    );
    await svc._init();
    return svc;
  }

  Future<void> _init() async {
    _dio.options = BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
      contentType: 'multipart/form-data',
    );

    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          logger.i('''
            🌐 Sending ${options.method} Request:
            URL: ${options.uri}
            Headers: ${options.headers}
            Data: ${options.data}''');
          // inject language & accept headers
          options.headers['Accept'] = 'application/json';
          options.headers['Accept-Language'] =
              LocaleSettings.currentLocale.languageCode;

          // dynamically attach token if available
          final token = await getIt.get<LocalStorageService>().getSecuredString(
            DbKeys.userToken,
          );
          if (token != null && token.isNotEmpty) {
            options.headers['Authorization'] = 'Bearer $token';
          } else {
            options.headers.remove('Authorization');
          }
          logger.i('➡️ ${options.method} ${options.uri}');
          return handler.next(options);
        },
        onResponse: (response, handler) {
          logger.i('✅ ${response.statusCode} ${response.requestOptions.uri}');
          return handler.next(response);
        },
        onError: (error, handler) {
          logger.e(
            '❌ Error ${error.response?.statusCode} ${error.requestOptions.uri} - ${error.message}',
          );
          return handler.next(error);
        },
      ),
    );
    _dio.interceptors.add(
      QueuedInterceptorsWrapper(
        onError: (error, ErrorInterceptorHandler handler) async {
          final status = error.response?.statusCode;
          final options = error.requestOptions;

          // If not an auth error -> pass through
          if (status != 401) {
            return handler.next(error);
          }

          // Avoid trying to refresh if the failing request is the refresh endpoint itself
          if (_isRefreshEndpoint(options.path)) {
            // refresh failed -> force logout
            await _handleRefreshFailure(error, handler);
            return;
          }

          try {
            // If a refresh is already in progress, wait for it to finish
            if (_isRefreshing) {
              logger.d('Waiting for ongoing refresh to complete...');
              try {
                await _refreshCompleter?.future;
              } catch (e) {
                // refresh ultimately failed
                await _handleRefreshFailure(error, handler);
                return;
              }
            } else {
              // Start refresh
              _isRefreshing = true;
              _refreshCompleter = Completer<void>();
              logger.i('🔄 Starting token refresh...');
              try {
                await _refreshToken();
                _refreshCompleter?.complete();
                logger.i('🔐 Token refreshed successfully.');
              } catch (e) {
                _refreshCompleter?.completeError(e);
                logger.e('❌ Token refresh failed');
                await _handleRefreshFailure(error, handler);
                return;
              } finally {
                _isRefreshing = false;
              }
            }

            // At this point, refresh succeeded. Retry the original request with new token
            final newToken = await getIt
                .get<LocalStorageService>()
                .getSecuredString(DbKeys.userToken);
            if (newToken != null && newToken.isNotEmpty) {
              options.headers['Authorization'] = 'Bearer $newToken';
            } else {
              options.headers.remove('Authorization');
            }

            logger.d('🔁 Retrying original request to ${options.uri}');
            // Important: create a new request using fetch so retry goes through interceptors as normal
            final retryResponse = await _dio.fetch(options);
            handler.resolve(retryResponse);
          } catch (e) {
            logger.e('❌ Retry after refresh failed');
            handler.next(error);
          }
        },
      ),
    );
  }

  bool _isRefreshEndpoint(String path) {
    //Check if the api contains a refresh keyword
    return path.toLowerCase().contains('refresh');
  }

  Future<void> _handleRefreshFailure(
    originalError,
    ErrorInterceptorHandler handler,
  ) async {
    // Clear tokens and navigate to login
    await getIt.get<LocalStorageService>().deleteSecuredStorage();
    try {
      await getIt.get<NavigationService>().logoutToLogin();
    } catch (e) {
      logger.w('Navigation to login failed: $e');
    }
    // Return the original error to the caller
    handler.next(originalError);
  }

  Future<void> _refreshToken() async {
    final currentToken = await getIt
        .get<LocalStorageService>()
        .getSecuredString(DbKeys.userToken);

    if (currentToken == null || currentToken.isEmpty) {
      throw Exception('No token available for refresh');
    }

    final response = await _authDio.post(
      'refresh',
      options: Options(headers: {'Authorization': 'Bearer $currentToken'}),
    );

    // Validate response and extract new token
    if (response.statusCode == 200 && response.data != null) {
      final data = response.data;
      String? newToken;

      if (data is Map<String, dynamic>) {
        newToken = data['data']?['token'] as String?;
      }

      if (newToken == null || newToken.isEmpty) {
        throw Exception('Refresh response did not contain a token');
      }

      // Save token
      await getIt.get<LocalStorageService>().setSecuredString(
        DbKeys.userToken,
        newToken,
      );
    } else {
      throw Exception(
        'Token refresh failed with status ${response.statusCode}',
      );
    }
  }

  Future<T> get<T>({
    required String endPoint,
    Map<String, dynamic>? queryParameters,
  }) async {
    logger.d('GET $endPoint');
    final resp = await _dio.get<T>(endPoint, queryParameters: queryParameters);
    return resp.data as T;
  }

  Future<T> post<T>({
    required String endPoint,
    dynamic data,
    Options? options,
  }) async {
    logger.d('POST $endPoint');
    final resp = await _dio.post<T>(endPoint, data: data, options: options);
    return resp.data as T;
  }

  Future<T> put<T>({
    required String endPoint,
    dynamic data,
    Options? options,
  }) async {
    logger.d('PUT $endPoint');
    final resp = await _dio.put<T>(endPoint, data: data, options: options);
    return resp.data as T;
  }

  Future<T> delete<T>({required String endPoint, dynamic data}) async {
    logger.d('DELETE $endPoint');
    final resp = await _dio.delete<T>(endPoint, data: data);
    return resp.data as T;
  }
}
