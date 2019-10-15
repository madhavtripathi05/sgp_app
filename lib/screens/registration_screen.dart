import 'package:flutter/material.dart';
import 'package:sgp_app/components/RoundedButtons.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sgp_app/screens/welcome_screen.dart';
import 'chat_screen.dart';
import 'package:sgp_app/constants.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

String error;

class RegistrationScreen extends StatefulWidget {
  static const String id = 'registration_screen';
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  bool showSpinner = false;
  String email;
  String password;
  String nickname;
  FirebaseAuth _auth = FirebaseAuth.instance;
   String getField(String email){
    //  String email ='18dcs129@charusat.edu.in';
  String year = email.substring(0,2);
  String field = email.substring(2,5);
  int id = int.parse(email.substring(5,8));
  String match = email.substring(9);
  int length = email.length;

if(year == '18' && match == 'charusat.edu.in' && id <400 && id > 200 && length == 24){
  print('success');
 
  if(field == 'dcs')
    field = '_cs';
  else if(field=='dce')
    field = '_ce';
  else if(field=='dit')
    field = '_it';

}
  else{
    print('please enter email address given by your institute');
     field = 'invalid1';
  }

return field;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Flexible(
                child: Hero(
                  tag: 'Dlogo',
                  child: Container(
                    height: 200.0,
                    child: Image.asset('images/Dlogo.jpg'),
                  ),
                ),
              ),
              SizedBox(
                height: 48.0,
              ),
              TextField(
                keyboardType: TextInputType.emailAddress,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  email = value;
                },
                decoration:
                    kTextFieldDecoration.copyWith(hintText: 'Enter your Email'),
              ),
              SizedBox(
                height: 8.0,
              ),
              TextField(
                textAlign: TextAlign.center,
                obscureText: true,
                onChanged: (value) {
                  password = value;
                },
                decoration: kTextFieldDecoration.copyWith(
                    hintText: 'Enter your Password'),
              ),
              SizedBox(
                height: 24.0,
              ),
              RoundedButton(
                title: 'register',
                color: Colors.blue,
                onPressed: () async {
                  setState(() {
                    field = getField(email);
                    showSpinner = true;
                  });
                  try {
                    final newUser = await _auth.createUserWithEmailAndPassword(
                        email: email, password: password);
                    if (newUser != null) {
                      //Navigator.pushNamed(context, ChatScreen.id);
                      print(field);
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ChatScreen()));
                    }
                    setState(() {
                      showSpinner = false;
                    });
                  } catch (e) {
                    print(e);
                    setState(() {
                      error = e.toString();
                      _scaffoldKey.currentState.showSnackBar(SnackBar(
                        content: Text('Error' + error),
                        duration: Duration(seconds: 100),
                        action: SnackBarAction(
                            label: "retry",
                            onPressed: () {
                              //Navigator.pop(context);
                              Navigator.push(context, MaterialPageRoute(builder: (context) => WelcomeScreen()));
                            }),
                      ));
                    });
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
