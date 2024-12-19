import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/app_colors/app_colors.dart';
import '../../../core/widgets/app_button.dart';
import '../cubit/product_details_cubit.dart';

class AddToCartBtn extends StatefulWidget {
  const AddToCartBtn({super.key});

  @override
  State<AddToCartBtn> createState() => _AddToCartBtnState();
}

class _AddToCartBtnState extends State<AddToCartBtn> {
  late ProductDetailsCubit productDetailsCubit;
  @override
  void initState() {
    super.initState();
    productDetailsCubit = ProductDetailsCubit.get(context);
  }

  Widget build(BuildContext context) {
    return AppButton(
      buttonText: "Add To Cart    (${productDetailsCubit.totalPrice})",
      onPressed: () async {
        if (productDetailsCubit.requiredMealNumOfSalad != 0) {
          AnimatedSnackBar.material(
            "Please select ${productDetailsCubit.requiredMealNumOfSalad} salads",
            type: AnimatedSnackBarType.warning,
            duration: const Duration(seconds: 3),
          ).show(
            context,
          );
          return;
        } else {
          AnimatedSnackBar.material(
            "Meal added to cart",
            type: AnimatedSnackBarType.success,
            duration: const Duration(seconds: 3),
          ).show(
            context,
          );
          await productDetailsCubit.updateMealInfo();
          Navigator.pop(context);
        }
      },
      backgroundColor: AppColors.primaryColor,
      fontSize: 15.sp,
    );
  }
}
