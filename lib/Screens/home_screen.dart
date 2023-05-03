import 'package:flutter/material.dart';
import 'package:main/Screens/login.dart';
import 'package:main/Screens/user/applybirthcer.dart';
import 'package:main/Screens/user/commom_applications.dart';
import 'package:main/Screens/user/complaint.dart';
import 'package:main/Screens/user/deathcertificate.dart';
import 'package:main/Screens/user/events_view.dart';

class UserHome extends StatefulWidget {
  const UserHome({super.key});

  @override
  State<UserHome> createState() => _UserHomeState();
}

class _UserHomeState extends State<UserHome> {

  int index1 = 0;
  
  List heading = ['File complaints','View Events','Apply Birth Certificate','Apply death certificate','Other Applications'];
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      // resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading:  IconButton(
          onPressed: (){

          }, 
          icon: const Icon(Icons.menu),
          ),
            title: const Text('Home'),
            centerTitle: true,
            actions:  [
             IconButton(
              onPressed: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (ctx) =>const LoginScreen()));
              }, 
              icon:const Icon(Icons.logout) ,
              )
            ],
      ),
      body: CustomScrollView(
        slivers: [
          // SliverToBoxAdapter(
          //   child: Container(
          //     padding: const EdgeInsets.only(
          //       top: 15,
          //       right: 15,
          //       left: 15,
          //     ),
          //     child: TextFormField(
          //       decoration: InputDecoration(
          //         border: OutlineInputBorder(
          //           borderRadius: BorderRadius.circular(15)
          //         ),
          //         hintText: 'Search Recipes.....',
          //         suffixIcon: const Icon(Icons.format_list_bulleted_rounded)
          //       ),
          //     ),
          //   ),
          // ),
  
         SliverPadding(
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 20
          ),
           sliver: SliverGrid(
            delegate: SliverChildBuilderDelegate((context, index){
              return Container(
                decoration:  BoxDecoration(
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(
                      color: Color.fromARGB(255, 185, 185, 255),
                      offset: Offset(1, 1),
                      blurRadius: 7,
                    )
                  ],
                  borderRadius: BorderRadius.circular(20)
                ),
                child: InkWell(
                  onTap: () {
                    if (index == 0) {
                       Navigator.of(context).push(MaterialPageRoute(builder: (ctx) =>  ComplaintForm()));
                    }else if(index == 1){
                       Navigator.of(context).push(MaterialPageRoute(builder: (ctx) =>  const EventsUser()));
                    }
                    else if(index == 2){
                       Navigator.of(context).push(MaterialPageRoute(builder: (ctx) =>  const BirthCertificateForm()));
                    }else if(index == 3){
                       Navigator.of(context).push(MaterialPageRoute(builder: (ctx) =>  const DeathCertificateApply()));
                    }else if(index == 4){
                       Navigator.of(context).push(MaterialPageRoute(builder: (ctx) =>  const ApplyOtherApps()));
                    }
                    
                  },
                  child: CircleAvatar(
                   backgroundColor: Colors.transparent,
                   child: Padding(
                    padding: const EdgeInsets.only(
                      left: 20,
                      right: 20,
                    ),
                     child: Text(
                      heading[index],
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 18
                      ),
                      ),
                   ),
                  //  child: Image.asset('assets/images/$index.png'),
                  ),
                ),
              );
            },
            childCount: heading.length,
            ), 
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisExtent: 270,
              crossAxisSpacing: 15,
              mainAxisSpacing: 15,
              ),
            ),
         ), 
        ],
      ),
    );
  }
}