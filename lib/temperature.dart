import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';

class Temperature extends StatefulWidget {
  const Temperature({super.key});

  @override
  State<Temperature> createState() => _TemperatureState();
}

class _TemperatureState extends State<Temperature> {
  final referencedata=FirebaseDatabase.instance;
  DatabaseReference reference = FirebaseDatabase.instance.ref('/values');

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
            TyperAnimatedText('Temperature ${snapshot.value.toString()}',
                textStyle: const TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    backgroundColor: Colors.purple)),
            TyperAnimatedText('Moisture level ${snapshot.value.toString()}',
                textStyle: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    backgroundColor: Colors.purple)),
          ],
          repeatForever: true,
          onTap: () {
            print("Tap Event");
          },
        ));
      }));

  }
}