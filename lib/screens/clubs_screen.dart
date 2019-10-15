import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:sgp_app/screens/coding_club_screen.dart';
import 'package:sgp_app/screens/creative_innovation_screen.dart';
import 'package:sgp_app/screens/outdoor_screen.dart';
import 'package:sgp_app/screens/social_screen.dart';


class Clubs extends StatefulWidget {
  static final String id = 'dashboard';
  @override
  _ClubsState createState() => _ClubsState();
}

class _ClubsState extends State<Clubs> {
  Material myItems(String image, String heading, int colour,int colour2) {
    return Material(
      color: Color(colour).withOpacity(0.9),
      elevation: 0.0,
      shadowColor: Color(0x802196F3),
      borderRadius: BorderRadius.circular(24.0),

      child: new InkWell(
        onTap: (){
            if(heading=='Outdoor \n\t\t\t\tEducation\n\t\t\t\t\t\t\t\t\t\t\tClub')
            {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => OutDoor()));
            }
            else if(heading=='Creativity \n\t\t\t\t& Innovation\n\t\t\t\t\t\t\t\t\t\t\tClub')
            {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => CreativeInnovation()));
            }
            else if(heading=='Coding Club')
            {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Coding()));
            }
            else if(heading=='Social Club')
            {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Social()));
            }
        },
        child: Container(
          child: Row(
            children: <Widget>[
              Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: ClipRRect(
                    borderRadius: new BorderRadius.circular(24.0),
                    child: Image.asset(image,width: 142,height: 142,fit: BoxFit.fill,)),
                ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                                heading,
                                overflow: TextOverflow.visible,
                                maxLines: 3,
                                style: TextStyle(
                                   color: Color(colour2),
                                  fontSize: 17.0,
                                  fontFamily: 'Pacifico'
                                ),
                              ),
                          ),
                        ),
                        
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '                     CLUBS',
        ),
        backgroundColor: Colors.blue,
      ),

      body: 
          StaggeredGridView.count(
            crossAxisCount: 2,
            crossAxisSpacing: 0.0,
            mainAxisSpacing: 25.0,
            padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            children: <Widget>[
              myItems(
                'images/outdor.jpg',
                'Outdoor \n\t\t\t\tEducation\n\t\t\t\t\t\t\t\t\t\t\tClub',
                0xFFFFECB3,
                0xFF000000
              ),
              myItems('images/caic.jpg','Creativity \n\t\t\t\t& Innovation\n\t\t\t\t\t\t\t\t\t\t\tClub', 0xFF827717,0xFFFFFFFF),
              myItems('images/codingclub.jpg','Coding Club', 0xFF3F51B5,  0xFFFFFFFF),
              myItems('images/socialclub.jpg','Social Club', 0xFF2979FF , 0xFFFFFFFF),
              //myItems('images/', heading, color)
            ],
            staggeredTiles: [
              StaggeredTile.extent(2, 136.0),
              StaggeredTile.extent(2, 136.0),
              StaggeredTile.extent(2, 136.0),
              StaggeredTile.extent(2, 136.0),
            ],
          ),
      );
  }
}
