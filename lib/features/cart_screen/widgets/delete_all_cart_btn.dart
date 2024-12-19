import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/app_colors/app_colors.dart';
import '../../../core/widgets/app_button.dart';
import '../../../main.dart';

class DeleteAllCartBtn extends StatefulWidget {
  const DeleteAllCartBtn({super.key, required this.onPressed});
  final void Function() onPressed;
  @override
  State<DeleteAllCartBtn> createState() => _DeleteAllCartBtnState();
}

class _DeleteAllCartBtnState extends State<DeleteAllCartBtn> {
  @override
  Widget build(BuildContext context) {
    return AppButton(
        width: 382.w,
        height: 45.h,
        horizontalPadding: 0,
        verticalPadding: 0,
        backgroundColor: AppColors.redColor,
        buttonText: "Delete All",
        onPressed: widget.onPressed);
  }
}
