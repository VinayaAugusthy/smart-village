import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:main/db/db_models/death_certificate.dart';

class DCertificateDetails extends StatelessWidget {
   DCertificateDetails({super.key,required this.passValue,required this.passId});

  DeathCertificate passValue;
  final int passId;

  late Box dcBox;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
       appBar: AppBar(
        title: const Text('Details'),
        centerTitle: true,
      ),
      body:  SafeArea(
        child:Container(
          height: 700,
          width: 400,
          color: Colors.amber[50],
          child: Column(
            children: [
             const SizedBox(
                height: 100,
              ),
              const Text(
                'DEATH CERTIFICATE',
                style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black
                    ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                     Text(
                          'Name of diceased : ${passValue.name}',
                            style: const TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        szdBox(),
                         Text(
                          'Date of death : ${passValue.date}',
                            style: const TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        szdBox(),
                         Text(
                          'Age : ${passValue.age}',
                            style: const TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        szdBox(),
                         Text(
                          'Sex : ${passValue.sex}',
                            style: const TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        szdBox(),
                         Text(
                          'Address : ${passValue.address}',
                            style: const TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        szdBox(),
                         Text(
                          'Religion : ${passValue.religion}',
                            style: const TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        szdBox(),
                         Text(
                          'Place of death : ${passValue.place}',
                            style: const TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        szdBox(),
                         Text(
                          'Name of father : ${passValue.fname}',
                            style: const TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        szdBox(),
                        Text(
                          'Name of mother : ${passValue.mname}',
                            style: const TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        szdBox(), 
                  ],
                )
            ],
          ),
        ) ,
        ),
    );
  }
   szdBox(){
    return const SizedBox(
      height: 10,
    );
  }
}