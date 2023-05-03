import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:main/db/functions/compaint_functions.dart';
import 'package:main/widget/call_textformfield.dart';

import '../../db/db_models/complaint.dart';

class ComplaintForm extends StatefulWidget {
  @override
  _ComplaintFormState createState() => _ComplaintFormState();
}

class _ComplaintFormState extends State<ComplaintForm> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Hive.openBox<Complaint>('complaint');
  }

  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _addressController = TextEditingController();
  final _commentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[100],
      appBar: AppBar(
        title: const Text('Complaint Form'),
        centerTitle: true,
        ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              callTextField(labelname: 'name', inputcontroller: _nameController, max: 1),
              callTextField(labelname: 'email', inputcontroller: _emailController, max: 1),
              callTextField(labelname: 'Phone number', inputcontroller: _phoneController, max: 1),
              callTextField(labelname: 'Address', inputcontroller: _addressController, max: 3),
              callTextField(labelname: 'Comment', inputcontroller: _commentController, max: 50),
              ElevatedButton(
                onPressed: () {
                final complaint = Complaint(_nameController.text, _emailController.text, _phoneController.text, _addressController.text, _commentController.text);
                onSubmit(complaint);
              },
                child: const Text('Submit')
                ),
          ],
        ),
        ),
      ),
    );
  }
}






