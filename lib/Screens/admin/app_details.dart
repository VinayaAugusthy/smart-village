import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:main/db/db_models/applications.dart';

class AppDetails extends StatelessWidget {
   AppDetails({super.key,required this.passId,required this.passValue});

Applications passValue;
final int passId;

late Box appBox;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(

    );
  }
}