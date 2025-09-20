import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';
import 'package:old_but_gold/core/helper/api_service.dart';
import 'package:old_but_gold/core/helper/navigation_service.dart';
import 'package:old_but_gold/core/helper/shared_preference.dart';
import 'package:old_but_gold/features/auth/data/repos/auth/auth_repo_impl.dart';
import 'package:old_but_gold/features/auth/data/repos/forget_password/forget_password_repo_impl.dart';
import 'package:old_but_gold/features/create_post/data/repos/create_post_repo_impl.dart';
import 'package:old_but_gold/features/profile/data/repos/profile_repo_impl.dart';

final getIt = GetIt.instance;
final logger = Logger(printer: PrettyPrinter(colors: true, printEmojis: true));
Future<void> setupGetIt() async {
  // Setup SharedPreferences
  final localStorageService = LocalStorageService();
  await localStorageService.init();
  getIt.registerSingleton<LocalStorageService>(localStorageService);
  //Navigator helper
  getIt.registerLazySingleton<NavigationService>(() => NavigationService());
  //ApiService
  final api = await ApiService.create(
    dio: Dio(),
    baseUrl: 'http://192.168.1.117:8000/api/',
  );
  getIt.registerSingleton<ApiService>(api);

  //Auth
  getIt.registerLazySingleton<AuthRepoImpl>(
    () => AuthRepoImpl(getIt.get<ApiService>()),
  );
  getIt.registerLazySingleton<ForgetPasswordRepoImpl>(
    () => ForgetPasswordRepoImpl(getIt.get<ApiService>()),
  );
  //Profile
  getIt.registerLazySingleton<ProfileRepoImpl>(
    () => ProfileRepoImpl(getIt.get<ApiService>()),
  );
  //Create Post
  getIt.registerLazySingleton<CreatePostRepoImpl>(
    () => CreatePostRepoImpl(getIt.get<ApiService>()),
  );
}
