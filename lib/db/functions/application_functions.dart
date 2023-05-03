import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:main/db/db_models/applications.dart';

ValueNotifier<List<Applications>>appListNotifier = ValueNotifier([]);
Future<void> getAllApps() async{
   final appDB = await Hive.openBox<Applications>('applications');
   appListNotifier.value.clear();
   appListNotifier.value.addAll(appDB.values);
   appListNotifier.notifyListeners();
}

Future<void> onSubmitApps(Applications apps) async {
  final box = await Hive.openBox<Applications>('applications');
  box.add(apps);
  getAllApps();
}
Future<void> deleteApps(int id) async{
   final appDB = await Hive.openBox<Applications>('applications');
   await appDB.deleteAt(id);
  getAllApps();
}