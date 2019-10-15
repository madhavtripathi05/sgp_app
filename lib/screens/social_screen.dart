import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';

class Social extends StatelessWidget {
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
                            width: 60,
                          ),
                          /*ClipRRect(
                        borderRadius: BorderRadius.circular(24.0),
                          child: Image.asset("images/outdor.jpg", height: 200)
                        ),*/
                          Text(
                          'S o c i a l  C l u b',
                            style: TextStyle(
                                fontSize: 35.0,
                                fontFamily: 'Pacifico',
                                fontWeight: FontWeight.bold,
                                color: Colors.blueGrey,
                                decoration: TextDecoration.none
                                ),
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
              style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),
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
                style: TextStyle(
                  fontSize: 20.0,fontWeight: FontWeight.bold
                ),
              ),
              SizedBox(height: 20.0,),
              Text('Rishi Shah-18DCS110\n\nSamaksh Khatri-18DCS035\n\nMansi Sisangiya-17DIT066\n\nHarnish Patel-17DIT041\n\nJyoti Jethani-17DIT017',
              style: TextStyle(fontSize: 17.0),
              textAlign: TextAlign.center,
              ),
              SizedBox(height: 25.0,),
              Text(
                'Faculty Members',
                style: TextStyle(
                  fontSize: 20.0,fontWeight: FontWeight.bold
                ),
              ),
              SizedBox(height: 20.0,),
              Text('Michele Mistry',
              style: TextStyle(fontSize: 20.0,
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
              style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),
            ),
          ),
          decoration: BoxDecoration(
            color: Colors.grey[600].withOpacity(0.6),
            borderRadius: BorderRadius.circular(24.0),
          ),
        ),
        Container(
          child: Text(
            '\n\n1.Visiting the Anand Dham, Old Age Home\n\n2.Street play in Vallabh Vidhyanagar\n\n3.Wall of Kindness',
            style: TextStyle(fontSize: 20.0),
          ),
        ),
      ],
    ),
  );
}
