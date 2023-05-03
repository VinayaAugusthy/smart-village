import 'package:flutter/material.dart';
import 'package:main/db/db_models/death_certificate.dart';
import 'package:main/db/functions/dcertificate.dart';
import 'package:main/widget/call_snackbar.dart';
import 'package:main/widget/call_textformfield.dart';

class DeathCertificateApply extends StatefulWidget {
  const DeathCertificateApply({super.key});

  @override
  State<DeathCertificateApply> createState() => _DeathCertificateApplyState();
}

class _DeathCertificateApplyState extends State<DeathCertificateApply> {
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _fnameController = TextEditingController();
  final TextEditingController _mnameController = TextEditingController();
  final TextEditingController _sexController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _placeController = TextEditingController();
  final TextEditingController _religionController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.amber[100],
      appBar: AppBar(
        title: const Text('Death Certificate Applilcation'),
        centerTitle: true,
      ),
      body: SafeArea(
        child:SingleChildScrollView(
          child: Column(
            children: [
              callTextField(labelname: 'Date of death', inputcontroller: _dateController, max: 1),
              callTextField(labelname: 'Name of diceased', inputcontroller: _nameController, max: 1),
              callTextField(labelname: 'Address', inputcontroller: _addressController, max: 5),
              callTextField(labelname: 'Sex', inputcontroller: _sexController, max: 1),
              callTextField(labelname: 'Age', inputcontroller: _ageController, max: 1),
              callTextField(labelname: 'Place', inputcontroller: _placeController, max: 1),
              callTextField(labelname: 'Religion', inputcontroller: _religionController, max: 1),
              callTextField(labelname: 'Name of father', inputcontroller: _fnameController, max: 1),
              callTextField(labelname: 'Name of mother', inputcontroller: _mnameController, max: 1),
              ElevatedButton(
                onPressed: (){
                   final certificated = DeathCertificate(date: _dateController.text, name: _nameController.text, address: _addressController.text, sex: _sexController.text, age: _ageController.text, place: _placeController.text, religion: _religionController.text, fname: _fnameController.text, mname: _mnameController.text);
                    onSubmit(certificated);
                  callSnackBar(msg: 'Submitted successfully', ctx: context);
                   Navigator.of(context).pop();
                }, 
                child: const Text('Submit'),
                ),
            ],
          ),
        ) ,
        ),
    );
  }
}