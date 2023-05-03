import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:main/Screens/admin/complaint_details.dart';
import 'package:main/db/db_models/complaint.dart';
import 'package:main/db/functions/compaint_functions.dart';

class ViewComplaints extends StatefulWidget {
  const ViewComplaints({super.key});

  @override
  State<ViewComplaints> createState() => _ViewComplaintsState();
}

class _ViewComplaintsState extends State<ViewComplaints> {

  late Box<Complaint> complaintBox;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    complaintBox = Hive.box('complaint');
  }

  @override
  Widget build(BuildContext context) {
    getAllComplaints();
    return  Scaffold(
      appBar: AppBar(
        title: const Text('View Complaints'),
        centerTitle: true,
      ),
      body: SafeArea( 
        child: ValueListenableBuilder(
          valueListenable: complaintListNotifier, 
          builder:(BuildContext ctx, List<Complaint> complaintList, Widget? child){
            return ListView.separated(
              itemBuilder: (ctx,index){
              final data = complaintList[index];
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
                          builder: (ctx) => DetailComplaint(
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
              itemCount: complaintList.length,
              );
          } ,
          ),
        ),
    );
  }

   deleteAlert(BuildContext context, key){
    showDialog(context: context, builder: (ctx) => AlertDialog(
      content: const Text('Delete data Permanently?'),
      actions: [
        TextButton(onPressed: () {
          deleteComplaint(key);
          Navigator.of(context).pop(ctx);
        }, child: const Text('Delete',style: TextStyle(color: Colors.red),)),
        TextButton(onPressed: () {
          Navigator.of(context).pop(ctx);
        }, child: const Text('Cancel'))
      ],

    ),);
  }
}