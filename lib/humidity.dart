import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';

class Humidity extends StatefulWidget {
  const Humidity({super.key});

  @override
  State<Humidity> createState() => _HumidityState();
}

class _HumidityState extends State<Humidity> {
  final referencedata=FirebaseDatabase.instance;
  DatabaseReference reference = FirebaseDatabase.instance.ref('/humidity');
  var humidity;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:
        FirebaseAnimatedList(query: reference,
            itemBuilder: (context,snapshot,animation,index){
              print(snapshot.value);
              return ListTile(
                  title:
                  AnimatedTextKit(
                    totalRepeatCount: 1,
                    isRepeatingAnimation: true,
                    animatedTexts: [
                      WavyAnimatedText('Loading...',
                          textStyle: TextStyle(
                            color: Colors.blue,
                            fontSize: 20,
                          )),
                      TyperAnimatedText('Humidity: ${snapshot.value.toString()}',
                          textStyle: const TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              backgroundColor: Colors.purple)),
                    ],
                    repeatForever: true,
                    onTap: () {
                      print("Tap Event");
                    },
                  ));
            }));






      Scaffold(
      body:
      Container(
        height: MediaQuery.of(context).size.height * 1,
        width: MediaQuery.of(context).size.width * 1,
        // Below is the code for Linear Gradient.
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.purple, Colors.blue],
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 250),
              child: AnimatedTextKit(
                totalRepeatCount: 1,
                isRepeatingAnimation: true,
                animatedTexts: [
                  TyperAnimatedText(
                      'Humidity.....',
                      textStyle: const TextStyle(
                          color: Colors.white,
                          fontSize: 50,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.right,
                      speed: Duration(milliseconds: 100)
                  ),
                ],
                repeatForever: true,
                pause: Duration(milliseconds: 10000),
              ),
            ),
          ],
        ),
      ),);
  }
}