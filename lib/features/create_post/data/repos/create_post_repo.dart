import 'package:dartz/dartz.dart';
import 'package:old_but_gold/core/errors/failures.dart';
import 'package:old_but_gold/features/create_post/data/models/categories_model.dart';

abstract class CreatePostRepo {
  Future<Either<Failure, CategoriesModel>> getCategories();
}