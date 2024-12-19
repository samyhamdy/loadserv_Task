import 'package:cached_network_image/cached_network_image.dart';
import 'package:loadserv_task/core/app_colors/app_colors.dart';
import 'package:loadserv_task/core/widgets/shimmer_widget.dart';
import 'package:flutter/material.dart';

class CachedImageWidget extends StatelessWidget {
  const CachedImageWidget({
    super.key,
    required this.imgUrl,
    required this.circleShimmer,
    this.isUserImg = false,
    required this.shimmerHeight,
    required this.shimmerWidth,
    this.radius = 0,
    this.fit = BoxFit.cover,
    this.isTechNoImage = false,
  });

  final String imgUrl;
  final bool circleShimmer;
  final bool isUserImg;
  final double shimmerHeight;
  final double shimmerWidth;
  final double radius;
  final BoxFit fit;
  final bool isTechNoImage;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
        imageUrl: imgUrl,
        fit: fit,
        height: shimmerHeight,
        width: shimmerWidth,
        placeholder: (context, url) => circleShimmer
            ? ShimmerWidget.circular(height: shimmerHeight, width: shimmerWidth)
            : ShimmerWidget.rectangular(
                height: shimmerHeight,
                width: shimmerWidth,
                withRadius: false,
              ),
        errorWidget: (context, url, error) => Icon(
              Icons.error,
              color: AppColors.redColor,
            ));
  }
}
