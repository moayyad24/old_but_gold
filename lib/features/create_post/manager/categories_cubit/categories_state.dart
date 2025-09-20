import 'package:old_but_gold/features/create_post/data/models/categories_model.dart';

abstract class CategoriesState {}

final class CategoriesInitial extends CategoriesState {}

final class CategoriesLoading extends CategoriesState {}

final class CategoriesFailure extends CategoriesState {
  final String errorMessage;
  CategoriesFailure({required this.errorMessage});
}

final class CategoriesSuccess extends CategoriesState {
  final CategoriesModel categoriesModel;
  CategoriesSuccess({required this.categoriesModel});
}
