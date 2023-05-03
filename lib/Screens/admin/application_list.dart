import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:main/Screens/admin/app_details.dart';
import 'package:main/db/db_models/applications.dart';
import 'package:main/db/functions/application_functions.dart';

class ListApplications extends StatefulWidget {
  const ListApplications({super.key});

  @override
  State<ListApplications> createState() => _ListApplicationsState();
}

class _ListApplicationsState extends State<ListApplications> {
  late Box<Applications> appBox;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
     Hive.openBox<Applications>('applications');
     getAllApps();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
       appBar: AppBar(
        title: const Text(
          'Applications',
          ),
          centerTitle: true,
      ),
      body: SafeArea(
        child: ValueListenableBuilder(
          valueListenable: appListNotifier, 
          builder: (BuildContext ctx,List<Applications> appList, Widget? child){
            return ListView.separated(
              itemBuilder: (context,index){
                final data = appList[index];
                return ListTile(
                  title: Text(data.subject),
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
                          builder: (ctx) => AppDetails(
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
               itemCount: appList.length,
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
          deleteApps(key);
          Navigator.of(context).pop(ctx);
        }, child: const Text('Delete',style: TextStyle(color: Colors.red),)),
        TextButton(onPressed: () {
          Navigator.of(context).pop(ctx);
        }, child: const Text('Cancel'))
      ],

    ),);
  }
}