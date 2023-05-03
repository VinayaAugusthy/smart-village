import 'package:flutter/material.dart';
import 'package:main/db/db_models/events.dart';

class Details extends StatelessWidget {
   Details({super.key,required this.passValue,required this.passId});
  
   Events passValue;
   final int passId;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text(passValue.eventName),
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
                Text(
                  passValue.eventName,
                  style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                  ),
                  szdBox(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Date :${passValue.date}',
                        style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      ),
                       szdBox(),
                   Text(
                    'Time :${passValue.time}',
                     style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  ),
                  szdBox(),
                   Text(
                    'Venue :${passValue.venue}',
                     style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  ),
                  szdBox(),
                   Text(
                    'About :\n\n ${passValue.description}',
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