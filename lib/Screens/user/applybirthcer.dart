import 'package:flutter/material.dart';
import 'package:main/db/functions/bcertificate.dart';
import 'package:main/widget/call_snackbar.dart';
import 'package:main/widget/call_textformfield.dart';

import '../../db/db_models/birth_certificate.dart';

class BirthCertificateForm extends StatefulWidget {
  const BirthCertificateForm({super.key});

  @override
  State<BirthCertificateForm> createState() => _BirthCertificateFormState();
}

class _BirthCertificateFormState extends State<BirthCertificateForm> {

 

  final TextEditingController _cnameController = TextEditingController();
  final TextEditingController _sexController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();
  final TextEditingController _fnameController = TextEditingController();
  final TextEditingController _mnameController = TextEditingController();
  final TextEditingController _placeController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _paddressController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.amber[100],
      appBar: AppBar(
        title: Text('Birth Certificate Application'),
        centerTitle: true,
      ),
      body:SingleChildScrollView(
        child: Column(
          children: [
            callTextField(labelname: 'Name of child', inputcontroller: _cnameController, max: 1),
            callTextField(labelname: 'Sex of child', inputcontroller: _sexController, max: 1),
            callTextField(labelname: 'DOB', inputcontroller: _dobController, max: 1),
            callTextField(labelname: 'Fathers Name', inputcontroller: _fnameController, max: 1),
            callTextField(labelname: 'Mothers Name', inputcontroller: _mnameController, max: 1),
            callTextField(labelname: 'Place of birth', inputcontroller: _placeController, max: 1),
            callTextField(labelname: 'Address', inputcontroller: _addressController, max: 5),
            callTextField(labelname: 'Permanent Address', inputcontroller: _paddressController, max: 5),
            ElevatedButton(
              onPressed: (){
                // _saveCertificate();
                final certificateb = BirthCertificate(cname: _cnameController.text, sex: _sexController.text, dob: _dobController.text, fname: _fnameController.text, mname: _mnameController.text, place: _placeController.text, address: _addressController.text, paddress: _paddressController.text);
                onSubmit(certificateb);
                callSnackBar(msg: 'Submitted successfully', ctx: context);
                Navigator.of(context).pop();
              }, 
              child: const Text('SUBMIT'),
            ),
          ],
        ),
      ) ,
    );
  }
}