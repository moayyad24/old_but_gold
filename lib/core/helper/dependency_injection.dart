import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:old_but_gold/core/helper/api_service.dart';
import 'package:old_but_gold/core/helper/shared_preference.dart';
import 'package:old_but_gold/features/auth/data/repos/auth/auth_repo_impl.dart';
import 'package:old_but_gold/features/auth/data/repos/forget_password/forget_password_repo_impl.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // Setup SharedPreferences
  final localStorageService = LocalStorageService();
  await localStorageService.init();
  getIt.registerSingleton<LocalStorageService>(localStorageService);
  //ApiService
  getIt.registerLazySingleton<ApiService>(() => ApiService(Dio()));

  //Auth
  getIt.registerLazySingleton<AuthRepoImpl>(
    () => AuthRepoImpl(getIt.get<ApiService>()),
  );
  getIt.registerLazySingleton<ForgetPasswordRepoImpl>(
    () => ForgetPasswordRepoImpl(getIt.get<ApiService>()),
  );
}
