import 'package:flutter/material.dart';
import 'package:main/Screens/admin/event_details.dart';
import 'package:main/db/db_models/events.dart';
import 'package:main/db/functions/event_functions.dart';

class EventsUser extends StatefulWidget {
  const EventsUser({super.key});

  @override
  State<EventsUser> createState() => _EventsUserState();
}

class _EventsUserState extends State<EventsUser> {

  // late Box eventBox;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAllEvents();
    // eventBox = Hive.openBox('events');
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.red[100],
      appBar: AppBar(
        title: const Text('Events'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: ValueListenableBuilder(
          valueListenable: eventListNotifier, 
        builder: (BuildContext ctx, List<Events> eventList, Widget? child){
          return ListView.separated(
            itemBuilder: (ctx,index){
              final data = eventList[index];
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  title: Text(data.eventName),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(data.date),
                      Text(data.time),
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
                ),
              );
            }, 
            separatorBuilder:(context,index){
              return const Divider();
            } , 
            itemCount: eventList.length,
            );
        },
      ),
      ),
    );
  }
}