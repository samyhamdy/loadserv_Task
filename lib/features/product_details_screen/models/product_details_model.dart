// To parse this JSON data, do
//
//     final productDetailsModel = productDetailsModelFromJson(jsonString);

import 'package:hive_flutter/hive_flutter.dart';
import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'product_details_model.g.dart';

ProductDetailsModel productDetailsModelFromJson(String str) =>
    ProductDetailsModel.fromJson(json.decode(str));

String productDetailsModelToJson(ProductDetailsModel data) =>
    json.encode(data.toJson());

@JsonSerializable()
class ProductDetailsModel {
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "data")
  final Data? data;

  ProductDetailsModel({
    this.message,
    this.data,
  });

  factory ProductDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$ProductDetailsModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductDetailsModelToJson(this);
}

@JsonSerializable()
class Data {
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
  @JsonKey(name: "points")
  final int? points;
  @JsonKey(name: "extra_items")
  final List<ExtraItem?>? extraItems;
  @JsonKey(name: "salads")
  final List<Salad>? salads;
  @JsonKey(name: "weights")
  final List<Weight>? weights;
  @JsonKey(name: "price")
  final int? price;
  Data({
    this.id,
    this.name,
    this.description,
    this.image,
    this.isSingle,
    this.points,
    this.extraItems,
    this.salads,
    this.weights,
    this.price,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}

@JsonSerializable()
@HiveType(typeId: 4)
class ExtraItem {
  @JsonKey(name: "id")
  @HiveField(0)
  final int? id;
  @JsonKey(name: "name")
  @HiveField(1)
  final String? name;
  @JsonKey(name: "price")
  @HiveField(2)
  final int? price;

  ExtraItem({
    this.id,
    this.name,
    this.price,
  });

  factory ExtraItem.fromJson(Map<String, dynamic> json) =>
      _$ExtraItemFromJson(json);

  Map<String, dynamic> toJson() => _$ExtraItemToJson(this);
}

@JsonSerializable()
@HiveType(typeId: 3)
class Salad {
  @JsonKey(name: "id")
  @HiveField(0)
  final int? id;
  @JsonKey(name: "name")
  @HiveField(1)
  final String? name;
  @JsonKey(name: "price")
  @HiveField(2)
  final int? price;
  @JsonKey(name: "image")
  @HiveField(3)
  final String? image;

  Salad({
    this.id,
    this.name,
    this.price,
    this.image,
  });

  factory Salad.fromJson(Map<String, dynamic> json) => _$SaladFromJson(json);

  Map<String, dynamic> toJson() => _$SaladToJson(this);
}

@JsonSerializable()
@HiveType(typeId: 2)
class Weight {
  @JsonKey(name: "id")
  @HiveField(0)
  final int? id;
  @JsonKey(name: "name")
  @HiveField(1)
  final String? name;
  @JsonKey(name: "price")
  @HiveField(2)
  final int? price;
  @JsonKey(name: "points")
  @HiveField(3)
  final int? points;
  @JsonKey(name: "price_before_discount")
  @HiveField(4)
  final int? priceBeforeDiscount;
  @JsonKey(name: "number_of_salad")
  @HiveField(5)
  final int? numberOfSalad;

  Weight({
    this.id,
    this.name,
    this.price,
    this.points,
    this.priceBeforeDiscount,
    this.numberOfSalad,
  });

  factory Weight.fromJson(Map<String, dynamic> json) => _$WeightFromJson(json);

  Map<String, dynamic> toJson() => _$WeightToJson(this);
}
