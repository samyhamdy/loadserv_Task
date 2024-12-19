import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/app_assets/app_assets.dart';
import '../../../core/app_colors/app_colors.dart';
import '../../../core/app_styles/text_styles.dart';
import '../../../core/widgets/app_text_form_field.dart';

class SearchTextFormField extends StatelessWidget {
  const SearchTextFormField({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 26.h,
      ),
      child: AppTextFormField(
        backgroundColor: AppColors.whiteColor,
        hintText: "Search here",
        prefixIcon: Padding(
          padding: EdgeInsets.all(6.sp),
          child: Image.asset(
            AppAssets.searchIc,
            width: 32.w,
            height: 32.h,
          ),
        ),
        hintStyle: AppTextStyles.semiBold12BlackFourthFontFamilyStyle,
        suffixIcon: Padding(
          padding: EdgeInsets.all(6.sp),
          child: Image.asset(
            AppAssets.closeIc,
            width: 28.w,
            height: 28.h,
          ),
        ),
      ),
    );
  }
}
