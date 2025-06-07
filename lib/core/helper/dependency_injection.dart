import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:old_but_gold/core/helper/api_service.dart';
import 'package:old_but_gold/features/auth/data/repos/auth_repo_impl.dart';

final getIt = GetIt.instance;

void setupGetIt() {
  //ApiService
  getIt.registerLazySingleton<ApiService>(() => ApiService(Dio()));

  //Auth
  getIt.registerLazySingleton<AuthRepoImpl>(
    () => AuthRepoImpl(getIt.get<ApiService>()),
  );
}
