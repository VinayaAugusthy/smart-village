import 'package:flutter/material.dart';
import 'package:main/db/db_models/events.dart';
import 'package:main/db/functions/event_functions.dart';
import 'package:main/widget/call_textformfield.dart';

class AddEvents extends StatefulWidget {
  const AddEvents({super.key});

  @override
  State<AddEvents> createState() => _AddEventsState();
}

class _AddEventsState extends State<AddEvents> {

  final _eventNameController = TextEditingController();
  final _dateController = TextEditingController();
  final _timeController = TextEditingController();
  final _venueController = TextEditingController();
  final _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
       appBar: AppBar(
        title: const Text('Add Events'),
      ),
        body:SafeArea(
          child: SingleChildScrollView(
            child: Column(
              
              children: [
                 const SizedBox(
                  height: 50,
                ),
            callTextField(labelname: 'Event name', inputcontroller: _eventNameController, max: 1),
            callTextField(labelname: 'Date', inputcontroller: _dateController, max: 1),
            callTextField(labelname: 'Time', inputcontroller: _timeController, max: 1),
            callTextField(labelname: 'Venue', inputcontroller: _venueController, max: 1),
            callTextField(labelname: 'Description', inputcontroller: _descriptionController, max: 10),
                ElevatedButton.icon(onPressed: (){
                  addEventOnButtonClicked();
                }, 
                icon:const Icon(Icons.check),
                 label: const Text('Add'))
              ],
            ),
          ),
        )  
    );
  }

  Future<void> addEventOnButtonClicked() async{

  final name = _eventNameController.text.trim();
   final date = _dateController.text.trim();
  final time = _timeController.text.trim();
  final venue = _venueController.text.trim();
   final description = _descriptionController.text.trim();


if (name.isEmpty || date.isEmpty || time.isEmpty || venue.isEmpty || description.isEmpty ) {
   showSnackBar();
}
//print('$_name $_age');
else{
final event = Events(eventName: name, date: date, time: time, venue: venue, description: description);
addEvents(event);
Navigator.of(context).pop();
eventAddSnackBar();
}
}

  showSnackBar() {
    var _errMsg = "";

    if (
        _eventNameController.text.isEmpty &&
        _dateController.text.isEmpty &&
        _timeController.text.isEmpty &&
        _venueController.text.isEmpty &&
        _descriptionController.text.isEmpty
        ) {
      _errMsg = "Please Insert Valid Data In All Fields ";
    }else if (_eventNameController.text.isEmpty) {
      _errMsg = "Name  Must Be Filled";
    } else if (_dateController.text.isEmpty) {
      _errMsg = "date  Must Be Filled";
    } else if (_timeController.text.isEmpty) {
      _errMsg = "Time  Must Be Filled";
    }else if (_venueController.text.isEmpty) {
      _errMsg = "Venue Must Be Filled";
    }else if (_descriptionController.text.isEmpty) {
      _errMsg = "Description Must Be Filled";
    }
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.red,
        margin: const EdgeInsets.all(10.0),
        content: Text(_errMsg),
      ),
    );
  }

  void eventAddSnackBar() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        behavior: SnackBarBehavior.floating,
        backgroundColor: Color.fromRGBO(119, 153, 174, 1),
        content: Text('Event added succesfully!'),
      ),
    );
  
}
}