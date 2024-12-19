import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loadserv_task/core/widgets/spacing.dart';
import 'package:loadserv_task/features/product_details_screen/cubit/product_details_cubit.dart';
import '../../../core/widgets/empty_widget.dart';
import '../../../main.dart';
import '../../product_details_screen/cubit/product_details_state.dart';
import '../widgets/cart_appbar.dart';
import '../widgets/cart_single_meal.dart';
import '../widgets/checkout_btn.dart';
import '../widgets/delete_all_cart_btn.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  late ProductDetailsCubit productDetailsCubit;
  void getCartData() async {
    productDetailsCubit = ProductDetailsCubit.get(context);
    if (box.get("cart") != null) {
      productDetailsCubit.mealsAddedToCart = box.get("cart")!.meals;
      for (var element in productDetailsCubit.mealsAddedToCart) {
        productDetailsCubit.totalPrice =
            productDetailsCubit.totalPrice + element.price!;
      }
    }
  }

  @override
  void initState() {
    super.initState();
    getCartData();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ProductDetailsCubit, ProductDetailsState>(
        builder: (context, state) {
          return SafeArea(
            child: productDetailsCubit.mealsAddedToCart.length == 0
                ? Column(
                    children: [
                      HeightSpace(16),
                      CartAppBar(),
                      HeightSpace(64),
                      EmptyLottieWidget()
                    ],
                  )
                : Column(
                    children: [
                      HeightSpace(16),
                      CartAppBar(),
                      HeightSpace(64),
                      Expanded(
                        child: ListView.separated(
                          itemCount:
                              productDetailsCubit.mealsAddedToCart.length,
                          separatorBuilder: (context, index) =>
                              HeightSpace(30.h),
                          itemBuilder: (context, index) => CartSingleMeal(
                            index: index,
                            mealInfoModel:
                                productDetailsCubit.mealsAddedToCart[index],
                          ),
                        ),
                      ),
                      CheckoutBtn(),
                      HeightSpace(8.h),
                      DeleteAllCartBtn(
                        onPressed: () {
                          box.clear();
                          productDetailsCubit.clearItemFromCart(clearAll: true);
                        },
                      ),
                      HeightSpace(8.h),
                    ],
                  ),
          );
        },
      ),
    );
  }
}
