import 'package:flutter/material.dart';
import 'package:main/db/db_models/applications.dart';
import 'package:main/db/functions/application_functions.dart';
import 'package:main/widget/call_textformfield.dart';

import '../../widget/call_snackbar.dart';

class ApplyOtherApps extends StatefulWidget {
  const ApplyOtherApps({super.key});

  @override
  State<ApplyOtherApps> createState() => _ApplyOtherAppsState();
}

class _ApplyOtherAppsState extends State<ApplyOtherApps> {

  final TextEditingController _subjectController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _wardController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        title: const Text('Application Form'),
        centerTitle: true,
      ),
      body:SafeArea(
        child:SingleChildScrollView(
          child: Column(
            children: [
              callTextField(labelname: 'Name of application', inputcontroller: _subjectController, max: 1),
              callTextField(labelname: 'Name of applicant', inputcontroller: _nameController, max: 1),
              callTextField(labelname: 'ward', inputcontroller: _wardController, max: 1),
              callTextField(labelname: 'Address', inputcontroller: _addressController, max: 5),
              callTextField(labelname: 'Description', inputcontroller: _descriptionController, max: 50),
              ElevatedButton(
                onPressed: (){
                // _saveCertificate();
                final apps = Applications(subject: _subjectController.text, name: _nameController.text, ward: _wardController.text, description: _descriptionController.text, address: _addressController.text);
                onSubmitApps(apps);
                callSnackBar(msg: 'Submitted successfully', ctx: context);
                Navigator.of(context).pop();
              },  
                child:const Text('Submit') ,
                ),
                const SizedBox(
                  height: 30,
                )
            ],
          ),
        ) ,
      ) ,
    );
  }
}