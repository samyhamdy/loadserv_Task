// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meal_info_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MealInfoModelAdapter extends TypeAdapter<MealInfoModel> {
  @override
  final int typeId = 1;

  @override
  MealInfoModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MealInfoModel(
      fields[7] as int?,
      name: fields[0] as String?,
      price: fields[1] as int?,
      quantity: fields[2] as int?,
      image: fields[3] as String?,
      salads: (fields[5] as List)
          .map((dynamic e) => (e as Map).cast<Salad, int>())
          .toList(),
      weight: fields[4] as Weight?,
      description: fields[8] as String?,
      extraItems: (fields[6] as List?)?.cast<ExtraItem?>(),
    );
  }

  @override
  void write(BinaryWriter writer, MealInfoModel obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.price)
      ..writeByte(2)
      ..write(obj.quantity)
      ..writeByte(3)
      ..write(obj.image)
      ..writeByte(4)
      ..write(obj.weight)
      ..writeByte(5)
      ..write(obj.salads)
      ..writeByte(6)
      ..write(obj.extraItems)
      ..writeByte(7)
      ..write(obj.id)
      ..writeByte(8)
      ..write(obj.description);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MealInfoModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
