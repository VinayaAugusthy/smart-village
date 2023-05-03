import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:main/Screens/login.dart';
import 'package:main/db/db_models/applications.dart';
import 'package:main/db/db_models/birth_certificate.dart';
import 'package:main/db/db_models/death_certificate.dart';
import 'package:main/db/db_models/events.dart';
import 'package:main/db/db_models/user_model.dart';

import 'db/db_models/complaint.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();

  Hive.registerAdapter(UserAdapter());
  Hive.registerAdapter(ComplaintAdapter());
  Hive.registerAdapter(EventsAdapter()); 
  Hive.registerAdapter(BirthCertificateAdapter());
  Hive.registerAdapter(DeathCertificateAdapter());
  Hive.registerAdapter(ApplicationsAdapter());

  await Hive.openBox<User>('users');
  await Hive.openBox<Complaint>('complaint');
  await Hive.openBox<Events>('events');
  await Hive.openBox<BirthCertificate>('bcerificate');
  await Hive.openBox<DeathCertificate>('dcertificate');
  await Hive.openBox<Applications>('applications');

  runApp( const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const LoginScreen(),
    );
  }
}

