import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:loadserv_task/core/app_assets/app_assets.dart';
import 'package:loadserv_task/core/app_colors/app_colors.dart';
import 'package:loadserv_task/core/app_styles/text_styles.dart';
import 'package:loadserv_task/core/widgets/app_button.dart';
import 'package:loadserv_task/core/widgets/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../features/cart_screen/widgets/note_text_form_field.dart';

class DialogAndBottomSheets {
  DialogAndBottomSheets._();

  static Future<bool?> showNoteDialog(
    BuildContext context, {
    required String title,
    required String content,
    final Function(bool value)? onPressed,
  }) async {
    return showDialog<bool>(
      context: context,
      barrierDismissible: false,
      barrierColor: AppColors.blackColor.withOpacity(0.4),
      builder: (BuildContext context) {
        return Container(
          margin: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
          padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 12.w),
          child: AlertDialog(
            backgroundColor: AppColors.whiteColor,
            elevation: 0,
            insetPadding: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.r),
            ),
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(
                        context, false); // Return false when close is pressed
                  },
                  child: Image.asset(
                    AppAssets.closeIc,
                    width: 36.w,
                    height: 36.h,
                  ),
                ),
                Center(
                  child: Text(
                    title,
                    textAlign: TextAlign.center,
                    style: AppTextStyles.bold12BlackFourthFontFamilyStyle,
                  ),
                ),
                const HeightSpace(16),
                NoteTextFormField(),
                const HeightSpace(24),
              ],
            ),
            actionsPadding: EdgeInsets.symmetric(
              vertical: 16.h,
            ),
            contentPadding: EdgeInsets.symmetric(
              vertical: 12.h,
            ),
            buttonPadding: EdgeInsets.zero,
            alignment: Alignment.center,
            actionsAlignment: MainAxisAlignment.center,
            actions: [
              AppButton(
                width: 133.w,
                height: 35.h,
                buttonText: "Confirm",
                horizontalPadding: 0,
                fontSize: 12.sp,
                onPressed: () {
                  Navigator.pop(context, true);
                  AnimatedSnackBar.material(
                    "Noted successfully",
                    type: AnimatedSnackBarType.success,
                    duration: const Duration(seconds: 3),
                  ).show(context);
                },
              ),
              WidthSpace(8.w),
              AppButton(
                width: 133.w,
                height: 35.h,
                fontSize: 12.sp,
                horizontalPadding: 0,
                buttonText: "Cancel",
                backgroundColor: AppColors.greyColor,
                onPressed: () {
                  Navigator.pop(context, false);
                },
              ),
            ],
          ),
        );
      },
    ).then((value) {
      return value;
    });
  }

  static previewBottomSheet<T>({
    required BuildContext context,
    required Widget buildWidget,
    void Function()? onClose,
  }) {
    return showModalBottomSheet(
      backgroundColor: Colors.white,
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(25.r)),
      ),
      isScrollControlled: true,
      enableDrag: true,
      useSafeArea: true,
      builder: (ctx) {
        return buildWidget;
      },
    ).then((value) {
      if (onClose != null) {
        onClose();
      }
    });
  }
}
