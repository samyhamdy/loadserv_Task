// To parse this JSON data, do
//
//     final checkoutResponseModel = checkoutResponseModelFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'checkout_response_model.g.dart';

CheckoutResponseModel checkoutResponseModelFromJson(String str) =>
    CheckoutResponseModel.fromJson(json.decode(str));

String checkoutResponseModelToJson(CheckoutResponseModel data) =>
    json.encode(data.toJson());

@JsonSerializable()
class CheckoutResponseModel {
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "data")
  final CheckoutResponseModelData? data;

  CheckoutResponseModel({
    this.message,
    this.data,
  });

  factory CheckoutResponseModel.fromJson(Map<String, dynamic> json) =>
      _$CheckoutResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$CheckoutResponseModelToJson(this);
}

@JsonSerializable()
class CheckoutResponseModelData {
  @JsonKey(name: "uuid")
  final String? uuid;
  @JsonKey(name: "data")
  final DataData? data;

  CheckoutResponseModelData({
    this.uuid,
    this.data,
  });

  factory CheckoutResponseModelData.fromJson(Map<String, dynamic> json) =>
      _$CheckoutResponseModelDataFromJson(json);

  Map<String, dynamic> toJson() => _$CheckoutResponseModelDataToJson(this);
}

@JsonSerializable()
class DataData {
  @JsonKey(name: "products")
  final List<Product>? products;

  DataData({
    this.products,
  });

  factory DataData.fromJson(Map<String, dynamic> json) =>
      _$DataDataFromJson(json);

  Map<String, dynamic> toJson() => _$DataDataToJson(this);
}

@JsonSerializable()
class Product {
  @JsonKey(name: "id")
  final String? id;
  @JsonKey(name: "quantity")
  final String? quantity;
  @JsonKey(name: "price")
  final String? price;

  Product({
    this.id,
    this.quantity,
    this.price,
  });

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);

  Map<String, dynamic> toJson() => _$ProductToJson(this);
}
