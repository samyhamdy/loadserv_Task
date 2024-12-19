// To parse this JSON data, do
//
//     final categoryMealsModel = categoryMealsModelFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'category_meals_model.g.dart';

CategoryMealsModel categoryMealsModelFromJson(String str) =>
    CategoryMealsModel.fromJson(json.decode(str));

String categoryMealsModelToJson(CategoryMealsModel data) =>
    json.encode(data.toJson());

@JsonSerializable()
class CategoryMealsModel {
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "data")
  final Data? data;

  CategoryMealsModel({
    this.message,
    this.data,
  });

  factory CategoryMealsModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryMealsModelFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryMealsModelToJson(this);
}

@JsonSerializable()
class Data {
  @JsonKey(name: "id")
  final int? id;
  @JsonKey(name: "name")
  final String? name;
  @JsonKey(name: "background_image")
  final String? backgroundImage;
  @JsonKey(name: "image")
  final String? image;
  @JsonKey(name: "products")
  final List<Product>? products;

  Data({
    this.id,
    this.name,
    this.backgroundImage,
    this.image,
    this.products,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}

@JsonSerializable()
class Product {
  @JsonKey(name: "id")
  final int? id;
  @JsonKey(name: "name")
  final String? name;
  @JsonKey(name: "description")
  final String? description;
  @JsonKey(name: "image")
  final String? image;
  @JsonKey(name: "is_single")
  final bool? isSingle;
  @JsonKey(name: "price")
  final int? price;
  @JsonKey(name: "price_before_discount")
  final int? priceBeforeDiscount;
  @JsonKey(name: "points")
  final int? points;

  Product({
    this.id,
    this.name,
    this.description,
    this.image,
    this.isSingle,
    this.price,
    this.priceBeforeDiscount,
    this.points,
  });

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);

  Map<String, dynamic> toJson() => _$ProductToJson(this);
}
