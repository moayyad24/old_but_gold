import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:old_but_gold/core/errors/failures.dart';
import 'package:old_but_gold/core/helper/api_service.dart';
import 'package:old_but_gold/core/helper/dependency_injection.dart';
import 'package:old_but_gold/features/create_post/data/models/categories_model.dart';
import 'package:old_but_gold/features/create_post/data/repos/create_post_repo.dart';

class CreatePostRepoImpl implements CreatePostRepo {
  final ApiService apiService;

  CreatePostRepoImpl(this.apiService);

  @override
  Future<Either<Failure, CategoriesModel>> getCategories() async {
    logger.i('🔄 Fetching Categories...');
    try {
      logger.d('📤 Sending GET request to "categories" endpoint');
      Map<String, dynamic> response = await apiService.get(
        endPoint: 'categories',
      );
      logger.d('📥 Received response: ${response.toString()}');

      logger.d('🔨 Parsing response into CategoriesModel');
      var categories = CategoriesModel.fromJson(response);
      logger.i('✅ Successfully fetched categories and sub-categories');
      return right(categories);
    } on DioException catch (e) {
      logger.e(
        '❌ Failed to fetch categories - DioError',
        error: e,
        time: DateTime.now(),
      );
      return left(ServerFailure.fromDioError(e));
    } catch (e) {
      logger.e(
        '❌ Unexpected error while categories',
        error: e,
        time: DateTime.now(),
      );
      return left(ServerFailure(e.toString()));
    }
  }
}
