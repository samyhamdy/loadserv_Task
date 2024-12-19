import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loadserv_task/core/app_assets/app_assets.dart';
import 'package:loadserv_task/core/app_colors/app_colors.dart';
import 'package:loadserv_task/core/helper/extension.dart';
import '../../../core/routing/routes.dart';
import '../../../core/widgets/loading_widget.dart';
import '../cubit/category_details_cubit.dart';
import '../cubit/category_details_state.dart';
import '../widgets/category_details_appbar.dart';
import '../widgets/category_items.dart';
import '../widgets/search_text_form_field.dart';

class CategoryMealsScreen extends StatefulWidget {
  const CategoryMealsScreen({super.key});

  @override
  State<CategoryMealsScreen> createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  late CategoryDetailsCubit categoryDetailsCubit;
  @override
  void initState() {
    super.initState();
    categoryDetailsCubit = CategoryDetailsCubit.get(context);
    categoryDetailsCubit.gettingCategoryDetails(categoryId: "11");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      backgroundColor: AppColors.whiteColor,
      floatingActionButton: GestureDetector(
        onTap: () {
          context.pushNamed(Routes.cartScreen);
        },
        child: CircleAvatar(
            radius: 30,
            backgroundColor: AppColors.primaryColor,
            child: Image.asset(
              AppAssets.cartIc,
              width: 30.w,
              height: 30.h,
              color: AppColors.whiteColor,
            )),
      ),
      body: BlocConsumer<CategoryDetailsCubit, CategoryDetailsState>(
        builder: (context, state) {
          return state.maybeWhen(
            loadingGettingCategoryDetails: () => LoadingWidget(),
            orElse: () {
              return SafeArea(
                child: Column(
                  children: [
                    CategoryDetailsAppbar(),
                    SearchTextFormField(),
                    CategoryItems(),
                  ],
                ),
              );
            },
          );
        },
        listener: (context, state) {
          state.whenOrNull(
            errorGettingCategoryDetails: (error) {
              AnimatedSnackBar.material(
                error,
                type: AnimatedSnackBarType.error,
                duration: const Duration(seconds: 3),
              ).show(
                context,
              );
            },
          );
        },
      ),
    );
  }
}
