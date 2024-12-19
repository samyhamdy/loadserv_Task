import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/app_styles/text_styles.dart';
import '../../../core/widgets/spacing.dart';
import '../cubit/product_details_cubit.dart';
import 'extra_addition_item.dart';

class MealExtraItemsSection extends StatefulWidget {
  const MealExtraItemsSection({super.key});

  @override
  State<MealExtraItemsSection> createState() => _MealExtraItemsSectionState();
}

class _MealExtraItemsSectionState extends State<MealExtraItemsSection> {
  late ProductDetailsCubit productDetailsCubit;

  @override
  void initState() {
    super.initState();
    productDetailsCubit = ProductDetailsCubit.get(context);
  }

  @override
  Widget build(BuildContext context) {
    return productDetailsCubit.productDetailsModel?.data?.extraItems?.length ==
            0
        ? SizedBox.shrink()
        : Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HeightSpace(16.h),
                Text(
                  "Extras :",
                  style: AppTextStyles.bold12darkBlueFourthFontFamilyStyle
                      .copyWith(fontSize: 15.sp),
                ),
                HeightSpace(6.h),
                ...productDetailsCubit.productDetailsModel!.data!.extraItems!
                    .map((e) => ExtraAdditionItem(
                          extraItem: e!,
                        ))
                    .toList()
              ],
            ),
          );
  }
}
