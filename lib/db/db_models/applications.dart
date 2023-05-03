import 'package:hive_flutter/adapters.dart';
part 'applications.g.dart';


@HiveType(typeId: 5)
class Applications{

  @HiveField(0)
  String subject;

  @HiveField(1)
  String name;

  @HiveField(2)
  String ward;

 @HiveField(3)
 String address;

  @HiveField(4)
  String description;

  Applications({required this.subject,required this.name,required this.ward,required this.description,required this.address});
}