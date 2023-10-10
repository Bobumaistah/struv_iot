// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hardware_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HardwareModelAdapter extends TypeAdapter<HardwareModel> {
  @override
  final int typeId = 1;

  @override
  HardwareModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HardwareModel(
      devOneID: fields[0] as String?,
      devTwoID: fields[1] as String?,
      type: fields[2] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, HardwareModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.devOneID)
      ..writeByte(1)
      ..write(obj.devTwoID)
      ..writeByte(2)
      ..write(obj.type);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HardwareModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
