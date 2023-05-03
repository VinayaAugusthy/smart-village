import 'package:flutter/material.dart';
import 'package:main/Screens/admin/application_list.dart';
import 'package:main/Screens/admin/bcertificate.dart';
import 'package:main/Screens/admin/dcertificate_view.dart';

class ApplicationView extends StatefulWidget {
  const ApplicationView({super.key});

  @override
  State<ApplicationView> createState() => _ApplicationViewState();
}

class _ApplicationViewState extends State<ApplicationView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Applications'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 70,
            left: 80,
          ),
          child: Column(
            children: [
              const SizedBox(
                height: 100,
              ),
              TextButton(
                onPressed: (){
                   Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx) => const ListApplications()));
                }, 
                child: const Text(
                  'Common Applications',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextButton(
                  onPressed: (){
                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx) => const ViewbCertificate()));
                  }, 
                  child:const Text(
                    'Birth Certificates',
                     style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black
                      ),
                    ) ,
                  ),
                  const SizedBox(
                  height: 20,
                ),
                TextButton(
                  onPressed: (){
                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx) => const DCertificateView()));
                  }, 
                  child:const Text(
                    'Death Certificates',
                     style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black
                  ),
                ) ,
              ),
            ],
          ),
        )
      ),
    );
  }
}