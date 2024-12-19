import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/app_assets/app_assets.dart';
import '../../../core/app_colors/app_colors.dart';
import '../../../core/app_styles/text_styles.dart';
import '../../../core/widgets/cached_image_widget.dart';
import '../../../core/widgets/spacing.dart';
import '../cubit/product_details_cubit.dart';
import '../models/product_details_model.dart';

class SaladItem extends StatefulWidget {
  const SaladItem({
    super.key,
    required this.item,
  });
  final Salad item;
  @override
  State<SaladItem> createState() => _SaladItemState();
}

class _SaladItemState extends State<SaladItem> {
  late ProductDetailsCubit productDetailsCubit;
  int saladQuantity = 0;
  @override
  void initState() {
    super.initState();
    productDetailsCubit = ProductDetailsCubit.get(context);
    saladQuantity = getItemValue(widget.item) ?? 0;
  }

  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: Container(
        width: 383.24.w,
        height: 94.95.h,
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
        child: Padding(
          padding: EdgeInsets.all(8.0.sp),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(25.r),
                child: SizedBox(
                    width: 77.57.w,
                    height: 77.57.h,
                    child: CachedImageWidget(
                      imgUrl: widget.item.image ?? "",
                      circleShimmer: true,
                      isUserImg: true,
                      radius: 10.r,
                      shimmerHeight: 40.h,
                      shimmerWidth: 40.w,
                    )),
              ),
              WidthSpace(12.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  HeightSpace(4.h),
                  Text(
                    widget.item.name ?? "",
                    style: AppTextStyles.bold12BlackFourthFontFamilyStyle
                        .copyWith(overflow: TextOverflow.ellipsis),
                  ),
                  HeightSpace(20.h),
                  Text(
                    "${widget.item.price} EGP",
                    style:
                        AppTextStyles.bold12BlackFourthFontFamilyStyle.copyWith(
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              Spacer(),
              Row(
                children: [
                  WidthSpace(52.w),
                  Row(
                    children: [
                      GestureDetector(
                          onTap: () {
                            if (productDetailsCubit.requiredMealNumOfSalad !=
                                0) {
                              saladQuantity = saladQuantity + 1;
                              productDetailsCubit.increaseMealSaladCount(
                                  selectedMealSalad: widget.item,
                                  selectedMealSaladCount: saladQuantity);
                            }
                          },
                          child: Image.asset(
                            AppAssets.plusIc,
                            width: 32.3.w,
                            height: 32.3.h,
                          )),
                      WidthSpace(11.w),
                      Text(
                        getItemValue(widget.item).toString(),
                        style: AppTextStyles.bold12BlackFourthFontFamilyStyle
                            .copyWith(fontSize: 14),
                      ),
                      WidthSpace(11.w),
                      GestureDetector(
                        onTap: () {
                          if (saladQuantity > 0) {
                            saladQuantity = saladQuantity - 1;
                          }

                          productDetailsCubit.decreaseMealSaladCount(
                              selectedMealSalad: widget.item,
                              selectedMealSaladCount: saladQuantity);
                        },
                        child: Image.asset(
                          AppAssets.minusIc,
                          width: 32.3.w,
                          height: 32.3.h,
                        ),
                      ),
                    ],
                  ),
                  HeightSpace(10.h),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  int? getItemValue(Salad item) {
    for (var saladMap in productDetailsCubit.selectedMealSalads) {
      if (saladMap.containsKey(item)) {
        return saladMap[item];
      }
    }
    return 0;
  }
}
