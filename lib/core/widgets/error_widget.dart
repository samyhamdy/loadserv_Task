import 'package:loadserv_task/core/app_assets/app_assets.dart';
import 'package:loadserv_task/core/main_services/screen_sizes.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ErrorLottieWidget extends StatelessWidget {
  const ErrorLottieWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: Sizes.getWidth(context),
        height: Sizes.getHeight(context),
        child: Center(
            child: LottieBuilder.asset(
          AppAssets.errorLottie,
          width: Sizes.getWidth(context) * 0.4,
          height: Sizes.getWidth(context) * 0.4,
          fit: BoxFit.fill,
        )));
  }
}
