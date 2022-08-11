// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'preset_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PresetModelAdapter extends TypeAdapter<PresetModel> {
  @override
  final int typeId = 1;

  @override
  PresetModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PresetModel(
      id: fields[0] as String,
      presetName: fields[1] as String,
      schedules: (fields[2] as List?)?.cast<ScheduleModel>(),
    );
  }

  @override
  void write(BinaryWriter writer, PresetModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.presetName)
      ..writeByte(2)
      ..write(obj.schedules);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PresetModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
