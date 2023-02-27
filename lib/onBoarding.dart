import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:alt_learning_app/login.dart';

class OnBoardingPage extends StatefulWidget {
  @override
  _OnBoardingPageState createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  final introKey = GlobalKey<IntroductionScreenState>();

  void _onIntroEnd(context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => login()),
    );
  }

  /*Widget _buildImage(String assetName) {
    return Align(
      child: Image.asset('assets/$assetName.jpg', width: 256.0),
      alignment: Alignment.bottomCenter,
    );
  }*/

  @override
  Widget build(BuildContext context) {
    const bodyStyle = TextStyle(fontSize: 19.0);
    const pageDecoration = const PageDecoration(
      titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
      bodyTextStyle: bodyStyle,
      bodyPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      imagePadding: EdgeInsets.zero,
    );

    return IntroductionScreen(
      key: introKey,
      pages: [
        PageViewModel(
          title: "LETS LISTEN TO PLANTS",
          body:
          '''It simply means to
    monitor a physical device embedded with electronics, sensors,
    software and network connectivity to enable it to sense plants's emotions''',
          image: Image(image: AssetImage('asset/flowers.png'),height: 100, width: 100,),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "MONITORS HEALTH",
          body:"Tells us the amount of water required at the right time according to surrounding temperature ",
          image: Image(image: AssetImage('asset/nature.png'),),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "EASY TO USE",
          body:
          "User friendly functionality and settings",
          image: Image(image: AssetImage('asset/monitor3.jpg'),),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "INDOOR PLANT GUIDE",
          body:
          "Best and worthy monitoring system for your lovely plants",
          image: Image(image: AssetImage('asset/joy.png')),
          decoration: pageDecoration,
        ),
      ],
      onDone: () => _onIntroEnd(context),
      //onSkip: () => _onIntroEnd(context), // You can override onSkip callback
      showSkipButton: true,
      dotsFlex: 0,
      nextFlex: 0,
      skip: const Text('Skip'),
      next: const Icon(Icons.arrow_forward),
      done: const Text('Done', style: TextStyle(fontWeight: FontWeight.w600)),
      dotsDecorator: const DotsDecorator
        (
        size: Size(10.0, 10.0),
        color: Color(0xFFBDBDBD),
        activeSize: Size(22.0, 10.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
    );
  }
}