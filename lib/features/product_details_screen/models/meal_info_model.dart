import 'package:hive_flutter/hive_flutter.dart';
import 'product_details_model.dart';
part 'meal_info_model.g.dart';

@HiveType(typeId: 1)
class MealInfoModel {
  @HiveField(0)
  final String? name;
  @HiveField(1)
  final int? price;
  @HiveField(2)
  final int? quantity;
  @HiveField(3)
  final String? image;
  @HiveField(4)
  final Weight? weight;
  @HiveField(5)
  final List<Map<Salad, int>> salads;
  @HiveField(6)
  final List<ExtraItem?>? extraItems;
  @HiveField(7)
  final int? id;
  @HiveField(8)
  final String? description;
  @HiveField(9)
  MealInfoModel(
    this.id, {
    required this.name,
    required this.price,
    required this.quantity,
    required this.image,
    required this.salads,
    required this.weight,
    required this.description,
    required this.extraItems,
  });
}
