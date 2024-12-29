import 'dart:io';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:loadserv_task/core/main_services/locator.dart';
import 'package:loadserv_task/features/product_details_screen/models/product_details_model.dart';
import 'app.dart';
import 'core/routing/app_router.dart';
import 'features/product_details_screen/models/meal_info_model.dart';
import 'features/product_details_screen/models/meal_list_model.dart';

late Box<MealListModel> box;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setup();
  await Hive.initFlutter();
  Hive.registerAdapter(MealInfoModelAdapter());
  Hive.registerAdapter(WeightAdapter());
  Hive.registerAdapter(ExtraItemAdapter());
  Hive.registerAdapter(SaladAdapter());
  Hive.registerAdapter(MealListModelAdapter());
  box = await Hive.openBox<MealListModel>('cartBox');
  runApp(App(appRouter: AppRouter()));
}
