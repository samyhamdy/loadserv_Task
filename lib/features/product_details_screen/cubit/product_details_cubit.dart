import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loadserv_task/core/helper/extension.dart';
import '../../../main.dart';
import '../../cart_screen/models/checkout_response_model.dart';
import '../models/meal_info_model.dart';
import '../models/meal_list_model.dart';
import '../models/product_details_model.dart';
import '../repo/product_details_repo.dart';
import 'product_details_state.dart';

class ProductDetailsCubit extends Cubit<ProductDetailsState> {
  final ProductDetailsRepo _ProductDetailsRepo;
  ProductDetailsCubit(this._ProductDetailsRepo)
      : super(const ProductDetailsState.initial());
  static ProductDetailsCubit get(context) => BlocProvider.of(context);
  ProductDetailsModel? productDetailsModel;

  //======================================================
  int mealQuantity = 1;
  int totalPrice = 0;
  int requiredMealNumOfSalad = 1;
  int filledMealNumOfSalad = 0;
  Weight? selectedMealWeight;
  List<Map<Salad, int>> selectedMealSalads = [];
  List<ExtraItem?>? selectedMealExtraItems;
  MealInfoModel? mealInfoModel;
  List<MealInfoModel> mealsAddedToCart = [];
  //=======================================================

  void clearItemFromCart(
      {final MealInfoModel? mealInfoModel,
      final bool clearAll = false,
      final int index = 0}) {
    emit(const ProductDetailsState.initial());
    if (clearAll) {
      mealsAddedToCart.clear();
    } else {
      mealsAddedToCart.remove(mealInfoModel);
      box.put("cart", MealListModel(mealsAddedToCart));
      updateMealTotalPrice(price: mealInfoModel!.price!, decreased: true);
    }
    emit(const ProductDetailsState.updateCart());
  }

  Future<void> updateMealInfo() async {
    this.mealInfoModel = mealInfoModel;
    if (box.get("cart") != null) {
      box.get("cart")!.meals.forEach((element) {
        mealsAddedToCart.add(element);
      });
    }
    mealsAddedToCart.add(MealInfoModel(productDetailsModel?.data?.id ?? 0,
        image: productDetailsModel?.data?.image ?? "",
        name: productDetailsModel?.data?.name ?? "",
        price: totalPrice,
        quantity: mealQuantity,
        salads: selectedMealSalads,
        extraItems: selectedMealExtraItems,
        description: productDetailsModel?.data?.description ?? "",
        weight: selectedMealWeight ?? null));
    await box.put("cart", MealListModel(mealsAddedToCart));

    emit(const ProductDetailsState.successUpdateMealInfo());
  }

  void updateMealTotalPrice({
    required final int price,
    final bool decreased = false,
  }) {
    emit(const ProductDetailsState.initial());
    if (decreased) {
      totalPrice = totalPrice - price;
    } else {
      totalPrice = totalPrice + price;
    }
    emit(const ProductDetailsState.updateMealPrice());
  }

  void increaseMealCount() {
    emit(const ProductDetailsState.initial());
    mealQuantity++;
    if (selectedMealWeight?.numberOfSalad != null) {
      requiredMealNumOfSalad =
          requiredMealNumOfSalad + selectedMealWeight!.numberOfSalad!;
      updateMealTotalPrice(price: this.selectedMealWeight?.price ?? 0);
    }
    emit(const ProductDetailsState.changeMealCount());
  }

  void decreaseMealCount() {
    emit(const ProductDetailsState.initial());
    if (mealQuantity != 1) {
      mealQuantity--;
      if (selectedMealWeight?.numberOfSalad != null) {
        requiredMealNumOfSalad =
            requiredMealNumOfSalad - selectedMealWeight!.numberOfSalad!;
      }
      updateMealTotalPrice(
          price: this.selectedMealWeight?.price ?? 0, decreased: true);
    }
    emit(const ProductDetailsState.changeMealCount());
  }

  void increaseMealSaladCount({
    required Salad selectedMealSalad,
    required int selectedMealSaladCount,
  }) {
    emit(const ProductDetailsState.initial());

    bool isUpdated = false;
    for (Map<Salad, int> map in selectedMealSalads) {
      if (map.containsKey(selectedMealSalad)) {
        map[selectedMealSalad] = map[selectedMealSalad]! + 1;
        isUpdated = true;
        requiredMealNumOfSalad--;
        updateMealTotalPrice(price: selectedMealSalad.price!);

        break;
      }
    }

    if (!isUpdated) {
      selectedMealSalads.add({selectedMealSalad: selectedMealSaladCount});
      requiredMealNumOfSalad--;
      updateMealTotalPrice(price: selectedMealSalad.price!);
    }

    filledMealNumOfSalad += selectedMealSaladCount;

    emit(const ProductDetailsState.changeMealSaladsCount());
  }

