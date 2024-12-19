import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loadserv_task/core/widgets/spacing.dart';

import '../../../core/app_styles/text_styles.dart';
import '../cubit/product_details_cubit.dart';
import 'salad_item.dart';

class MealSaladsSection extends StatefulWidget {
  const MealSaladsSection({super.key});

  @override
  State<MealSaladsSection> createState() => _MealSaladsSectionState();
}

class _MealSaladsSectionState extends State<MealSaladsSection> {
  late ProductDetailsCubit productDetailsCubit;

  @override
  void initState() {
    super.initState();
    productDetailsCubit = ProductDetailsCubit.get(context);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HeightSpace(8.h),
          Text(
            "Addition ( select ${productDetailsCubit.requiredMealNumOfSalad}):",
            style: AppTextStyles.bold12darkBlueFourthFontFamilyStyle
                .copyWith(overflow: TextOverflow.ellipsis, fontSize: 15.sp),
          ),
          HeightSpace(8.h),
          ...productDetailsCubit.productDetailsModel!.data!.salads!
              .map((e) => SaladItem(
                    item: e,
                  ))
              .toList()
        ],
      ),
    );
  }
}
