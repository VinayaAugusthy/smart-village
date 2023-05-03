// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'death_certificate.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DeathCertificateAdapter extends TypeAdapter<DeathCertificate> {
  @override
  final int typeId = 4;

  @override
  DeathCertificate read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DeathCertificate(
      date: fields[0] as String,
      name: fields[1] as String,
      address: fields[2] as String,
      sex: fields[3] as String,
      age: fields[4] as String,
      place: fields[5] as String,
      religion: fields[6] as String,
      fname: fields[7] as String,
      mname: fields[8] as String,
    );
  }

  @override
  void write(BinaryWriter writer, DeathCertificate obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.date)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.address)
      ..writeByte(3)
      ..write(obj.sex)
      ..writeByte(4)
      ..write(obj.age)
      ..writeByte(5)
      ..write(obj.place)
      ..writeByte(6)
      ..write(obj.religion)
      ..writeByte(7)
      ..write(obj.fname)
      ..writeByte(8)
      ..write(obj.mname);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DeathCertificateAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
