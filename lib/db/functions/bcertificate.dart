import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:main/db/db_models/birth_certificate.dart';

ValueNotifier<List<BirthCertificate>>bcertificateListNotifier = ValueNotifier([]);
Future<void> getAllBC() async{
   final bcDB = await Hive.openBox<BirthCertificate>('bcertificate');
   bcertificateListNotifier.value.clear();
   bcertificateListNotifier.value.addAll(bcDB.values);
   bcertificateListNotifier.notifyListeners();
}

Future<void> onSubmit(BirthCertificate bc) async {
  final box = await Hive.openBox<BirthCertificate>('bcertificate');
  box.add(bc);
  getAllBC();
}
Future<void> deleteBc(int id) async{
   final bcDB = await Hive.openBox<BirthCertificate>('bcertificate');
   await bcDB.deleteAt(id);
  getAllBC();
}