import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:main/Screens/admin/manage_events.dart';
import 'package:main/db/db_models/events.dart';
import 'package:main/db/functions/event_functions.dart';


class UpdateEvents extends StatefulWidget {
  final int index;
  const UpdateEvents({required this.index,super.key});

  @override
  State<UpdateEvents> createState() => _UpdateEventsState();
}

class _UpdateEventsState extends State<UpdateEvents> {

  late TextEditingController _idController;
  late TextEditingController _nameController;
  late TextEditingController _dateController;
  late TextEditingController _timeController;
  late TextEditingController _venueController;
  late TextEditingController _descriptionController;

  int id = 0;
  String? name;
  String? date;
  String? time;
  String? venue;
  String? description;

  late Box<Events> eventBox;
  late Events event;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    eventBox = Hive.box('events');

    _idController = TextEditingController();
    _nameController = TextEditingController();
    _dateController = TextEditingController();
    _timeController = TextEditingController();
    _venueController = TextEditingController();
    _descriptionController = TextEditingController();

    event = eventBox.getAt(widget.index) as Events;

    _idController.text = event.id.toString();
    _nameController.text = event.eventName.toString();
    _dateController.text = event.date.toString();
    _timeController.text = event.time.toString();
    _venueController.text = event.time.toString();
    _descriptionController.text = event.description.toString();

  }

  Future<void> eventAddBtn(int index) async{
    final name = _nameController.text.trim();
    final date = _dateController.text.trim();
    final time = _timeController.text.trim();
    final venue = _venueController.text.trim();
    final description = _descriptionController.text.trim();

    if (name.isEmpty || date.isEmpty || time.isEmpty || venue.isEmpty || description.isEmpty) {
      return;
    }

    final event = Events(eventName: name, date: date, time: time, venue: venue, description: description);

    final eventDB = await Hive.openBox<Events>('events');
    eventDB.putAt(index, event);
    getAllEvents();
  }
   Widget textFieldName({
    required TextEditingController myController,
    required String hintName,
  }) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: TextFormField(
        // initialValue: widget.passValueProfile.name,
        autofocus: false,
        controller: myController,
        cursorColor: Colors.black,
        style: const TextStyle(color: Colors.black),
        decoration: InputDecoration(
          filled: true,
          fillColor: const Color.fromRGBO(234, 236, 238, 2),
          border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(50)),
          hintText: hintName,
        ),
      // initialValue: 'hintName',
      ),
    );
  }
  Widget elavatedbtn() {
    return ElevatedButton.icon(
      onPressed: () {
        eventAddBtn(widget.index);

        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (ctx) => const ManageEvents()),
            (route) => false);
      },
      icon: const Icon(Icons.update_rounded),
      label: const Text('Update'),
    );
  }
  Widget szdBox = const SizedBox(height: 20);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
       appBar: AppBar(
        title: const Text('UPDATE'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(children: <Widget>[
            szdBox,
            textFieldName(myController: _nameController, hintName: event.eventName),
            textFieldName(myController: _dateController, hintName: event.date),
            textFieldName(myController: _timeController, hintName: event.time),
            textFieldName(myController: _venueController, hintName: event.venue),
            textFieldName(myController: _descriptionController, hintName: event.description),
            elavatedbtn(),
          ],),
        ),
      ),
    );
  }
}