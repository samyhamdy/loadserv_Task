import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../cubit/product_details_cubit.dart';
import 'weight_item.dart';

class MealWeights extends StatefulWidget {
  const MealWeights({super.key});

  @override
  State<MealWeights> createState() => _MealWeightsState();
}

class _MealWeightsState extends State<MealWeights> {
  late ProductDetailsCubit productDetailsCubit;
  int? groupValue;

  @override
  void initState() {
    super.initState();
    productDetailsCubit = ProductDetailsCubit.get(context);
    groupValue = productDetailsCubit.productDetailsModel?.data?.weights?[0].id;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 16.h),
      child: Container(
        height: 133.85.h,
        child: GridView.count(
          primary: false,
          crossAxisSpacing: 15.w,
          mainAxisSpacing: 10.h,
          crossAxisCount: 2,
          childAspectRatio: 4.sp,
          children: List.generate(
            productDetailsCubit.productDetailsModel?.data?.weights?.length ?? 0,
            (index) => MealWeightItem(
                value: productDetailsCubit
                        .productDetailsModel?.data?.weights?[index].id ??
                    0,
                groupValue: groupValue ?? 0,
                onChanged: (p0) {
                  groupValue = p0;
                  productDetailsCubit.changeMealWeight(
                      selectedMealWeight: productDetailsCubit
                          .productDetailsModel?.data?.weights?[index]);
                },
                numOfSalad: productDetailsCubit.productDetailsModel?.data
                        ?.weights?[index].numberOfSalad ??
                    0,
                price: productDetailsCubit
                        .productDetailsModel?.data?.weights?[index].price
                        .toString() ??
                    '',
                name: productDetailsCubit
                        .productDetailsModel?.data?.weights?[index].name ??
                    ""),
          ),
        ),
      ),
    );
  }
}
