import 'package:flutter/material.dart';
import 'package:sgp_app/screens/achievements_screen.dart';
import 'registration_screen.dart';
import 'login_screen.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:sgp_app/components/RoundedButtons.dart';

class WelcomeScreen extends StatefulWidget {
  static const String id = 'welcome_screen';
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation animation, coloredAnimation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      duration: Duration(milliseconds: 1500),
      vsync: this,
    );

    animation = CurvedAnimation(parent: controller, curve: Curves.easeIn);
    coloredAnimation =
        ColorTween(begin: Colors.blue, end: Colors.white).animate(controller);
    controller.forward();

    controller.addListener(() {
      setState(() {});
      print(controller.value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      backgroundColor:coloredAnimation.value,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Hero(
                  tag: 'Dlogo',
                  child: Container(
                    child: Image.asset(
                      'images/Dlogo.jpg',
                    ),
                    height: animation.value * 60,
                  ),
                ),
                Row(
                  children: <Widget>[
                    SizedBox(
                      width: 50.0,
                    ),
                    TypewriterAnimatedTextKit(
                      text: [' Depstar'],
                      textStyle: TextStyle(
                        color: Colors.lightBlueAccent,
                        fontSize: 40.0,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            RoundedButton(
              title: 'Log In',
              color: Colors.lightBlueAccent,
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LoginScreen()));
              },
            ),
            RoundedButton(
              title: 'Register',
              color: Colors.blue,
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => RegistrationScreen()));
              },
            ),
            RoundedButton(
              title: 'Achievements',
              color: Colors.blueAccent,
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AchievementScreen()));
              },
            )
          ],
        ),
      ),
    );
  }
}
