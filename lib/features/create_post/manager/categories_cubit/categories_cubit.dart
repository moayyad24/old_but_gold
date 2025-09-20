import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:old_but_gold/features/create_post/data/repos/create_post_repo.dart';
import 'package:old_but_gold/features/create_post/manager/categories_cubit/categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  final CreatePostRepo createPostRepo;
  CategoriesCubit(this.createPostRepo) : super(CategoriesInitial());

  Future<void> getCategories() async {
    emit(CategoriesLoading());
    var result = await createPostRepo.getCategories();
    result.fold(
      (f) {
        //failure
        emit(CategoriesFailure(errorMessage: f.message));
      },
      (s) async {
        //success
        emit(CategoriesSuccess(categoriesModel: s));
      },
    );
  }
}
