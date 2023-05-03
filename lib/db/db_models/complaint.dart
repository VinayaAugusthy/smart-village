import 'package:hive/hive.dart';

part 'complaint.g.dart';

@HiveType(typeId: 1)
class Complaint extends HiveObject {
  @HiveField(0)
  String name;

  @HiveField(1)
  String email;

  @HiveField(2)
  String phone;

  @HiveField(3)
  String address;

  @HiveField(4)
  String comment;

  Complaint(this.name, this.email, this.phone, this.address, this.comment);
}
