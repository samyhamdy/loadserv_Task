import 'package:loadserv_task/core/app_colors/app_colors.dart';
import 'package:loadserv_task/core/app_styles/text_styles.dart';
import 'package:loadserv_task/core/widgets/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppOutlinedButton extends StatelessWidget {
  final double? borderRadius;
  final Color? borderColor;
  final Color? overlayColor;
  final double? borderWidth;
  final double? horizontalPadding;
  final double? verticalPadding;
  final double? width;
  final double? height;
  final double? fontSize;
  final String buttonText;
  final TextStyle? textStyle;
  final void Function()? onPressed;
  final Widget? preIcon;
  final Color? fillColor;
  final bool isLoading;

  const AppOutlinedButton({
    super.key,
    this.borderRadius,
    this.borderColor,
    this.overlayColor,
    this.borderWidth,
    this.horizontalPadding,
    this.verticalPadding,
    this.height,
    this.width,
    this.fontSize,
    required this.buttonText,
    this.textStyle,
    required this.onPressed,
    this.fillColor,
    this.preIcon,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: ButtonStyle(
        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
                borderRadius != null ? borderRadius!.r : 16.0.r),
          ),
        ),
        side: WidgetStateProperty.all<BorderSide>(
          BorderSide(
            color: borderColor ?? AppColors.primaryColor,
            width: borderWidth ?? 1.0,
          ),
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
        backgroundColor:
            WidgetStateProperty.all(fillColor ?? Colors.transparent),
        overlayColor: WidgetStateProperty.resolveWith<Color?>(
          (states) {
            if (states.contains(WidgetState.pressed)) {
              return overlayColor ??
                  AppColors
                      .primaryColor; // Change to desired splash color or keep transparent
            }
            return null; // Use default overlay color
          },
        ),
      ),
      onPressed: onPressed,
      child: isLoading
          ? SizedBox(
              width: 20.dm,
              height: 20.dm,
              child: CircularProgressIndicator(
                color: borderColor ?? Colors.white,
              ))
          : Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                preIcon != null ? preIcon! : const SizedBox.shrink(),
                preIcon != null ? WidthSpace(6.w) : const SizedBox.shrink(),
                Text(
                  buttonText,
                  textAlign: TextAlign.center,
                  style: textStyle ??
                      AppTextStyles.btnTextStyle.copyWith(
                        color: AppColors.primaryColor,
                        fontSize: fontSize ?? 16.sp,
                      ),
                ),
              ],
            ),
    );
  }
}
