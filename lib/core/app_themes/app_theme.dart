import 'package:loadserv_task/core/app_colors/app_colors.dart';
import 'package:loadserv_task/core/app_fonts/app_fonts.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData themeData = ThemeData(
      fontFamily: AppFonts.mainfontFamily,
      primaryColor: AppColors.primaryColor,
      primaryColorLight: AppColors.primaryColor.withOpacity(0.1),
      scaffoldBackgroundColor: AppColors.whiteColor,
      checkboxTheme: CheckboxThemeData(
        side: const BorderSide(color: AppColors.primaryColor),
        checkColor:
            WidgetStateProperty.resolveWith<Color>((Set<WidgetState> states) {
          if (states.contains(WidgetState.disabled)) {
            return AppColors.primaryColor;
          }
          return AppColors.primaryColor;
        }),
        fillColor:
            WidgetStateProperty.resolveWith<Color>((Set<WidgetState> states) {
          if (states.contains(WidgetState.disabled)) {
            return AppColors.whiteColor;
          }
          return AppColors.whiteColor;
        }),
      ));
}
