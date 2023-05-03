import 'package:hive_flutter/adapters.dart';

part 'birth_certificate.g.dart';

@HiveType(typeId: 3)
class BirthCertificate {
  @HiveField(0)
  String cname;

  @HiveField(1)
  String sex;

  @HiveField(2)
  String dob;

  @HiveField(3)
  String fname;

  @HiveField(4)
  String mname;

  @HiveField(5)
  String place;

  @HiveField(6)
  String address;

  @HiveField(7)
  String paddress;

 

  BirthCertificate({
    required this.cname,
    required this.sex,
    required this.dob,
    required this.fname,
    required this.mname,
    required this.place,
    required this.address,
    required this.paddress,
  });
}
