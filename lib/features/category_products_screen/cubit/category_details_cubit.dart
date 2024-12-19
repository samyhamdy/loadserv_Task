import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/category_meals_model.dart';
import '../repo/category_details_repo.dart';
import 'category_details_state.dart';

class CategoryDetailsCubit extends Cubit<CategoryDetailsState> {
  final CategoryDetailsRepo _categoryDetailsRepo;
  CategoryDetailsCubit(this._categoryDetailsRepo)
      : super(const CategoryDetailsState.initial());
  static CategoryDetailsCubit get(context) => BlocProvider.of(context);
  CategoryMealsModel? categoryMealsModel;
  void gettingCategoryDetails({required final String categoryId}) async {
    emit(const CategoryDetailsState.loadingGettingCategoryDetails());
    final response = await _categoryDetailsRepo.getCategoryMealsDetails(
        categoryId: categoryId);
    response.when(success: (data) async {
      categoryMealsModel = data;
      emit(CategoryDetailsState.successGettingCategoryDetails(data));
    }, failure: (error) {
      emit(CategoryDetailsState.errorGettingCategoryDetails(
          error: error.apiErrorModel.message ?? ''));
    });
  }
}
