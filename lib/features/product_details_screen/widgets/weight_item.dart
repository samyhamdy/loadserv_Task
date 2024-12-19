import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/app_colors/app_colors.dart';
import '../../../core/app_styles/text_styles.dart';
import '../../../core/widgets/spacing.dart';

class MealWeightItem extends StatelessWidget {
  const MealWeightItem({
    super.key,
    required this.name,
    required this.price,
    required this.numOfSalad,
    required this.groupValue,
    required this.value,
    required this.onChanged,
  });
  final String name;
  final String price;
  final int numOfSalad;
  final int groupValue;
  final int value;
  final Function(int?)? onChanged;
  Widget build(BuildContext context) {
    return Container(
      width: 186.47.w,
      height: 44.62.h,
      child: Row(
        children: [
          WidthSpace(8.w),
          SizedBox(
            width: 100.w,
            child: Text(
              name,
              style: AppTextStyles.semiBold12BlackFourthFontFamilyStyle
                  .copyWith(
                      fontSize: 11.sp,
                      color: AppColors.blackColor,
                      overflow: TextOverflow.ellipsis),
            ),
          ),
          Spacer(),
          Row(
            children: [
              Text(
                "${price} EGP",
                style: AppTextStyles.semiBold12BlackFourthFontFamilyStyle
                    .copyWith(fontSize: 11.sp, color: AppColors.blackColor),
              ),
              WidthSpace(8.w),
              SizedBox(
                width: 20.w,
                height: 20.h,
                child: Radio<int>(
                  value: value,
                  groupValue: groupValue,
                  onChanged: onChanged,
                  activeColor: AppColors.primaryColor,
                ),
              ),
            ],
          ),
        ],
      ),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
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
    );
  }
}
