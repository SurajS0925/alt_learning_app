import 'package:alt_learning_app/display.dart';
import 'package:animate_do/animate_do.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
class MainScreen extends StatefulWidget {
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final Duration duration = const Duration(milliseconds: 800);
  final referencedata=FirebaseDatabase.instance;
  final tempCont = TextEditingController();
  final MoisCont = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final UId = referencedata.databaseURL;
    final ref = referencedata.ref("users/$UId");
    final email = FirebaseAuth.instance.currentUser?.email!;
    return Scaffold(
      appBar: AppBar(
        title: Text('Testing'),
      ),
      body: Column(
        children: [
          Center(
            child: Container(
              child: Column(
                children:[
                  Text('Enter Temperature',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
                  TextField(
                    controller: tempCont,
                    textAlign: TextAlign.center,
                  ),

                  Text('Enter Moisture-level',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
                  TextField(
                    controller: MoisCont,
                    textAlign: TextAlign.center,
                  ),
                  OutlinedButton(
                      onPressed: () {ref.set({'email': email, 'temp' : tempCont.text,
                    'moisture':MoisCont.text});
                    tempCont.clear();
                    MoisCont.clear();
                  },
                      child:Text('Save Info')),
                  SizedBox(
                    height: 20,
                  ),
                  FadeInUp(
                      duration: duration,
                      delay: Duration(milliseconds: 1000),
                      child: OutlinedButton(onPressed: () =>
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) {
                          return display();
                        })),child: Text('Click here to Display')))
                ],
              ),
            ),
          )

        ],
      ),
    );
  }
}