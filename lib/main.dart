import 'package:flutter/material.dart';
import 'package:sgp_app/screens/welcome_screen.dart';
import 'package:sgp_app/screens/login_screen.dart';
import 'package:sgp_app/screens/registration_screen.dart';
import 'package:sgp_app/screens/chat_screen.dart';

void main() => runApp(FlashChat());

class FlashChat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      
//      theme: ThemeData.dark().copyWith(
//        textTheme: TextTheme(
//          body1: TextStyle(color: Colors.lightBlueAccent),
//        ),
//      ),
//      home: WelcomeScreen(),
    


    theme: ThemeData.dark(),
      initialRoute: WelcomeScreen.id,
      routes: {
        '/':(context)=>FlashChat(),
        ChatScreen.id:(context)=>ChatScreen(),
        LoginScreen.id:(context)=>LoginScreen(),
        RegistrationScreen.id:(context)=>RegistrationScreen(),
        WelcomeScreen.id:(context)=>WelcomeScreen(),

      },
    );
  }
}