  void decreaseMealSaladCount({
    required Salad selectedMealSalad,
    required int selectedMealSaladCount,
  }) {
    emit(const ProductDetailsState.initial());
    for (Map<Salad, int> map in selectedMealSalads) {
      if (map.containsKey(selectedMealSalad)) {
        int currentCount = map[selectedMealSalad]!;

        if (currentCount == 1) {
          selectedMealSalads.remove(map);
          updateMealTotalPrice(
              price: selectedMealSalad.price!, decreased: true);

          requiredMealNumOfSalad++;
        } else if (currentCount > 1) {
          map[selectedMealSalad] = currentCount - 1;
          updateMealTotalPrice(
              price: selectedMealSalad.price!, decreased: true);
          requiredMealNumOfSalad++;
        }
        break;
      }
    }

    emit(const ProductDetailsState.changeMealSaladsCount());
  }

  void changeMealWeight({required Weight? selectedMealWeight}) {
    emit(const ProductDetailsState.initial());
    totalPrice = 0;
    selectedMealExtraItems?.clear();
    selectedMealSalads.clear();

    this.selectedMealWeight = selectedMealWeight;
    requiredMealNumOfSalad = this.selectedMealWeight?.numberOfSalad ?? 1;
    updateMealTotalPrice(
        price: mealQuantity > 1
            ? (this.selectedMealWeight!.price! * mealQuantity)
            : (this.selectedMealWeight?.price ??
                productDetailsModel?.data?.price ??
                0));
    emit(const ProductDetailsState.changeMealWeight());
  }

  void addExtraToMeal({
    required final ExtraItem extraItem,
    final bool isAdd = true,
  }) {
    emit(const ProductDetailsState.initial());

    if (isAdd) {
      selectedMealExtraItems?.add(extraItem);
      totalPrice += extraItem.price ?? 0;
    } else {
      totalPrice += extraItem.price ?? 0;
      selectedMealExtraItems?.remove(extraItem);
    }

    emit(const ProductDetailsState.addExtraItemsToMeal());
  }

  void gettingProductDetails(
      {required final String ProductId,
      final bool isFromUpdaTe = false,
      final MealInfoModel? mealInfoModel}) async {
    emit(const ProductDetailsState.loadingGettingProductDetails());
    final response =
        await _ProductDetailsRepo.getProductMealsDetails(ProductId: ProductId);
    response.when(success: (data) async {
      if (isFromUpdaTe) {
        productDetailsModel = ProductDetailsModel(
            data: Data(
          description: mealInfoModel?.description ?? "",
          extraItems: data.data?.extraItems ?? null,
          id: mealInfoModel?.id ?? 0,
          image: mealInfoModel?.image ?? "",
          isSingle: data.data?.isSingle ?? false,
          name: mealInfoModel?.name ?? "",
          weights: data.data?.weights ?? null,
          salads: data.data?.salads ?? null,
        ));
        totalPrice = mealInfoModel?.price ?? 0;
        mealQuantity = mealInfoModel?.quantity ?? 0;
        selectedMealWeight = mealInfoModel?.weight;
        selectedMealExtraItems = mealInfoModel?.extraItems;
        selectedMealSalads = mealInfoModel!.salads;

        emit(ProductDetailsState.successGettingProductDetails(
            productDetailsModel));
      } else {
        productDetailsModel = data;
        if (productDetailsModel?.data?.weights == null ||
            productDetailsModel?.data?.salads?.length == 0) {
          requiredMealNumOfSalad = 1;
        }
        changeMealWeight(
            selectedMealWeight: productDetailsModel?.data?.weights?[0]);
      }

      emit(ProductDetailsState.successGettingProductDetails(data));
    }, failure: (error) {
      emit(ProductDetailsState.errorGettingProductDetails(
          error: error.apiErrorModel.message ?? ''));
    });
  }

  CheckoutResponseModel? checkoutResponseModel;
  Map<String, dynamic> query = {};
  void checkoutMeals(context) async {
    emit(const ProductDetailsState.loadingCheckout());
    final response = await _ProductDetailsRepo.checkoutMeal(
      query: {
        "products[][quantity]":
            mealsAddedToCart.map((e) => e.quantity).toList(),
        "products[][name]": mealsAddedToCart.map((e) => e.name).toList(),
        "products[][id]": mealsAddedToCart.map((e) => e.id).toList(),
        "products[][price]": mealsAddedToCart.map((e) => e.price).toList(),
      },
    );
    response.when(success: (data) async {
      checkoutResponseModel = data;
      mealsAddedToCart.clear();
      box.clear();
      Navigator.pop(context);
      emit(ProductDetailsState.successCheckout(data));
    }, failure: (error) {
      emit(ProductDetailsState.errorCheckout(
          error: error.apiErrorModel.message ?? ''));
    });
  }
}
