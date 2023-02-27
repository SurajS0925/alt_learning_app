import 'package:animated_background/animated_background.dart';
import 'package:flutter/material.dart';

// main class calling to
// the MyAnimatedBackground.

// MyAnimatedBackground class is stateful class.
class MyAnimatedBackground extends StatefulWidget {
  MyAnimatedBackground({Key? key}) : super(key: key);

  @override
  State<MyAnimatedBackground> createState() => _MyAnimatedBackgroundState();
}

class _MyAnimatedBackgroundState extends State<MyAnimatedBackground>
    with SingleTickerProviderStateMixin {
  // definition of ParticlesOptions.
  ParticleOptions particles = const ParticleOptions(
    baseColor: Colors.cyan,
    spawnOpacity: 0.0,
    opacityChangeRate: 0.25,
    minOpacity: 0.1,
    maxOpacity: 0.4,
    particleCount: 70,
    spawnMaxRadius: 15.0,
    spawnMaxSpeed: 100.0,
    spawnMinSpeed: 30,
    spawnMinRadius: 7.0,
  );
  @override
  Widget build(BuildContext context) {
    // return MaterialApp
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(

        // In body we have a AnimatedBackgound,
        // behavior RandomParticleBehaviour.
        body: AnimatedBackground(
          // vsync uses singleTicketProvider state mixin.
          vsync: this,
          behaviour: RandomParticleBehaviour(options: particles),

          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  // center text
                  "Project Pot",
                  style: TextStyle(fontSize: 50,color: Colors.blueAccent[500]),
                ),
                Text("The caretaker of your plant", style: TextStyle(fontSize: 25,color: Colors.blueAccent[250]),)
              ],
            ),
          ),

        ),


      ),

    );
  }
}