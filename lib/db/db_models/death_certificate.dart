import 'package:hive_flutter/adapters.dart';
part 'death_certificate.g.dart';


@HiveType(typeId:4 )
class DeathCertificate {
  
  @HiveField(0)
  String date;

  @HiveField(1)
  String name;

  @HiveField(2)
  String address;

  @HiveField(3)
  String sex;

  @HiveField(4)
  String age;

  @HiveField(5)
  String place;

  @HiveField(6)
  String religion;

  @HiveField(7)
  String fname;

  @HiveField(8)
  String mname;

  DeathCertificate({required this.date,required this.name,required this.address,required this.sex,required this.age,required this.place,required this.religion,required this.fname,required this.mname});
}