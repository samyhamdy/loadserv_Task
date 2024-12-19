import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loadserv_task/core/main_services/screen_sizes.dart';

import '../cubit/category_details_cubit.dart';
import 'category_meal_item.dart';

class CategoryItems extends StatefulWidget {
  const CategoryItems({super.key});

  @override
  State<CategoryItems> createState() => _CategoryItemsState();
}

class _CategoryItemsState extends State<CategoryItems> {
  late CategoryDetailsCubit categoryDetailsCubit;
  @override
  void initState() {
    super.initState();
    categoryDetailsCubit = CategoryDetailsCubit.get(context);
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible:
          categoryDetailsCubit.categoryMealsModel?.data?.products?.length !=
                  0 &&
              categoryDetailsCubit.categoryMealsModel != null,
      child: Padding(
        padding: EdgeInsets.only(top: 16.h),
        child: Container(
          height: Sizes.getHeight(context) * 0.55,
          child: GridView.count(
            primary: false,
            padding: EdgeInsets.symmetric(horizontal: 18.w),
            crossAxisSpacing: 10.w,
            mainAxisSpacing: 10.h,
            crossAxisCount: 2,
            childAspectRatio: 0.80.sp,
            children: List.generate(
              categoryDetailsCubit.categoryMealsModel?.data?.products?.length ??
                  0,
              (index) => CategoryMealItem(
                index: index,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
