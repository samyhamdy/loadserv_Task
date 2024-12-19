import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loadserv_task/features/product_details_screen/cubit/product_details_state.dart';
import '../../../core/widgets/loading_widget.dart';
import '../../../core/widgets/spacing.dart';
import '../cubit/product_details_cubit.dart';
import '../models/meal_info_model.dart';
import '../widgets/add_to_cart_btn.dart';
import '../widgets/back_btn.dart';
import '../widgets/extra_items_section.dart';
import '../widgets/product_prices_quantity_name.dart';
import '../widgets/salads_section.dart';
import '../widgets/weights_section.dart';

class MealDetailsBottomSheetConetnt extends StatefulWidget {
  const MealDetailsBottomSheetConetnt(
      {super.key,
      required this.productId,
      required this.productPrice,
      required this.productOldPrice,
      this.isFromUpdate = false,
      this.mealInfoModel});
  final String productId;
  final String productPrice;
  final String productOldPrice;
  final bool isFromUpdate;
  final MealInfoModel? mealInfoModel;
  @override
  State<MealDetailsBottomSheetConetnt> createState() =>
      _MealDetailsBottomSheetConetntState();
}

class _MealDetailsBottomSheetConetntState
    extends State<MealDetailsBottomSheetConetnt> {
  late ProductDetailsCubit productDetailsCubit;
  @override
  void initState() {
    super.initState();
    productDetailsCubit = ProductDetailsCubit.get(context);
    productDetailsCubit.gettingProductDetails(
        ProductId: widget.productId,
        isFromUpdaTe: widget.isFromUpdate,
        mealInfoModel: widget.mealInfoModel);
  }

  Widget build(BuildContext context) {
    return BlocConsumer<ProductDetailsCubit, ProductDetailsState>(
      builder: (context, state) {
        return state.maybeWhen(
          loadingGettingProductDetails: () => LoadingWidget(),
          orElse: () {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: ListView(
                children: [
                  BackBtn(),
                  HeightSpace(30),
                  ProductPricesQuantityName(
                    productOldPrice: widget.productOldPrice,
                    productPrice: widget.productPrice,
                    productId: widget.productId,
                  ),
                  HeightSpace(18),
                  MealWeightsSection(
                    isVisible: productDetailsCubit
                                .productDetailsModel?.data?.weights?.length !=
                            0 &&
                        productDetailsCubit
                                .productDetailsModel?.data?.weights !=
                            null,
                  ),
                  MealSaladsSection(),
                  MealExtraItemsSection(),
                  SizedBox(height: 16),
                  AddToCartBtn(),
                  HeightSpace(16),
                ],
              ),
            );
          },
        );
      },
      listener: (context, state) {
        state.whenOrNull(
          errorGettingProductDetails: (error) {
            AnimatedSnackBar.material(
              error,
              type: AnimatedSnackBarType.error,
              duration: const Duration(seconds: 3),
            ).show(
              context,
            );
          },
        );
      },
    );
  }
}
