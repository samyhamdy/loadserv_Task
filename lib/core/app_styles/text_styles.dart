import 'package:loadserv_task/core/app_colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../app_fonts/app_fonts.dart';

class AppTextStyles {
  AppTextStyles._();

  static TextStyle bold24WhiteStyle = TextStyle(
    color: AppColors.whiteColor,
    fontSize: 24.sp,
    fontWeight: FontWeight.w700,
  );
  static TextStyle semiBold16GreyStyle = TextStyle(
    color: AppColors.greyColor,
    fontSize: 16.sp,
    fontWeight: FontWeight.w600,
  );
  static TextStyle semiBold15BlackSecondaryFontFamilyStyle = TextStyle(
      color: AppColors.blackColor,
      fontSize: 15.sp,
      fontWeight: FontWeight.w600,
      fontFamily: AppFonts.secondaryFontFamily);
  static TextStyle regular13BlackSecondaryFontFamilyStyle = TextStyle(
      color: AppColors.blackColor,
      fontSize: 13.sp,
      fontWeight: FontWeight.w400,
      fontFamily: AppFonts.secondaryFontFamily);
  static TextStyle regular22PcolorThirdFontFamilyStyle = TextStyle(
      color: AppColors.primaryColor,
      fontSize: 22.sp,
      fontWeight: FontWeight.w400,
      fontFamily: AppFonts.thirdFontFamily);

  static TextStyle bold12BlackFourthFontFamilyStyle = TextStyle(
      color: AppColors.blackColor,
      fontSize: 12.sp,
      fontWeight: FontWeight.w700,
      fontFamily: AppFonts.fourthFontFamily);

  static TextStyle bold12PcolorFourthFontFamilyStyle = TextStyle(
      color: AppColors.blackColor,
      fontSize: 12.sp,
      fontWeight: FontWeight.w700,
      fontFamily: AppFonts.fourthFontFamily);
  static TextStyle bold12darkBlueFourthFontFamilyStyle = TextStyle(
      color: AppColors.darkBlueColor,
      fontSize: 15.sp,
      fontWeight: FontWeight.w700,
      fontFamily: AppFonts.fourthFontFamily);
  static TextStyle semiBold12BlackFourthFontFamilyStyle = TextStyle(
      color: AppColors.darkBlueColor,
      fontSize: 12.sp,
      fontWeight: FontWeight.w600,
      fontFamily: AppFonts.fourthFontFamily);
  static TextStyle btnTextStyle = TextStyle(
      color: AppColors.whiteColor,
      fontSize: 16.sp,
      fontWeight: FontWeight.w700,
      fontFamily: AppFonts.fourthFontFamily);
}
