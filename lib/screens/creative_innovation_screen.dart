import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';

class CreativeInnovation extends StatelessWidget {
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
                          SizedBox(
                            width: 14.0,
                          ),
                          /*ClipRRect(
                        borderRadius: BorderRadius.circular(24.0),
                          child: Image.asset("images/outdor.jpg", height: 200)
                        ),*/
                          Text(
                            '         Creativity\n        And\n         Innovation',
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
                    /*decoration: BoxDecoration(
                    image: new DecorationImage(
                        fit: BoxFit.fill, image: AssetImage("images/outdor.jpg"))),*/
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
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
          ),
          decoration: BoxDecoration(
            color: Colors.grey[600].withOpacity(0.6),
            borderRadius: BorderRadius.circular(24.0),
          ),
        ),
        Container(
          child: Column(
            children: <Widget>[
              Text(
                'Student Core Members',
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                'Kairav Thakkar-17DCS066\n\nRohan Gandhi-17DCE009\n\nMaahi Patel-18DCS073\n\nJilsa Chandarana-18DCS010',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 17.0),
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
                'Krishna Patel\n\nAtufa Ali',
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
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
          ),
          decoration: BoxDecoration(
            color: Colors.grey[600].withOpacity(0.6),
            borderRadius: BorderRadius.circular(24.0),
          ),
        ),
        Container(
          child: Text(
            '1.	Ideathon:\n              Come up with new, innovative and creative idea to solve problems that affect humanity. Students were given the platform to propose their innovative ideas. \n\n2.	ISearch:\n               Online platform to share ideas.\n\n3.	Blender Workshop:\n               One day workshop for basic understanding of Blender software.\n\n4.	Coming soon: \n               Treasure hunt with coding.',
            style: TextStyle(fontSize: 16.0),
          ),
        ),
      ],
    ),
  );
}
