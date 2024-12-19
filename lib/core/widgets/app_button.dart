import 'package:loadserv_task/core/app_colors/app_colors.dart';
import 'package:loadserv_task/core/app_styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppButton extends StatelessWidget {
  final double? borderRadius;
  final Color? backgroundColor;
  final double? horizontalPadding;
  final double? verticalPadding;
  final double? width;
  final double? height;
  final String buttonText;
  final TextStyle? textStyle;
  final VoidCallback onPressed;
  final double? fontSize;

  const AppButton({
    super.key,
    this.borderRadius,
    this.backgroundColor,
    this.horizontalPadding,
    this.verticalPadding,
    this.height,
    this.width,
    required this.buttonText,
    this.textStyle,
    this.fontSize,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 16.0),
          ),
        ),
        backgroundColor: WidgetStatePropertyAll(
          backgroundColor ?? AppColors.primaryColor,
        ),
        padding: WidgetStateProperty.all<EdgeInsets>(
          EdgeInsets.symmetric(
            horizontal: horizontalPadding?.w ?? 32.w,
            vertical: verticalPadding?.h ?? 14.h,
          ),
        ),
        fixedSize: WidgetStateProperty.all(
          Size(width ?? double.maxFinite, height ?? 50.h),
        ),
        overlayColor: WidgetStateProperty.resolveWith<Color?>(
          (states) {
            if (states.contains(WidgetState.pressed)) {
              return backgroundColor ??
                  AppColors
                      .primaryColor; // Change to desired splash color or keep transparent
            }
            return null; // Use default overlay color
          },
        ),
      ),
      onPressed: onPressed,
      child: Text(
        buttonText,
        textAlign: TextAlign.center,
        style: textStyle ??
            AppTextStyles.btnTextStyle.copyWith(fontSize: fontSize ?? 16.sp),
      ),
    );
  }
}

class AppLoadingButton extends StatelessWidget {
  final double? borderRadius;
  final Color? backgroundColor;
  final double? horizontalPadding;
  final double? verticalPadding;
  final double? width;
  final double? height;

  const AppLoadingButton({
    super.key,
    this.borderRadius,
    this.backgroundColor,
    this.horizontalPadding,
    this.verticalPadding,
    this.height,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 16.0),
          ),
        ),
        backgroundColor: WidgetStatePropertyAll(
          backgroundColor ?? AppColors.primaryColor,
        ),
        padding: WidgetStateProperty.all<EdgeInsets>(
          EdgeInsets.symmetric(
            horizontal: horizontalPadding?.w ?? 32.w,
            vertical: verticalPadding?.h ?? 14.h,
          ),
        ),
        fixedSize: WidgetStateProperty.all(
          Size(width?.w ?? double.maxFinite, height ?? 50.h),
        ),
        overlayColor: WidgetStateProperty.resolveWith<Color?>(
          (states) {
            if (states.contains(WidgetState.pressed)) {
              return backgroundColor ??
                  AppColors
                      .primaryColor; // Change to desired splash color or keep transparent
            }
            return null; // Use default overlay color
          },
        ),
      ),
      onPressed: () {},
      child: SizedBox(
          width: 20.dm,
          height: 20.dm,
          child: const CircularProgressIndicator(
            color: Colors.white,
          )),
    );
  }
}
