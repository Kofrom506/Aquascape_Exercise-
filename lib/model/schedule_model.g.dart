// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schedule_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ScheduleModelAdapter extends TypeAdapter<ScheduleModel> {
  @override
  final int typeId = 0;

  @override
  ScheduleModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ScheduleModel(
      startIntensity: fields[2] as double,
      endIntensity: fields[3] as double,
    )
      ..startActive = fields[0] as DateTime
      ..endActive = fields[1] as DateTime;
  }

  @override
  void write(BinaryWriter writer, ScheduleModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.startActive)
      ..writeByte(1)
      ..write(obj.endActive)
      ..writeByte(2)
      ..write(obj.startIntensity)
      ..writeByte(3)
      ..write(obj.endIntensity);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ScheduleModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
