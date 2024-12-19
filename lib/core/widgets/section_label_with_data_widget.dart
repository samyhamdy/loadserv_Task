import 'package:loadserv_task/core/app_colors/app_colors.dart';
import 'package:loadserv_task/core/app_styles/text_styles.dart';
import 'package:loadserv_task/core/widgets/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SectionLabelWithDataWidget extends StatelessWidget {
  const SectionLabelWithDataWidget(
      {super.key,
      required this.sectionTitle,
      required this.contentWidget,
      this.sectionTitleStyle,
      this.width,
      this.verticalPadding,
      this.horizontalPadding,
      this.titleAndContentSpace,
      this.onViewAllTapped,
      this.showSeeMore = true});

  final String sectionTitle;
  final Widget contentWidget;
  final TextStyle? sectionTitleStyle;
  final double? width;
  final double? verticalPadding;
  final double? horizontalPadding;
  final double? titleAndContentSpace;
  final bool showSeeMore;
  final void Function()? onViewAllTapped;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      padding: EdgeInsets.symmetric(
        vertical: verticalPadding ?? 12.h,
        horizontal: horizontalPadding ?? 8.w,
      ),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          onViewAllTapped != null
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      sectionTitle,
                      style:
                          sectionTitleStyle ?? AppTextStyles.bold12BlackFourthFontFamilyStyle,
                    ),
                  ],
                )
              : Text(
                  sectionTitle,
                  style: sectionTitleStyle ?? AppTextStyles.bold12BlackFourthFontFamilyStyle,
                ),
          HeightSpace(titleAndContentSpace ?? 12),
          contentWidget,
          const HeightSpace(20),
          showSeeMore
              ? Padding(
                  padding: EdgeInsetsDirectional.only(start: 8.w),
                  child: InkWell(
                    onTap: onViewAllTapped,
                    child: Row(
                      children: [
                        Text(
                          'see_all',
                          style: AppTextStyles.bold12BlackFourthFontFamilyStyle,
                        ),
                      ],
                    ),
                  ),
                )
              : const SizedBox.shrink(),
        ],
      ),
    );
  }
}
