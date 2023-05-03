import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:main/db/db_models/birth_certificate.dart';

// ignore: must_be_immutable
class BcDetails extends StatelessWidget {
   BcDetails({super.key,required this.passId,required this.passValue});

BirthCertificate passValue;
final int passId;

late Box bcBox;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text('Details'),
        centerTitle: true,
      ),
      body: SafeArea(
        child:Padding(
          padding: const EdgeInsets.only(
            top: 150,
            left: 15,
            right: 15,
          ),
          child: Container(
            color: Colors.amber[50],
            height: 400,
            width: 400,
            child: Column(
              children:  [
                const Padding(
                  padding: EdgeInsets.only(
                    top: 15
                  ),
                  child: Text(
                    'BIRTH CERTIFICATE',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black
                    ),
                    ),
                ),
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  'All the details mentioned below are true and certified.',
                  style: TextStyle(
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
                          'Name of child : ${passValue.cname}',
                            style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        szdBox(),
                        Text(
                      'DOB : ${passValue.dob}',
                      style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                  ),
                ),
                 szdBox(),
                Text(
                      'Sex : ${passValue.sex}',
                      style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                  ),
                ),
                 szdBox(),
                Text(
                      'Name of father : ${passValue.fname}',
                      style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                  ),
                ),
                 szdBox(),
                Text(
                      'Name of mother : ${passValue.mname}',
                      style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                  ),
                ),
                 szdBox(),
                Text(
                      'Place of birth : ${passValue.place}',
                      style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                  ),
                ),
                 szdBox(),
                Text(
                      'Address : ${passValue.address}',
                      style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                  ),
                ),
                 szdBox(),
                ],
               ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  szdBox(){
    return const SizedBox(
      height: 10,
    );
  }
}