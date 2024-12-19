import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loadserv_task/core/app_assets/app_assets.dart';
import '../../../core/app_colors/app_colors.dart';
import '../../../core/app_styles/text_styles.dart';
import '../../../core/widgets/cached_image_widget.dart';
import '../../../core/widgets/spacing.dart';
import '../cubit/product_details_cubit.dart';

class ProductPricesQuantityName extends StatefulWidget {
  const ProductPricesQuantityName(
      {super.key,
      required this.productId,
      required this.productPrice,
      required this.productOldPrice});
  final String productId;
  final String productPrice;
  final String productOldPrice;
  @override
  State<ProductPricesQuantityName> createState() =>
      _ProductPricesQuantityNameState();
}

class _ProductPricesQuantityNameState extends State<ProductPricesQuantityName> {
  late ProductDetailsCubit productDetailsCubit;
  @override
  void initState() {
    super.initState();
    productDetailsCubit = ProductDetailsCubit.get(context);
  }

  Widget build(BuildContext context) {
    return Container(
      width: 398.11.w,
      height: 140.71.h,
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(
          color: AppColors.whiteColor,
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.blackColor.withOpacity(0.1),
            offset: Offset(0, 4),
            blurRadius: 4,
            spreadRadius: 0,
          ),
        ],
        shape: BoxShape.rectangle,
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(25.r),
            child: SizedBox(
                width: 132.7.w,
                height: 132.7.h,
                child: CachedImageWidget(
                  imgUrl:
                      productDetailsCubit.productDetailsModel?.data?.image ??
                          "",
                  circleShimmer: true,
                  isUserImg: true,
                  radius: 24.r,
                  shimmerHeight: 40.h,
                  shimmerWidth: 40.w,
                )),
          ),
          WidthSpace(12.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 16.h),
                child: Text(
                  productDetailsCubit.productDetailsModel?.data?.name ?? "",
                  style: AppTextStyles.bold12BlackFourthFontFamilyStyle
                      .copyWith(overflow: TextOverflow.ellipsis),
                ),
              ),
              Spacer(),
              Row(
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "${widget.productOldPrice.toString()} EGP",
                        style: AppTextStyles.bold12BlackFourthFontFamilyStyle
                            .copyWith(
                                decoration: TextDecoration.lineThrough,
                                color: AppColors.lightGreyColor),
                      ),
                      HeightSpace(2.h),
                      Text(
                        "${widget.productPrice.toString()} EGP",
                        style: AppTextStyles.bold12BlackFourthFontFamilyStyle
                            .copyWith(
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  WidthSpace(52.w),
                  Row(
                    children: [
                      GestureDetector(
                          onTap: () {
                            productDetailsCubit.increaseMealCount();
                          },
                          child: Image.asset(
                            AppAssets.plusIc,
                            width: 38.9.w,
                            height: 38.9.h,
                          )),
                      WidthSpace(11.w),
                      Text(
                        productDetailsCubit.mealQuantity.toString(),
                        style: AppTextStyles.bold12BlackFourthFontFamilyStyle
                            .copyWith(fontSize: 14),
                      ),
                      WidthSpace(11.w),
                      GestureDetector(
                          onTap: () {
                            productDetailsCubit.decreaseMealCount();
                          },
                          child: Image.asset(
                            AppAssets.minusIc,
                            width: 38.9.w,
                            height: 38.9.h,
                          )),
                    ],
                  ),
                  // HeightSpace(10.h),
                ],
              ),
              HeightSpace(12.h)
            ],
          )
        ],
      ),
    );
  }
}
