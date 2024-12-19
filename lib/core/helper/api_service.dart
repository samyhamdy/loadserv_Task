import 'dart:io';
import 'package:dio/dio.dart';
import 'package:loadserv_task/core/network/end_points.dart';
import 'package:retrofit/retrofit.dart';

import '../../features/cart_screen/models/checkout_response_model.dart';
import '../../features/category_products_screen/models/category_meals_model.dart';
import '../../features/product_details_screen/models/product_details_model.dart';
part 'api_service.g.dart';

@RestApi(baseUrl: ApiEndPoints.baseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @GET(ApiEndPoints.categoryDetails)
  Future<CategoryMealsModel> gettingCategoryDetails({
    @Path('category_id') required String categoryId,
  });

  @GET(ApiEndPoints.productDetails)
  Future<ProductDetailsModel> gettingProductDetails({
    @Path('product_id') required String productId,
  });

  @POST(ApiEndPoints.checkOut)
  Future<CheckoutResponseModel> checkOut(
      {@Body() required Map<String, dynamic> body});
}
