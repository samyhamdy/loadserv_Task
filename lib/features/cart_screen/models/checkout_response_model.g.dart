// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'checkout_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CheckoutResponseModel _$CheckoutResponseModelFromJson(
        Map<String, dynamic> json) =>
    CheckoutResponseModel(
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : CheckoutResponseModelData.fromJson(
              json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CheckoutResponseModelToJson(
        CheckoutResponseModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.data,
    };

CheckoutResponseModelData _$CheckoutResponseModelDataFromJson(
        Map<String, dynamic> json) =>
    CheckoutResponseModelData(
      uuid: json['uuid'] as String?,
      data: json['data'] == null
          ? null
          : DataData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CheckoutResponseModelDataToJson(
        CheckoutResponseModelData instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'data': instance.data,
    };

DataData _$DataDataFromJson(Map<String, dynamic> json) => DataData(
      products: (json['products'] as List<dynamic>?)
          ?.map((e) => Product.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DataDataToJson(DataData instance) => <String, dynamic>{
      'products': instance.products,
    };

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
      id: json['id'] as String?,
      quantity: json['quantity'] as String?,
      price: json['price'] as String?,
    );

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'id': instance.id,
      'quantity': instance.quantity,
      'price': instance.price,
    };
