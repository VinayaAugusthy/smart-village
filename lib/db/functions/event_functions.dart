import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:main/db/db_models/events.dart';


ValueNotifier<List<Events>>eventListNotifier = ValueNotifier([]);


Future<void> addEvents(Events value) async{
  //studentListNotifier.value.add(value);

  final eventDB = await Hive.openBox<Events>('events');
 final _id = await eventDB.add(value);
 value.id=_id;
 getAllEvents();
//studentListNotifier.value.add(value);
  eventListNotifier.notifyListeners();
}

Future<void> getAllEvents() async{
   final eventDB = await Hive.openBox<Events>('events');
   eventListNotifier.value.clear();
  // for (var student in studentDB.values) {
  //   studentListNotifier.value.add(student);
  // }
   eventListNotifier.value.addAll(eventDB.values);
   eventListNotifier.notifyListeners();
}

Future<void> deleteEvent(int id) async{
   final eventDB = await Hive.openBox<Events>('events');
   await eventDB.deleteAt(id);
  getAllEvents();
}

Future<void> updateEvent(int id,Events value) async{
   final eventDB = await Hive.openBox<Events>('events');
   eventListNotifier.value.clear();
   await eventDB.putAt(id,value);
  getAllEvents();
}