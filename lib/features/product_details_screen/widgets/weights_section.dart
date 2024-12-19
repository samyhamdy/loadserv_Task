import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/app_styles/text_styles.dart';
import 'meal_weights.dart';

class MealWeightsSection extends StatelessWidget {
  const MealWeightsSection({super.key, required this.isVisible});
  final bool isVisible;
  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isVisible,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "weights",
            style: AppTextStyles.bold12darkBlueFourthFontFamilyStyle
                .copyWith(fontSize: 15.sp),
          ),
          MealWeights(),
        ],
      ),
    );
  }
}
