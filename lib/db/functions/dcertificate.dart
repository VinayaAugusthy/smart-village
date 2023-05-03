import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:main/db/db_models/death_certificate.dart';

ValueNotifier<List<DeathCertificate>>dcertificateListNotifier = ValueNotifier([]);
Future<void> getAllDC() async{
   final dcDB = await Hive.openBox<DeathCertificate>('dcertificate');
   dcertificateListNotifier.value.clear();
   dcertificateListNotifier.value.addAll(dcDB.values);
   dcertificateListNotifier.notifyListeners();
}

Future<void> onSubmit(DeathCertificate dc) async {
  final box = await Hive.openBox<DeathCertificate>('dcertificate');
  box.add(dc);
  getAllDC();
}
Future<void> deleteDc(int id) async{
   final dcDB = await Hive.openBox<DeathCertificate>('dcertificate');
   await dcDB.deleteAt(id);
  getAllDC();
}