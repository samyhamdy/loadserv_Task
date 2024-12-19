import 'dart:developer';

import '../../../core/helper/api_error_handler.dart';
import '../../../core/helper/api_results.dart';
import '../../../core/helper/api_service.dart';
import '../models/category_meals_model.dart';

class CategoryDetailsRepo {
  final ApiService _apiService;
  CategoryDetailsRepo(this._apiService);
  Future<ApiResult<CategoryMealsModel>> getCategoryMealsDetails({
    required final String categoryId,
  }) async {
    try {
      final response =
          await _apiService.gettingCategoryDetails(categoryId: categoryId);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
