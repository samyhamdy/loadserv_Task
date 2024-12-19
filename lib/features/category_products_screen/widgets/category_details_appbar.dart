import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loadserv_task/core/widgets/cached_image_widget.dart';
import 'package:loadserv_task/core/widgets/spacing.dart';
import '../../../core/app_assets/app_assets.dart';
import '../../../core/app_colors/app_colors.dart';
import '../../../core/app_styles/text_styles.dart';
import '../../../core/main_services/screen_sizes.dart';
import '../cubit/category_details_cubit.dart';

class CategoryDetailsAppbar extends StatefulWidget {
  const CategoryDetailsAppbar({super.key});

  @override
  State<CategoryDetailsAppbar> createState() => _CategoryDetailsAppbarState();
}

class _CategoryDetailsAppbarState extends State<CategoryDetailsAppbar> {
  late CategoryDetailsCubit categoryDetailsCubit;
  @override
  void initState() {
    categoryDetailsCubit = CategoryDetailsCubit.get(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
            width: Sizes.getWidth(context),
            height: 290.h,
            child: Column(
              children: [
                CachedImageWidget(
                  imgUrl: categoryDetailsCubit
                          .categoryMealsModel?.data?.backgroundImage ??
                      "",
                  circleShimmer: false,
                  isUserImg: false,
                  radius: 24.r,
                  shimmerHeight: 230.h,
                  shimmerWidth: Sizes.getWidth(context),
                ),
                Container(
                  color: Colors.white,
                  height: 60.h,
                )
              ],
            )),
        Positioned(
          top: 20.h,
          child: Container(
            child: Row(
              children: [
                Container(
                  width: 32.w,
                  height: 32.h,
                  margin: EdgeInsets.only(left: 24.w),
                  child: Padding(
                    padding: EdgeInsets.all(3.0.sp),
                    child: Image.asset(
                      AppAssets.backIc,
                      width: 24.8.w,
                      height: 24.8.h,
                    ),
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.whiteColor,
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                ),
                WidthSpace(84),
                Text(
                  categoryDetailsCubit.categoryMealsModel?.data?.name ?? "",
                  style: AppTextStyles.bold24WhiteStyle,
                ),
                WidthSpace(84),
                Container(
                  width: 32.w,
                  height: 32.h,
                  margin: EdgeInsets.only(right: 24.w),
                  child: Padding(
                    padding: EdgeInsets.all(3.0.sp),
                    child: Image.asset(
                      AppAssets.menuIc,
                      width: 24.8.w,
                      height: 24.8.h,
                    ),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.r),
                    color: AppColors.whiteColor,
                  ),
                ),
              ],
            ),
          ),
        ),
        HeightSpace(32),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: SizedBox(
            height: 132.h,
            width: 132.w,
            child: CircleAvatar(
              radius: 1000.r,
              backgroundColor: AppColors.whiteColor.withOpacity(0.5),
              child: SizedBox(
                height: 107.61.h,
                width: 107.61.w,
                child: CircleAvatar(
                  backgroundColor: AppColors.whiteColor,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(1000.r),
                    child: CachedImageWidget(
                      imgUrl: categoryDetailsCubit
                              .categoryMealsModel?.data?.image ??
                          "",
                      circleShimmer: true,
                      isUserImg: true,
                      radius: 1000.r,
                      shimmerHeight: 40.h,
                      shimmerWidth: 40.w,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
