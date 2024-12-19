// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_details_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ExtraItemAdapter extends TypeAdapter<ExtraItem> {
  @override
  final int typeId = 4;

  @override
  ExtraItem read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ExtraItem(
      id: fields[0] as int?,
      name: fields[1] as String?,
      price: fields[2] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, ExtraItem obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.price);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ExtraItemAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class SaladAdapter extends TypeAdapter<Salad> {
  @override
  final int typeId = 3;

  @override
  Salad read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Salad(
      id: fields[0] as int?,
      name: fields[1] as String?,
      price: fields[2] as int?,
      image: fields[3] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Salad obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.price)
      ..writeByte(3)
      ..write(obj.image);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SaladAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class WeightAdapter extends TypeAdapter<Weight> {
  @override
  final int typeId = 2;

  @override
  Weight read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Weight(
      id: fields[0] as int?,
      name: fields[1] as String?,
      price: fields[2] as int?,
      points: fields[3] as int?,
      priceBeforeDiscount: fields[4] as int?,
      numberOfSalad: fields[5] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, Weight obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.price)
      ..writeByte(3)
      ..write(obj.points)
      ..writeByte(4)
      ..write(obj.priceBeforeDiscount)
      ..writeByte(5)
      ..write(obj.numberOfSalad);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WeightAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductDetailsModel _$ProductDetailsModelFromJson(Map<String, dynamic> json) =>
    ProductDetailsModel(
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ProductDetailsModelToJson(
        ProductDetailsModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      description: json['description'] as String?,
      image: json['image'] as String?,
      isSingle: json['is_single'] as bool?,
      points: (json['points'] as num?)?.toInt(),
      extraItems: (json['extra_items'] as List<dynamic>?)
          ?.map((e) =>
              e == null ? null : ExtraItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      salads: (json['salads'] as List<dynamic>?)
          ?.map((e) => Salad.fromJson(e as Map<String, dynamic>))
          .toList(),
      weights: (json['weights'] as List<dynamic>?)
          ?.map((e) => Weight.fromJson(e as Map<String, dynamic>))
          .toList(),
      price: (json['price'] as num?)?.toInt(),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'image': instance.image,
      'is_single': instance.isSingle,
      'points': instance.points,
      'extra_items': instance.extraItems,
      'salads': instance.salads,
      'weights': instance.weights,
      'price': instance.price,
    };

ExtraItem _$ExtraItemFromJson(Map<String, dynamic> json) => ExtraItem(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      price: (json['price'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ExtraItemToJson(ExtraItem instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'price': instance.price,
    };

Salad _$SaladFromJson(Map<String, dynamic> json) => Salad(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      price: (json['price'] as num?)?.toInt(),
      image: json['image'] as String?,
    );

Map<String, dynamic> _$SaladToJson(Salad instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'price': instance.price,
      'image': instance.image,
    };

Weight _$WeightFromJson(Map<String, dynamic> json) => Weight(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      price: (json['price'] as num?)?.toInt(),
      points: (json['points'] as num?)?.toInt(),
      priceBeforeDiscount: (json['price_before_discount'] as num?)?.toInt(),
      numberOfSalad: (json['number_of_salad'] as num?)?.toInt(),
    );

Map<String, dynamic> _$WeightToJson(Weight instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'price': instance.price,
      'points': instance.points,
      'price_before_discount': instance.priceBeforeDiscount,
      'number_of_salad': instance.numberOfSalad,
    };
