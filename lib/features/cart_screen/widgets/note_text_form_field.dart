import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/app_assets/app_assets.dart';
import '../../../core/app_colors/app_colors.dart';
import '../../../core/app_styles/text_styles.dart';
import '../../../core/widgets/app_text_form_field.dart';

class NoteTextFormField extends StatelessWidget {
  const NoteTextFormField({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 26.h,
      ),
      child: AppTextFormField(
        backgroundColor: AppColors.whiteColor,
        contentPadding: EdgeInsets.all(20.sp),
        hintText: "Add a note",
        hintStyle: AppTextStyles.semiBold12BlackFourthFontFamilyStyle,
      ),
    );
  }
}
