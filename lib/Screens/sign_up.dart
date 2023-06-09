import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

import '../db/db_models/user_model.dart';
import '../db/functions/db_functions.dart';
import '../widget/call_snackbar.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
 

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
   final _confirmpasswordController = TextEditingController();
   
    //  get username => null;

    late Box box1;

    @override
  void initState() {
    // TODO: implement initState
    super.initState();
     Hive.openBox('users');
    createBox();
  }

 void createBox() async{
    box1 = await Hive.openBox<User>('users');
  }
  
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child:Center(
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              boxShadow: [BoxShadow(
                blurRadius: 5.0,
              ),
              ],
            ),
            height: 450,
            width: 300,
            // color:  const Color.fromARGB(255, 238, 238, 237),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text('SIGNUP',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold
                    ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: TextFormField(
                      controller: _emailController,
                      decoration:  InputDecoration(
                        labelText: 'abc@gmail.com',
                        // border: InputBorder.none
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15)
                        ),
                        // hintText: 'Username....'
                       ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: TextFormField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                       labelText: 'Password', 
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: const BorderSide(width: 3.0)
                        ),
                        // hintText: 'Password....'
                       ),
                    ),
                  ),

                   Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: TextFormField(
                      controller: _confirmpasswordController,
                      obscureText: true,
                      decoration: InputDecoration(
                       labelText: 'Confirm Password',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: const BorderSide(width: 3.0)
                        ),
                        // hintText: 'Password....'
                       ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: ElevatedButton(
                      onPressed: (){
                        signUpAction();
                      }, 
                    child: const Text('SIGNUP'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
        ),
    );
   
  }

  Future<void> signUpAction() async{
    final _email = _emailController.text.trim();
    final _password = _passwordController.text.trim();
    final _confirmpassword=_confirmpasswordController.text.trim();
    if (_email.isEmpty || _password.isEmpty || _confirmpassword.isEmpty) {
      showSnackBar();
    } else if (_password != _confirmpassword) {
    callSnackBar(msg: 'Enter same password to continue', ctx: context);
  } else if (!isStrongPassword(_password)) {
    callSnackBar(msg: 'Password is not strong enough', ctx: context);
  } else {
    signUp(_email, _password, _confirmpassword, context);
  }
  }

  showSnackBar() {
    var _errMsg = "";

    if (
        _emailController.text.isEmpty &&
        _passwordController.text.isEmpty &&
         _passwordController.text.isEmpty 
         ) {
      _errMsg = "Please Insert Valid Data In All Fields ";
    }
     else if (_emailController.text.isEmpty) {
      _errMsg = "email  Must Be Filled";
    } else if (_passwordController.text.isEmpty) {
      _errMsg = "password  Must Be Filled";
    } else if (_confirmpasswordController.text.isEmpty) {
      _errMsg = "Confirm password Must Be Filled"; 
    }
    // else if(_passwordController.text != _confirmpasswordController.text){
    //   _errMsg = 'Password and confirm password must be same';
    // }
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.red,
        margin: const EdgeInsets.all(10.0),
        content: Text(_errMsg),
      ),
    );
}

passwordMatch(){
  if (_passwordController.text != _confirmpasswordController.text) {
    callSnackBar(msg: 'Enter same password to continue', ctx: context);
  }
  else{
 signUp(_emailController.text, _passwordController.text,_confirmpasswordController.text,context);
  }
}

bool isStrongPassword(String password) {
  // Define criteria for a strong password
  final RegExp hasLowercase = RegExp(r'[a-z]');
  final RegExp hasUppercase = RegExp(r'[A-Z]');
  final RegExp hasDigits = RegExp(r'\d');
  final RegExp hasPunctuations = RegExp(r'[!@#$%^&*(),.?":{}|<>]');

  // Check if the password meets the criteria
  final bool hasMinLength = password.length >= 8;
  final bool hasLower = hasLowercase.hasMatch(password);
  final bool hasUpper = hasUppercase.hasMatch(password);
  final bool hasDigit = hasDigits.hasMatch(password);
  final bool hasPunctuation = hasPunctuations.hasMatch(password);

  return hasMinLength &&
      hasLower &&
      hasUpper &&
      hasDigit &&
      hasPunctuation;
}

}