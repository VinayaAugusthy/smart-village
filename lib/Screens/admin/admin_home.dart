import 'package:flutter/material.dart';
import 'package:main/Screens/admin/manage_events.dart';
import 'package:main/Screens/admin/view_applications.dart';
import 'package:main/Screens/admin/view_complaints.dart';
import 'package:main/Screens/login.dart';

class AdminDesk extends StatefulWidget {
  const AdminDesk({super.key});

  @override
  State<AdminDesk> createState() => _AdminDeskState();
}

class _AdminDeskState extends State<AdminDesk> {
  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      backgroundColor: const Color.fromARGB(255, 208, 218, 213),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:  [
              const ClipRRect(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(25),
                  bottomRight: Radius.circular(25),
                ),
                child: Image(
                  image:AssetImage('assets/images/admin.jpg'),
                  ),
              ),
              const SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 30,
                ),
                child: ListTile(
                  title: const Text('Manage Events',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold
                  ),
                  ),
                  onTap: () {
                     Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx) => const ManageEvents()));
                  },
                ),
              ),
                 Padding(
                padding: const EdgeInsets.only(
                  left: 30
                ),
                child: ListTile(
                  title: const Text('View Complaints',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold
                  ),
                  ),
                  onTap: () {
                     Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => const ViewComplaints()));
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 30
                ),
                child: ListTile(
                  title: const Text('View Applications',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold
                  ),
                  ),
                  onTap: () {
                     Navigator.of(context).push(MaterialPageRoute(builder: (ctx) =>  const ApplicationView()));
                  },
                ),
              ),
                Padding(
                padding: const EdgeInsets.only(
                  left: 30
                ),
                child: ListTile(
                  title: const Text('Logout',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold
                  ),
                  ),
                  onTap: () {
                   Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx) => const LoginScreen()));
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}