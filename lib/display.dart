import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

class display extends StatefulWidget {
  @override
  State<display> createState() => _displayState();
}

class _displayState extends State<display> {
  final dbRef = FirebaseDatabase.instance.ref('users');
  final referencedata=FirebaseDatabase.instance;
  DatabaseReference reference = FirebaseDatabase.instance.ref().child('users');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Data from database'),
        ),
        body: Container(
          height: double.infinity,
          
          child: Expanded(
            child: FirebaseAnimatedList(
              query: reference,
              itemBuilder: (context,snapshot,animation,index){
                return ListTile(
                  title: Text(snapshot.value.toString()),
                );
    },
    ),
          )));
  }}