
import 'package:flutter/material.dart';
import 'package:main/Screens/admin/admin_home.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../db/functions/db_functions.dart';
import '../../widget/call_snackbar.dart';

class AdminLog extends StatefulWidget {
  const AdminLog({super.key});

  @override
  State<AdminLog> createState() => _AdminLogState();
}

class _AdminLogState extends State<AdminLog> {

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: SafeArea(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Container(
            decoration: const BoxDecoration(
                  color: Colors.white,
                  boxShadow: [BoxShadow(
                    blurRadius: 5.0,
                  ),
                  ],
                ),
            width: 300,
            height: 350,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      'ADMIN LOGIN',
                      style:TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold
                      ) ,
                      ),
                  ),
                  
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: TextFormField(
                      controller: emailController,
                      decoration: InputDecoration(
                        labelText: 'email',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          
                        )
                      ),
                    ),
                  ),
            
                   Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: TextFormField(
                      controller: passwordController,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15)
                        )
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: (){
                      checkLogin(context);
                    }, 
                    child: const Text('SIGNIN'),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
      )
    );
  }

  void checkLogin(BuildContext ctx) async{
    final email = emailController.text;
    final password = passwordController.text;
    if ((email == 'admin@gmail.com') && ( password == 'admin')) {
      final sharedPrefs = await SharedPreferences.getInstance();
      await sharedPrefs.setBool(SAVE_KEY_NAME, true);
      // ignore: use_build_context_synchronously
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx) => const AdminDesk()));
    } else {
      emailController.text ='';
      passwordController.text='';
      callSnackBar(msg: 'Username password doesnot match', ctx: ctx);
    }
  }
}