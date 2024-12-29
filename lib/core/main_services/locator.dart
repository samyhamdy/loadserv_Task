import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:loadserv_task/core/helper/api_service.dart';
import 'package:loadserv_task/features/product_details_screen/cubit/product_details_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../features/category_products_screen/cubit/category_details_cubit.dart';
import '../../features/category_products_screen/repo/category_details_repo.dart';
import '../../features/product_details_screen/repo/product_details_repo.dart';
import '../app_storage/cache_helper.dart';
import '../helper/dio_factory.dart';

GetIt sl = GetIt.I;
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

Future<void> setup() async {
  try {
    sl.allowReassignment = true;
    sl.registerSingleton<SharedPreferences>(
        await SharedPreferences.getInstance());
    sl.registerSingleton<CacheHelper>(await CacheHelper.getInstance());
    Dio dio = await DioFactory.getDio();
    sl.registerLazySingleton<ApiService>(() => ApiService(dio));
    sl.registerLazySingleton<CategoryDetailsRepo>(
        () => CategoryDetailsRepo(sl()));
    sl.registerLazySingleton<ProductDetailsRepo>(
        () => ProductDetailsRepo(sl()));
    sl.registerFactory<CategoryDetailsCubit>(() => CategoryDetailsCubit(sl()));
    sl.registerFactory<ProductDetailsCubit>(() => ProductDetailsCubit(sl()));

    print('Setup completed successfully.');
  } catch (e) {
    print('Error during setup: $e');
  }
}

class NavigationService {
  static Future<dynamic> navigateTo(String routeName, {args}) {
    return navigatorKey.currentState!.pushNamed(routeName, arguments: args);
  }

  static Future<dynamic> navigateAndRemoveTo(String routeName, {args}) {
    return navigatorKey.currentState!
        .pushReplacementNamed(routeName, arguments: args);
  }
}
