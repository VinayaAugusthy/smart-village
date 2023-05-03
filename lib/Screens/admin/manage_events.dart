import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:main/Screens/admin/add_event.dart';
import 'package:main/Screens/admin/admin_home.dart';
import 'package:main/Screens/admin/event_details.dart';
import 'package:main/Screens/admin/update_events.dart';
import 'package:main/db/db_models/events.dart';
import 'package:main/db/functions/event_functions.dart';

class ManageEvents extends StatefulWidget {
  const ManageEvents({super.key});

  @override
  State<ManageEvents> createState() => _ManageEventsState();
}

class _ManageEventsState extends State<ManageEvents> {

  late Box<Events> eventBox;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    eventBox = Hive.box('events');
    getAllEvents();
  }
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Manage Events'),
        centerTitle: true,
        leading: IconButton(
          onPressed:(){
            Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => AdminDesk()),(Route<dynamic> route) => false,);
          }, 
          icon:Icon(Icons.arrow_back)),
        actions: [
          IconButton(
            onPressed:(){
              // Navigator.of(context).push(MaterialPageRoute(builder: (context) =>const SearchStudent()));
            } , 
            icon:const Icon(Icons.search)
            ),
        ],
       ),
     body: SafeArea(
        child: ValueListenableBuilder(    
          valueListenable: eventListNotifier,
           builder: (BuildContext ctx, List<Events> eventList, Widget? child){
             return ListView.separated(
            itemBuilder:(ctx,index){
              final data = eventList[index];
              return ListTile(
                // leading: CircleAvatar(
                //   radius: 25,
                //  // backgroundColor: Colors.green,
                //   backgroundImage:FileImage(File(data.image)) ,
                // ),
                title: Text(data.eventName),
                trailing:Wrap(
                  spacing:12,
                  children:<Widget> [
                    
                   IconButton(
                    onPressed: (){
                     Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => UpdateEvents(index: index),
                                ),
                     );
                    },
                    icon:const Icon(Icons.edit), 
                    color: Colors.blue),
                      IconButton(
                    onPressed: (){
                        
                         deleteAlert(context,index);
                    },
                    icon:const Icon(Icons.delete), 
                    color: Colors.red,
                    ),
                  
                  ],
                ),  
                onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (ctx) => Details(
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
          itemCount: eventList.length,
          );
          },
        ),
      ),
       floatingActionButton: FloatingActionButton(onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) =>  AddEvents()));
       },
       child: const Icon(Icons.add),
       ),
    );
  }

  deleteAlert(BuildContext context, key){
    showDialog(context: context, builder: (ctx) => AlertDialog(
      content: const Text('Delete data Permanently?'),
      actions: [
        TextButton(onPressed: () {
          deleteEvent(key);
          Navigator.of(context).pop(ctx);
        }, child: const Text('Delete',style: TextStyle(color: Colors.red),)),
        TextButton(onPressed: () {
          Navigator.of(context).pop(ctx);
        }, child: const Text('Cancel'))
      ],

    ),);
  }
}