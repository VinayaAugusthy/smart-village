import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:main/Screens/admin/deathcertificate_details.dart';
import 'package:main/db/db_models/death_certificate.dart';
import 'package:main/db/functions/dcertificate.dart';

class DCertificateView extends StatefulWidget {
  const DCertificateView({super.key});

  @override
  State<DCertificateView> createState() => _DCertificateViewState();
}

class _DCertificateViewState extends State<DCertificateView> {
  late Box<DeathCertificate> dcBox;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
     Hive.openBox<DeathCertificate>('dcertificate');
     getAllDC();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
       appBar: AppBar(
        title: const Text(
          'Death Certificate',
          ),
          centerTitle: true,
      ),
      body: SafeArea(
        child: ValueListenableBuilder(
          valueListenable: dcertificateListNotifier, 
          builder: (BuildContext ctx,List<DeathCertificate> dList, Widget? child){
            return ListView.separated(
              itemBuilder: (context,index){
                final data = dList[index];
                return ListTile(
                  title: Text(data.name),
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
                          builder: (ctx) => DCertificateDetails(
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
               itemCount: dList.length,
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
          deleteDc(key);
          Navigator.of(context).pop(ctx);
        }, child: const Text('Delete',style: TextStyle(color: Colors.red),)),
        TextButton(onPressed: () {
          Navigator.of(context).pop(ctx);
        }, child: const Text('Cancel'))
        ],
      ),
    );
  }
}