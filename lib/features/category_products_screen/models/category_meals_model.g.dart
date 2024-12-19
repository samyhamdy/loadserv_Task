// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_meals_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoryMealsModel _$CategoryMealsModelFromJson(Map<String, dynamic> json) =>
    CategoryMealsModel(
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CategoryMealsModelToJson(CategoryMealsModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      backgroundImage: json['background_image'] as String?,
      image: json['image'] as String?,
      products: (json['products'] as List<dynamic>?)
          ?.map((e) => Product.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'background_image': instance.backgroundImage,
      'image': instance.image,
      'products': instance.products,
    };

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      description: json['description'] as String?,
      image: json['image'] as String?,
      isSingle: json['is_single'] as bool?,
      price: (json['price'] as num?)?.toInt(),
      priceBeforeDiscount: (json['price_before_discount'] as num?)?.toInt(),
      points: (json['points'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'image': instance.image,
      'is_single': instance.isSingle,
      'price': instance.price,
      'price_before_discount': instance.priceBeforeDiscount,
      'points': instance.points,
    };
