import '../../../core/helper/api_error_handler.dart';
import '../../../core/helper/api_results.dart';
import '../../../core/helper/api_service.dart';
import '../../cart_screen/models/checkout_response_model.dart';
import '../models/product_details_model.dart';

class ProductDetailsRepo {
  final ApiService _apiService;
  ProductDetailsRepo(this._apiService);
  Future<ApiResult<ProductDetailsModel>> getProductMealsDetails({
    required final String ProductId,
  }) async {
    try {
      final response =
          await _apiService.gettingProductDetails(productId: ProductId);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  Future<ApiResult<CheckoutResponseModel>> checkoutMeal({
    required Map<String, dynamic> query,
  }) async {
    try {
      final response = await _apiService.checkOut(body: query);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
