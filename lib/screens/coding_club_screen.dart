import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';

class Coding extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber[50],
      body: SafeArea(
        child: MaterialApp(
            debugShowCheckedModeBanner: false,
            home: SingleChildScrollView(
              child: Column(
                //fit: StackFit.expand,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      SizedBox(
                        height: 100.0,
                      ),
                      Row(
                        children: <Widget>[
                          Text(
                            '         Coding Club',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 35.0,
                                fontFamily: 'Pacifico',
                                fontWeight: FontWeight.bold,
                                color: Colors.blueGrey,
                                decoration: TextDecoration.none),
                          )
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  Container(
                    width: 350, //MediaQuery.of(context).size.width,
                    height: 485, //MediaQuery.of(context).size.height,
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            width: 350, //MediaQuery.of(context).size.width,
                            height: 485,
                            child: FlipCard(
                              direction: FlipDirection.HORIZONTAL,
                              front: Material(
                                color: Colors.amber[100],
                                borderRadius: BorderRadius.circular(24.0),
                                shadowColor: Color(0x802196F3).withOpacity(0.2),
                                child: _nameDetailContainer(),
                              ),
                              back: Material(
                                color: Colors.amber[100],
                                borderRadius: BorderRadius.circular(24.0),
                                shadowColor: Color(0x802196F3).withOpacity(0.2),
                                child: _socialContainer(),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}

Widget _nameDetailContainer() {
  return Container(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Container(
          height: 60.0,
          width: 400.0,
          child: Center(
            child: Text(
              '  Committee Members',
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w800,
                  fontFamily: 'Source San Pro'),
            ),
          ),
          decoration: BoxDecoration(
            color: Colors.grey[600].withOpacity(0.6),
            borderRadius: BorderRadius.circular(24.0),
          ),
        ),
        SizedBox(
          height: 15.0,
        ),
        Container(
          child: Column(
            children: <Widget>[
              Text(
                'Student Core Members',
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                'Namra Solanki-18DCS120\n\nMann Patel-18DCS074\n\nKushan Mehta-17DCS030\n\nRakshit Kachhadiya-18DCE037\n\nShaktiSinh Zala-17DCE017',
                style: TextStyle(fontSize: 17.0),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 25.0,
              ),
              Text(
                'Faculty Members',
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                'Phenil Buch\n\nKhushi Patel',
                style: TextStyle(
                  fontSize: 20.0,
                ),
                textAlign: TextAlign.center,
              )
            ],
          ),
        )
      ],
    ),
  );
}

Widget _socialContainer() {
  return Container(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Container(
          height: 60.0,
          width: 400.0,
          child: Center(
            child: Text(
              'Events',
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w800,
                  fontFamily: 'Source San Pro'),
            ),
          ),
          decoration: BoxDecoration(
            color: Colors.grey[600].withOpacity(0.6),
            borderRadius: BorderRadius.circular(24.0),
          ),
        ),
        SizedBox(
          height: 15.0,
        ),
        Container(
          child: Text(
            '1.Codewar-Coding competition on hackerearth platform,\n\n2.GitHub/Bleachbit-Workshop for 2nd year students on CLI and Git-.Guided by:Ashwin Makvana,Head ,TNP CEll Charusat\n\n3.Illuminati-A coding war on codechef platform',
            style: TextStyle(fontSize: 17.0),
          ),
        ),
      ],
    ),
  );
}
