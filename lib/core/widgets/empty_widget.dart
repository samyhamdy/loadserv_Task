import 'package:loadserv_task/core/app_assets/app_assets.dart';
import 'package:loadserv_task/core/app_colors/app_colors.dart';
import 'package:loadserv_task/core/main_services/screen_sizes.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class EmptyLottieWidget extends StatelessWidget {
  const EmptyLottieWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: LottieBuilder.asset(
      AppAssets.emptyLottie,
      width: Sizes.getWidth(context) * 0.6,
      height: Sizes.getWidth(context) * 0.6,
      fit: BoxFit.fill,
    ));
  }
}
