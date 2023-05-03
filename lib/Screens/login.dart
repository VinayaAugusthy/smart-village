import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:main/Screens/admin/admin_login.dart';
import 'package:main/Screens/home_screen.dart';
import 'package:main/Screens/sign_up.dart';


import '../db/db_models/user_model.dart';
import '../db/functions/db_functions.dart';
import '../widget/call_snackbar.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

   final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Hive.openBox<User>('users');
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child:Padding(
          padding: const EdgeInsets.fromLTRB(50, 100, 50, 0),
          child: ListView(
            children: 
              [Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  boxShadow: [BoxShadow(
                    blurRadius: 10.0,
                  ),
                  ],
                ),
                height: 500,
                width: 250,
                // color:  const Color.fromARGB(255, 238, 238, 237),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Text('SIGNIN',
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
                            labelText: 'email',
                            // border: InputBorder.none
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15)
                            ),
                             hintText: 'abc@gmail.com'
                           ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: TextFormField(
                          controller: _passwordController,
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
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                          onPressed: (){
                            if (_emailController.text.isNotEmpty && _passwordController.text.isNotEmpty) {
                             login(_emailController.text.trim(), _passwordController.text.trim(),context);
                             Navigator.of(context).push(MaterialPageRoute(builder: (ctx) =>const UserHome()));                    
                            }else{
                              callSnackBar(msg: 'Fill all fields', ctx: context);
                            }
                          }, 
                        child: const Text('SIGNIN'),
                        ),
                      ),
              
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          child: RichText(
                            text:const TextSpan(
                               children: [
                                TextSpan(
                                  text: 'Login ',
                                  style: TextStyle(
                                    color: Colors.black,
                                  ),
                                ),
                                TextSpan(
                                  text: 'as ',
                                  style: TextStyle(
                                    color: Colors.black,
                                  ),
                                ),
                                TextSpan(
                                  text: 'admin',
                                  style: TextStyle(color: Colors.red)
                                )
                               ]
                              )
                            ),
                          onTap: () {
                            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const AdminLog()));
                          },
                          ),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('Do not have an account?',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                        ),
                        ),
                      ),
              
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                          onPressed: (){
                            Navigator.of(context).push(MaterialPageRoute(builder: (ctx) =>const SignUp()));
                          }, 
                        child: const Text('SIGNUP'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        )
        ),
    );
  }
 
}