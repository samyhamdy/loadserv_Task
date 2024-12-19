import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loadserv_task/core/app_colors/app_colors.dart';

import '../cubit/product_details_cubit.dart';
import '../models/product_details_model.dart';

class CircularCheck extends StatefulWidget {
  final Weight selectedMealWeight;
  const CircularCheck({super.key, required this.selectedMealWeight});
  @override
  _CircularCheckState createState() => _CircularCheckState();
}

class _CircularCheckState extends State<CircularCheck> {
  bool isChecked = false;
  late ProductDetailsCubit productDetailsCubit;
  @override
  initState() {
    super.initState();
    productDetailsCubit = ProductDetailsCubit.get(context);
  }

  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isChecked = !isChecked;
        });
        productDetailsCubit.changeMealWeight(
            selectedMealWeight: widget.selectedMealWeight);
      },
      child: Container(
        width: 27.46.w,
        height: 27.46.h,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isChecked ? AppColors.primaryColor : Colors.white,
          border: Border.all(
            color: isChecked ? Colors.white : Colors.black,
            width: 1,
          ),
        ),
        child: isChecked
            ? Icon(
                Icons.check,
                color: AppColors.whiteColor,
                size: 20.sp,
              )
            : null,
      ),
    );
  }
}
