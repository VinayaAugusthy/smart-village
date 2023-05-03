// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'applications.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ApplicationsAdapter extends TypeAdapter<Applications> {
  @override
  final int typeId = 5;

  @override
  Applications read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Applications(
      subject: fields[0] as String,
      name: fields[1] as String,
      ward: fields[2] as String,
      description: fields[4] as String,
      address: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Applications obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.subject)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.ward)
      ..writeByte(3)
      ..write(obj.address)
      ..writeByte(4)
      ..write(obj.description);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ApplicationsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
