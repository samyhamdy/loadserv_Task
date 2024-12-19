import 'package:loadserv_task/core/app_colors/app_colors.dart';
import 'package:loadserv_task/core/app_styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextFormField extends StatelessWidget {
  final EdgeInsetsGeometry? contentPadding;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final double borderRadius;
  final TextStyle? hintStyle;
  final String? hintText;
  final TextStyle? labelStyle;
  final String? labelText;
  final bool? isObscureText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final Color? backgroundColor;
  final TextEditingController? controller;
  final TextInputType? textInputType;
  final double? horizontalPadding;
  final TextInputAction? textInputAction;
  final String? Function(String? val)? validator;
  final Function(String s)? onChanged;
  final Function(String?)? onFieldSubmitted;
  final bool? enabled;
  final Function()? onTap;
  final bool hasTitle;
  final bool isTitleBold;
  final String title;
  final int numberOfLines;
  final bool? readOnly;

  const AppTextFormField({
    super.key,
    this.contentPadding,
    this.focusedBorder,
    this.enabledBorder,
    this.borderRadius = 8,
    this.horizontalPadding,
    this.textInputType,
    this.textInputAction,
    this.hintStyle,
    this.hintText,
    this.isObscureText,
    this.suffixIcon,
    this.backgroundColor,
    this.controller,
    this.validator,
    this.hasTitle = true,
    this.title = "",
    this.numberOfLines = 1,
    this.readOnly = false,
    this.isTitleBold = false,
    this.onTap,
    this.prefixIcon,
    this.onFieldSubmitted,
    this.labelStyle,
    this.labelText,
    this.onChanged,
    this.enabled,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding ?? 15.w),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextFormField(
            readOnly: readOnly ?? false,
            controller: controller,
            enabled: enabled ?? true,
            maxLines: numberOfLines,
            keyboardType: textInputType ?? TextInputType.text,
            textInputAction: textInputAction ?? TextInputAction.next,
            decoration: InputDecoration(
              isDense: true,
              contentPadding: contentPadding ??
                  EdgeInsets.symmetric(horizontal: 30.w, vertical: 18.h),
              focusedBorder: focusedBorder ??
                  OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: AppColors.whiteColor,
                      width: 1.3,
                    ),
                    borderRadius: BorderRadius.circular(borderRadius),
                  ),
              enabledBorder: enabledBorder ??
                  OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: AppColors.whiteColor,
                      width: 1.3,
                    ),
                    borderRadius: BorderRadius.circular(borderRadius),
                  ),
              errorBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Colors.red,
                  width: 1.3,
                ),
                borderRadius: BorderRadius.circular(borderRadius),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Colors.red,
                  width: 1.3,
                ),
                borderRadius: BorderRadius.circular(borderRadius),
              ),
              disabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: AppColors.whiteColor,
                  width: 1.3,
                ),
                borderRadius: BorderRadius.circular(borderRadius),
              ),
              labelText: labelText,
              labelStyle: labelStyle ??
                  AppTextStyles.btnTextStyle
                      .copyWith(color: AppColors.whiteColor),
              hintStyle: hintStyle ??
                  AppTextStyles.btnTextStyle
                      .copyWith(color: AppColors.whiteColor),
              hintText: hintText,
              suffixIcon: suffixIcon,
              prefixIcon: prefixIcon,
              fillColor: backgroundColor ?? Colors.white,
              filled: true,
              alignLabelWithHint: true,
            ),
            obscureText: isObscureText ?? false,
            style: AppTextStyles.bold12BlackFourthFontFamilyStyle,
            cursorColor: AppColors.whiteColor,
            textAlignVertical: TextAlignVertical.top,
            onTap: onTap,
            onFieldSubmitted: onFieldSubmitted,
            validator: validator,
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }
}
