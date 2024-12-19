import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loadserv_task/core/main_services/screen_sizes.dart';

import '../../../core/app_assets/app_assets.dart';
import '../../../core/app_colors/app_colors.dart';
import '../../../core/app_styles/text_styles.dart';
import '../../../core/main_services/locator.dart';
import '../../../core/widgets/cached_image_widget.dart';
import '../../../core/widgets/dialogs_and_bottom_sheets.dart';
import '../../../core/widgets/spacing.dart';
import '../../product_details_screen/cubit/product_details_cubit.dart';
import '../../product_details_screen/screens/product_details_bottomsheet_content.dart';
import '../cubit/category_details_cubit.dart';

class CategoryMealItem extends StatefulWidget {
  const CategoryMealItem({super.key, required this.index});
  final int index;
  @override
  State<CategoryMealItem> createState() => _CategoryMealItemState();
}

class _CategoryMealItemState extends State<CategoryMealItem> {
  late CategoryDetailsCubit categoryDetailsCubit;
  @override
  void initState() {
    super.initState();
    categoryDetailsCubit = CategoryDetailsCubit.get(context);
  }

  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        DialogAndBottomSheets.previewBottomSheet(
            context: context,
            buildWidget: BlocProvider(
              create: (context) => sl<ProductDetailsCubit>(),
              child: MealDetailsBottomSheetConetnt(
                productId: categoryDetailsCubit
                    .categoryMealsModel!.data!.products![widget.index].id
                    .toString(),
                productOldPrice: categoryDetailsCubit.categoryMealsModel!.data!
                    .products![widget.index].priceBeforeDiscount
                    .toString(),
                productPrice: categoryDetailsCubit
                    .categoryMealsModel!.data!.products![widget.index].price
                    .toString(),
              ),
            ));
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12.r),
        child: Container(
          height: 234.06.h,
          width: 173.w,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  width: Sizes.getWidth(context),
                  height: 119.06.h,
                  child: CachedImageWidget(
                    imgUrl: categoryDetailsCubit.categoryMealsModel?.data
                            ?.products?[widget.index].image ??
                        "",
                    circleShimmer: false,
                    isUserImg: false,
                    radius: 0,
                    shimmerHeight: 40.h,
                    shimmerWidth: 40.w,
                  )),
              Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.blackColor.withOpacity(0.1),
                      blurRadius: 16,
                      spreadRadius: 0,
                      offset: Offset(0, 0),
                    ),
                  ],
                ),
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 10.h, horizontal: 5.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      HeightSpace(4),
                      Text(
                        "${categoryDetailsCubit.categoryMealsModel?.data?.products?[widget.index].name}",
                        style: AppTextStyles
                            .semiBold15BlackSecondaryFontFamilyStyle,
                      ),
                      HeightSpace(4),
                      Text(
                        "${categoryDetailsCubit.categoryMealsModel?.data?.products?[widget.index].description}",
                        style: AppTextStyles
                            .regular13BlackSecondaryFontFamilyStyle
                            .copyWith(overflow: TextOverflow.ellipsis),
                      ),
                      HeightSpace(29.h),
                    ],
                  ),
                ),
              ),
              Stack(
                alignment: Alignment.topRight,
                children: [
                  Container(
                    width: Sizes.getWidth(context),
                    height: 32.56.h,
                    color: AppColors.whiteColor,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 16),
                      child: Text(
                        categoryDetailsCubit.categoryMealsModel?.data
                                    ?.products?[widget.index].isSingle ==
                                false
                            ? "price upon selection"
                            : "\$${categoryDetailsCubit.categoryMealsModel?.data?.products?[widget.index].price}",
                        style: categoryDetailsCubit.categoryMealsModel?.data
                                    ?.products?[widget.index].isSingle ==
                                false
                            ? AppTextStyles.regular22PcolorThirdFontFamilyStyle
                                .copyWith(fontSize: 12.sp)
                            : AppTextStyles.regular22PcolorThirdFontFamilyStyle,
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Image.asset(
                      AppAssets.plusIc,
                      width: 28.24.w,
                      height: 28.24.h,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
