

import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:main/db/db_models/complaint.dart';

class DetailComplaint extends StatelessWidget {
   DetailComplaint({super.key,required this.passValue,required this.passId});

  Complaint passValue;
  final int passId;

  late Box complaintBox;
  

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text('Complaint Details'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Container(
          width: 500,
          color: const Color.fromARGB(255, 192, 170, 177),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 100,
                ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Name of complainer :${passValue.name}',
                        style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      ),
                       szdBox(),
                      Text(
                        'Email :${passValue.email}',
                        style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      ),
                       szdBox(),
                   Text(
                    'Phone :${passValue.phone}',
                     style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  ),
                  szdBox(),
                   Text(
                    'Address :${passValue.address}',
                     style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  ),
                  szdBox(),
                   Text(
                    'Complaint :\n\n ${passValue.comment}',
                     style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  ),
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
      height: 20,
    );
  }
}