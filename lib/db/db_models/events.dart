import 'package:hive_flutter/adapters.dart';
part 'events.g.dart';

@HiveType(typeId: 2)
class Events extends HiveObject{

  @HiveField(0)
  int? id;

  @HiveField(1)
  final String eventName;

  @HiveField(2)
  final String date;

  @HiveField(3)
  final String time;

  @HiveField(4)
  final String venue;
 
  @HiveField(5)
  final String description;
  
  Events({required this.eventName,required this.date,required this.time,required this.venue,required this.description,this.id});
}