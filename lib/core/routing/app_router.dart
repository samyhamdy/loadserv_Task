import 'dart:developer';
import 'package:loadserv_task/core/main_services/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loadserv_task/features/category_products_screen/cubit/category_details_cubit.dart';
import 'package:loadserv_task/features/category_products_screen/screens/category_details_screen.dart';
import 'package:loadserv_task/features/product_details_screen/cubit/product_details_cubit.dart';
import 'package:loadserv_task/features/splash_screen/screens/splash_screen.dart';
import '../../features/cart_screen/screens/cart_screen.dart';
import 'routes.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    log("Navigating to route: ${settings.name}");
    final arguments = settings.arguments;

    switch (settings.name) {
      case Routes.splash:
        return MaterialPageRoute(
          builder: (context) => const SplashScreen(),
        );

      case Routes.categoryDetailsScreen:
        return MaterialPageRoute(
          builder: (context) => MultiBlocProvider(providers: [
            BlocProvider(
              create: (context) => sl<CategoryDetailsCubit>(),
            ),
          ], child: const CategoryMealsScreen()),
        );

      case Routes.cartScreen:
        return MaterialPageRoute(
          builder: (context) => MultiBlocProvider(providers: [
            BlocProvider(
              create: (context) => sl<CategoryDetailsCubit>(),
            ),
            BlocProvider(
              create: (context) => sl<ProductDetailsCubit>(),
            ),
          ], child: const CartScreen()),
        );

      default:
        return MaterialPageRoute(
          builder: (context) => const Scaffold(
            body: Center(
              child: Text('Route not found'),
            ),
          ),
        );
    }
  }
}
