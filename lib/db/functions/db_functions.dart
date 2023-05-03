import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:main/Screens/login.dart';
import 'package:main/db/db_models/user_model.dart';

import '../../widget/call_snackbar.dart';
import '../db_models/complaint.dart';

const SAVE_KEY_NAME = 'UserLoggedIn';

void signUp(String email,String password, confirmPassword,BuildContext ctx) async{
  final userBox = await Hive.openBox<User>('users');

  final emails = userBox.values.toList();

  final exisistingUser = emails.where((user) => user.email == email).isNotEmpty;

  

  if (exisistingUser) {
    callSnackBar(msg: 'User already exist', ctx: ctx);
   
  } else {
    successSignup(ctx, email, password);
  }
}

successSignup(ctx,email,password) async{
  final userBox = await Hive.openBox<User>('users');
  callSnackBar(msg: 'User signed up succesfully', ctx:ctx );
     final newUser = User(email: email, password: password);
     await userBox.add(newUser);
    Navigator.of(ctx).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => LoginScreen(),), (route) => false);
}

bool login(String email, String password ,BuildContext ctx) {
  final userBox = Hive.box<User>('users'); 
 
  final user = userBox.values.firstWhere(
    (user) => user.email == email && user.password == password,
    orElse: () => showSnackbar(ctx),
  );
  return true;
}

showSnackbar(ctx) {
   callSnackBar(msg: 'username and password does not match', ctx: ctx);
}

