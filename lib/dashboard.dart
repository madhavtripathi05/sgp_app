import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:sgp_app/screens/achievements_screen.dart';
import 'package:sgp_app/screens/chat_screen.dart';
import 'package:sgp_app/screens/offline_json.dart';
import 'package:sgp_app/screens/clubs_screen.dart';
import 'package:sgp_app/screens/news_screen.dart';
class Dashboard extends StatefulWidget {
  static final String id = 'dashboard';
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  Material myItems(IconData icon, String heading, int color) {
    return Material(
      color: Colors.white,
      elevation: 14.0,
      shadowColor: Color(0x802196F3),
      borderRadius: BorderRadius.circular(24.0),
      child: new InkWell(
        onTap: (){
          if(heading=='CHAT')
              {
                Navigator.push(context, MaterialPageRoute(builder: (context) => ChatScreen()));
                //  Navigator.pushNamed(context,ChatScreen.id);
              }
            // else if(heading=='NEWS')
            // {
            //     Navigator.push(context, MaterialPageRoute(builder: (context) => NewsScreen()));
            // }
            else if(heading=='ACHIEVEMENT')
            {
                Navigator.push(context, MaterialPageRoute(builder: (context) => AchievementScreen()));
            }
            else if(heading=='CLUBS INFO')
            {
                 Navigator.push(context, MaterialPageRoute(builder: (context) => Clubs()));
            }
         
        },
        child: Center(
          child: Padding(
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
                          style: TextStyle(
                            color: new Color(color),
                            fontSize: 20.0,
                          ),
                        ),
                      ),
                    ),
                    Material(
                      color: new Color(color),
                      borderRadius: BorderRadius.circular(22.0),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Icon(
                          icon,
                          color: Colors.white,
                          size: 30.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
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
          'D E P S T A R ',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.deepOrange[300],
      ),
      body: 
          StaggeredGridView.count(
            crossAxisCount: 2,
            crossAxisSpacing: 12.0,
            mainAxisSpacing: 12.0,
            padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            children: <Widget>[
              myItems(
                Icons.message,
                "CHAT",
                0xff7297ff,
              ),
              myItems(Icons.notifications, "NEWS", 0xff26cb3c),
              myItems(Icons.new_releases, "ACHIEVEMENT", 0xffff3266),
              myItems(
                Icons.people,
                "CLUBS INFO",
                0xff3399fe,
              ),
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
