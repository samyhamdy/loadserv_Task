import 'package:hive/hive.dart';

import 'meal_info_model.dart';

part 'meal_list_model.g.dart';

@HiveType(typeId: 5)
class MealListModel {
  @HiveField(0)
  final List<MealInfoModel> meals;

  MealListModel(this.meals);
}
