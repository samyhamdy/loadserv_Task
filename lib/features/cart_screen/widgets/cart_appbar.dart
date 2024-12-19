import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/app_assets/app_assets.dart';
import '../../../core/app_colors/app_colors.dart';
import '../../../core/app_styles/text_styles.dart';
import '../../../core/widgets/spacing.dart';

class CartAppBar extends StatelessWidget {
  const CartAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Container(
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
          ),
          WidthSpace(84),
          Text(
            "Cart Screen",
            style: AppTextStyles.bold24WhiteStyle
                .copyWith(color: AppColors.blackColor),
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
    );
  }
}
