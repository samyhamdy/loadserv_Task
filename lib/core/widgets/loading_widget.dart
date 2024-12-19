import 'package:loadserv_task/core/app_assets/app_assets.dart';
import 'package:loadserv_task/core/app_colors/app_colors.dart';
import 'package:loadserv_task/core/main_services/screen_sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class LoadingWidget extends StatelessWidget {
  final double? width;
  final double? height;
  final double? screenWidth;
  final double? screenHeight;
  const LoadingWidget({
    super.key,
    this.width,
    this.height,
    this.screenWidth,
    this.screenHeight,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
        child: ColorFiltered(
      colorFilter: ColorFilter.mode(
        AppColors.primaryColor,
        BlendMode.srcIn,
      ),
      child: LottieBuilder.asset(
        AppAssets.loadingLottie,
        width: width ?? 130.w,
        height: height ?? 130.w,
      ),
    ));
  }
}
