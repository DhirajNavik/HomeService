// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_hive_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CartHiveModelAdapter extends TypeAdapter<CartHiveModel> {
  @override
  final typeId = 0;

  @override
  CartHiveModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CartHiveModel(
      id: fields[0] as String,
      quantity: (fields[1] as num).toInt(),
    );
  }

  @override
  void write(BinaryWriter writer, CartHiveModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.quantity);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CartHiveModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
