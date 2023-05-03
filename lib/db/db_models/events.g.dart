// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'events.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class EventsAdapter extends TypeAdapter<Events> {
  @override
  final int typeId = 2;

  @override
  Events read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Events(
      eventName: fields[1] as String,
      date: fields[2] as String,
      time: fields[3] as String,
      venue: fields[4] as String,
      description: fields[5] as String,
      id: fields[0] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, Events obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.eventName)
      ..writeByte(2)
      ..write(obj.date)
      ..writeByte(3)
      ..write(obj.time)
      ..writeByte(4)
      ..write(obj.venue)
      ..writeByte(5)
      ..write(obj.description);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EventsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
