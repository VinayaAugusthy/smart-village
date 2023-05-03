
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

import '../db_models/complaint.dart';

ValueNotifier<List<Complaint>>complaintListNotifier = ValueNotifier([]);


Future<void> getAllComplaints() async{
   final complaintDB = await Hive.openBox<Complaint>('complaint');
   complaintListNotifier.value.clear();
  // for (var student in studentDB.values) {
  //   studentListNotifier.value.add(student);
  // }
   complaintListNotifier.value.addAll(complaintDB.values);
   complaintListNotifier.notifyListeners();
}

Future<void> onSubmit(Complaint complaint) async {
  // get the Hive box and save the Complaint object
  final box = await Hive.openBox<Complaint>('complaint');
  box.add(complaint);
  getAllComplaints();

  // show a snackbar and navigate to the home screen
  // callSnackBar(msg: 'Successfully submitted', ctx: ctx);
  // Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx) => const UserHome()));
}
Future<void> deleteComplaint(int id) async{
   final complaintDB = await Hive.openBox<Complaint>('complaint');
   await complaintDB.deleteAt(id);
  getAllComplaints();
}
