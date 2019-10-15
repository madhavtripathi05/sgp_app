import 'package:flutter/material.dart';
import 'package:sgp_app/screens/welcome_screen.dart';

void main() => runApp(FlashChat());

class FlashChat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      home: WelcomeScreen(),
    );
  }
}
