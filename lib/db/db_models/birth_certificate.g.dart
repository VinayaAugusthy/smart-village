// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'birth_certificate.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BirthCertificateAdapter extends TypeAdapter<BirthCertificate> {
  @override
  final int typeId = 3;

  @override
  BirthCertificate read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BirthCertificate(
      cname: fields[0] as String,
      sex: fields[1] as String,
      dob: fields[2] as String,
      fname: fields[3] as String,
      mname: fields[4] as String,
      place: fields[5] as String,
      address: fields[6] as String,
      paddress: fields[7] as String,
    );
  }

  @override
  void write(BinaryWriter writer, BirthCertificate obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.cname)
      ..writeByte(1)
      ..write(obj.sex)
      ..writeByte(2)
      ..write(obj.dob)
      ..writeByte(3)
      ..write(obj.fname)
      ..writeByte(4)
      ..write(obj.mname)
      ..writeByte(5)
      ..write(obj.place)
      ..writeByte(6)
      ..write(obj.address)
      ..writeByte(7)
      ..write(obj.paddress);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BirthCertificateAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
