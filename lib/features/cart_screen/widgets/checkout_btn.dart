import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/widgets/app_button.dart';
import '../../../core/widgets/loading_widget.dart';
import '../../product_details_screen/cubit/product_details_cubit.dart';
import '../../product_details_screen/cubit/product_details_state.dart';

class CheckoutBtn extends StatefulWidget {
  const CheckoutBtn({
    super.key,
  });
  @override
  State<CheckoutBtn> createState() => _CheckoutBtnState();
}

class _CheckoutBtnState extends State<CheckoutBtn> {
  late ProductDetailsCubit productDetailsCubit;
  @override
  void initState() {
    super.initState();
    productDetailsCubit = ProductDetailsCubit.get(context);
  }

  Widget build(BuildContext context) {
    return BlocConsumer<ProductDetailsCubit, ProductDetailsState>(
      builder: (context, state) {
        return state.maybeWhen(
            loadingCheckout: () => LoadingWidget(
                  height: 70.h,
                  screenHeight: 70.h,
                  width: 70.w,
                  screenWidth: 70.w,
                ),
            orElse: () {
              return AppButton(
                width: 382.w,
                height: 45.h,
                horizontalPadding: 0,
                verticalPadding: 0,
                buttonText: "Checkout ${productDetailsCubit.totalPrice} EGP",
                onPressed: () {
                  productDetailsCubit.checkoutMeals(context);
                },
              );
            });
      },
      listener: (context, state) {
        state.whenOrNull(
          errorCheckout: (error) {
            AnimatedSnackBar.material(
              error,
              type: AnimatedSnackBarType.error,
              duration: const Duration(seconds: 3),
            ).show(
              context,
            );
          },
          successCheckout: (data) {
            AnimatedSnackBar.material(
              data.message.toString(),
              type: AnimatedSnackBarType.success,
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
