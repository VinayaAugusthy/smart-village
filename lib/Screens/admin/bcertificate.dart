import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:main/Screens/admin/bc_details.dart';
import 'package:main/db/functions/bcertificate.dart';

import '../../db/db_models/birth_certificate.dart';


class ViewbCertificate extends StatefulWidget {
  const ViewbCertificate({super.key});

  @override
  State<ViewbCertificate> createState() => _ViewbCertificateState();
}

class _ViewbCertificateState extends State<ViewbCertificate> {

  late Box<BirthCertificate> bcBox;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
     Hive.openBox<BirthCertificate>('bcertificate');
     getAllBC();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text(
          'Birth Certificate',
          ),
          centerTitle: true,
      ),
      body: SafeArea(
        child: ValueListenableBuilder(
          valueListenable: bcertificateListNotifier, 
          builder: (BuildContext ctx,List<BirthCertificate> bList, Widget? child){
            return ListView.separated(
              itemBuilder: (context,index){
                final data = bList[index];
                return ListTile(
                  title: Text(data.cname),
                  trailing: IconButton
                (
                  onPressed: (){
                    deleteAlert(context,index);
                }, 
                icon: const Icon(
                  Icons.delete,
                  color: Colors.red,
                  ),
                ),
                onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (ctx) => BcDetails(
                            passId: index,
                            passValue: data,
                          ),
                        ),
                      );
                    },
                );
              },
               separatorBuilder:(context,index){
                return const Divider();
               }, 
               itemCount: bList.length,
            );
          },
        ),
      ),
    );
  }

   deleteAlert(BuildContext context, key){
    showDialog(context: context, builder: (ctx) => AlertDialog(
      content: const Text('Delete data Permanently?'),
      actions: [
        TextButton(onPressed: () {
          deleteBc(key);
          Navigator.of(context).pop(ctx);
        }, child: const Text('Delete',style: TextStyle(color: Colors.red),)),
        TextButton(onPressed: () {
          Navigator.of(context).pop(ctx);
        }, child: const Text('Cancel'))
      ],

    ),);
  }
}