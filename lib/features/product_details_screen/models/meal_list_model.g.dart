// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meal_list_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MealListModelAdapter extends TypeAdapter<MealListModel> {
  @override
  final int typeId = 5;

  @override
  MealListModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MealListModel(
      (fields[0] as List).cast<MealInfoModel>(),
    );
  }

  @override
  void write(BinaryWriter writer, MealListModel obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.meals);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MealListModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
