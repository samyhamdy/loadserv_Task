import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loadserv_task/core/app_assets/app_assets.dart';
import '../../../core/app_colors/app_colors.dart';
import '../../../core/app_styles/text_styles.dart';
import '../../../core/main_services/locator.dart';
import '../../../core/widgets/cached_image_widget.dart';
import '../../../core/widgets/dialogs_and_bottom_sheets.dart';
import '../../../core/widgets/spacing.dart';
import '../../product_details_screen/cubit/product_details_cubit.dart';
import '../../product_details_screen/models/meal_info_model.dart';
import '../../product_details_screen/screens/product_details_bottomsheet_content.dart';

class CartSingleMeal extends StatefulWidget {
  const CartSingleMeal(
      {super.key, required this.mealInfoModel, required this.index});
  final MealInfoModel mealInfoModel;
  final int index;

  @override
  State<CartSingleMeal> createState() => _CartSingleMealState();
}

class _CartSingleMealState extends State<CartSingleMeal> {
  late ProductDetailsCubit productDetailsCubit;
  bool isNoted = false;
  @override
  void initState() {
    super.initState();
    productDetailsCubit = ProductDetailsCubit.get(context);
  }

  Widget build(BuildContext context) {
    return Container(
      width: 383.11.w,
      height: 170.71.h,
      margin: EdgeInsets.symmetric(horizontal: 18.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(
          color: AppColors.whiteColor,
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.blackColor.withOpacity(0.1),
            offset: Offset(0, 4),
            blurRadius: 4,
            spreadRadius: 0,
          ),
        ],
        shape: BoxShape.rectangle,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.w),
        child: Row(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(25.r),
                  child: SizedBox(
                      width: 132.7.w,
                      height: 132.7.h,
                      child: CachedImageWidget(
                        imgUrl: widget.mealInfoModel.image ?? "",
                        circleShimmer: true,
                        isUserImg: true,
                        radius: 24.r,
                        shimmerHeight: 40.h,
                        shimmerWidth: 40.w,
                      )),
                ),
                GestureDetector(
                  onTap: () {
                    productDetailsCubit.clearItemFromCart(
                        index: widget.index,
                        mealInfoModel: widget.mealInfoModel);
                  },
                  child: Image.asset(
                    AppAssets.deleteIc,
                    width: 24.w,
                    height: 24.h,
                  ),
                )
              ],
            ),
            WidthSpace(12.w),
            SizedBox(
              width: 230.w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  HeightSpace(12),
                  Text(
                    widget.mealInfoModel.name ?? "",
                    style: AppTextStyles.bold12BlackFourthFontFamilyStyle
                        .copyWith(
                            overflow: TextOverflow.ellipsis, fontSize: 14.sp),
                  ),
                  Row(
                    children: [
                      Container(
                        // color: Colors.amber,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            widget.mealInfoModel.weight == null
                                ? SizedBox.shrink()
                                : Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text("Weight: ",
                                          style: AppTextStyles
                                              .semiBold12BlackFourthFontFamilyStyle),
                                      Text(
                                        "${widget.mealInfoModel.weight?.name}",
                                        style: AppTextStyles
                                            .bold12BlackFourthFontFamilyStyle
                                            .copyWith(
                                                color: AppColors.greyColor),
                                      ),
                                    ],
                                  ),
                            HeightSpace(2.h),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text("Salads: ",
                                    style: AppTextStyles
                                        .semiBold12BlackFourthFontFamilyStyle),
                                Text(
                                  "${widget.mealInfoModel.salads.length > 1 ? "${widget.mealInfoModel.salads.length} salads" : "${widget.mealInfoModel.salads[0].keys.toList()[0].name} salad"}",
                                  style: AppTextStyles
                                      .bold12BlackFourthFontFamilyStyle
                                      .copyWith(color: AppColors.greyColor),
                                ),
                              ],
                            ),
                            HeightSpace(2.h),
                            widget.mealInfoModel.extraItems != null &&
                                    widget.mealInfoModel.extraItems?.length != 0
                                ? Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text("Extras: ",
                                          style: AppTextStyles
                                              .semiBold12BlackFourthFontFamilyStyle),
                                      Text(
                                          "${widget.mealInfoModel.extraItems!.length > 1 ? "${widget.mealInfoModel.extraItems!.length}" : "${widget.mealInfoModel.extraItems?[0]?.name ?? ""}"}",
                                          style: AppTextStyles
                                              .semiBold12BlackFourthFontFamilyStyle),
                                    ],
                                  )
                                : SizedBox.shrink(),
                          ],
                        ),
                      ),
                      Spacer(),
                      Column(
                        children: [
                          GestureDetector(
                              onTap: () {
                                productDetailsCubit.increaseMealCount();
                              },
                              child: Image.asset(
                                AppAssets.plusIc,
                                width: 25.w,
                                height: 25.h,
                              )),
                          HeightSpace(10.h),
                          Text(
                            productDetailsCubit.mealQuantity.toString(),
                            style: AppTextStyles
                                .bold12BlackFourthFontFamilyStyle
                                .copyWith(fontSize: 14),
                          ),
                          HeightSpace(10.h),
                          GestureDetector(
                              onTap: () {
                                productDetailsCubit.decreaseMealCount();
                              },
                              child: Image.asset(
                                AppAssets.minusIc,
                                width: 25.w,
                                height: 25.h,
                              )),
                        ],
                      ),
                    ],
                  ),
                  HeightSpace(12.h),
                  SizedBox(
                    width: 200.w,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "${widget.mealInfoModel.price.toString()} EGP",
                          style: AppTextStyles.bold12BlackFourthFontFamilyStyle
                              .copyWith(
                                  overflow: TextOverflow.ellipsis,
                                  fontSize: 14.sp),
                        ),
                        GestureDetector(
                            onTap: () {
                              DialogAndBottomSheets.previewBottomSheet(
                                  context: context,
                                  buildWidget: BlocProvider(
                                    create: (context) =>
                                        sl<ProductDetailsCubit>(),
                                    child: MealDetailsBottomSheetConetnt(
                                      productId:
                                          widget.mealInfoModel.id.toString(),
                                      productOldPrice: 0.toString(),
                                      productPrice:
                                          widget.mealInfoModel.price.toString(),
                                      isFromUpdate: true,
                                      mealInfoModel: widget.mealInfoModel,
                                    ),
                                  ));
                            },
                            child: Image.asset(
                              AppAssets.editIc,
                              width: 32.w,
                              height: 32.h,
                            )),
                        GestureDetector(
                            onTap: () async {
                              isNoted =
                                  await DialogAndBottomSheets.showNoteDialog(
                                        context,
                                        title: "Note",
                                        content: "Add a note ",
                                      ) ??
                                      false;
                              setState(() {});
                            },
                            child: Image.asset(
                              AppAssets.noteIc,
                              width: 24.w,
                              height: 24.h,
                              color:
                                  isNoted == true ? Colors.green : Colors.red,
                              colorBlendMode: BlendMode.srcIn,
                            )),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
