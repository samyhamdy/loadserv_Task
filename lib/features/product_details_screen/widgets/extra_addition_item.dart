import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/app_colors/app_colors.dart';
import '../../../core/app_styles/text_styles.dart';
import '../../../core/widgets/spacing.dart';
import '../cubit/product_details_cubit.dart';
import '../models/product_details_model.dart';

class ExtraAdditionItem extends StatefulWidget {
  const ExtraAdditionItem({
    super.key,
    required this.extraItem,
  });
  final ExtraItem extraItem;

  @override
  State<ExtraAdditionItem> createState() => _ExtraAdditionItemState();
}

class _ExtraAdditionItemState extends State<ExtraAdditionItem> {
  late ProductDetailsCubit productDetailsCubit;
  bool isSelected = false;

  @override
  void initState() {
    super.initState();
    productDetailsCubit = ProductDetailsCubit.get(context);
  }

  Widget build(BuildContext context) {
    return Container(
      width: 384.w,
      height: 45.h,
      margin: EdgeInsets.symmetric(vertical: 10.h),
      child: Row(
        children: [
          WidthSpace(8.w),
          Text(
            widget.extraItem.name ?? "",
            style: AppTextStyles.bold12BlackFourthFontFamilyStyle,
          ),
          const Spacer(), // Ensure it's directly in the Row
          Row(
            children: [
              Text(
                "${widget.extraItem.price ?? 0} EGP",
                style: AppTextStyles.semiBold12BlackFourthFontFamilyStyle
                    .copyWith(fontSize: 11.sp, color: AppColors.blackColor),
              ),
              Checkbox(
                value: isSelected,
                onChanged: (v) {
                  setState(() {
                    isSelected = !isSelected;
                    productDetailsCubit.addExtraToMeal(
                      isAdd: isSelected,
                      extraItem: widget.extraItem,
                    );
                  });
                },
              ),
            ],
          )
        ],
      ),
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
    );
  }
}
