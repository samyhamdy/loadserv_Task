import 'package:freezed_annotation/freezed_annotation.dart';

import '../models/meal_info_model.dart';

part 'product_details_state.freezed.dart';

@freezed
class ProductDetailsState<T> with _$ProductDetailsState<T> {
  const factory ProductDetailsState.initial() = _Initial;

  const factory ProductDetailsState.loadingGettingProductDetails() =
      LoadingGettingProductDetails;
  const factory ProductDetailsState.successGettingProductDetails(T data) =
      SuccessGettingProductDetails<T>;
  const factory ProductDetailsState.errorGettingProductDetails(
      {required String error}) = ErrorGettingProductDetails;
  const factory ProductDetailsState.successUpdateMealInfo() =
      SuccessUpdateMealInfo;
  const factory ProductDetailsState.changeMealCount() = ChangeMealCount;
  const factory ProductDetailsState.changeMealSaladsCount() =
      changeMealSaladsCount;
  const factory ProductDetailsState.changeMealWeight() = ChangeMealWeight;
  const factory ProductDetailsState.updateCart() = UpdateCart;
  const factory ProductDetailsState.changeMealeExtraCount() =
      changeMealeExtraCount;
  const factory ProductDetailsState.updateMealPrice() = UpdateMealPrice;
  const factory ProductDetailsState.addExtraItemsToMeal() = AddExtraItemsToMeal;

  const factory ProductDetailsState.loadingCheckout() = LoadingCheckout;
  const factory ProductDetailsState.successCheckout(T data) =
      SuccessCheckout<T>;
  const factory ProductDetailsState.errorCheckout({required String error}) =
      ErrorCheckout;
}
