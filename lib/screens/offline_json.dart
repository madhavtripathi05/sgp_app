import 'dart:convert';
import 'package:sgp_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
// import 'package:sgp_app/screens/achievements_screen.dart';

class AchievementEntry {
  String key;
  String A;
  String B;
  String C;
  String D;
  String E;
  String F;
  String G;
  AchievementEntry(this.A, this.B, this.C, this.D, this.E, this.F, this.G);

  String getA() {
    return A;
  }

  AchievementEntry.fromSnapshot(DataSnapshot snapshot)
      : key = snapshot.key,
        A = snapshot.value["A"],
        B = snapshot.value["B"],
        C = snapshot.value["C"],
        D = snapshot.value["D"],
        E = snapshot.value["E"],
        F = snapshot.value["F"],
        G = snapshot.value["G"];
}

class OfflineJson extends StatefulWidget {
  static final String id = 'offline_json';
  @override
  _OfflineJsonState createState() => _OfflineJsonState();
}

class _OfflineJsonState extends State<OfflineJson> {
  // GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();

  final mainReference = FirebaseDatabase.instance
      .reference()
      .orderByChild('created_at')
      .limitToFirst(10);
  List<AchievementEntry> aList = new List();

// _OfflineJsonState(){
//   mainReference.onChildAdded.listen(_onEntryAdded);
// }

//   _onEntryAdded(Event event) {
//     setState(() {
//       aList.add(AchievementEntry.fromSnapshot(event.snapshot));
//     });
//   }

  AchievementEntry ae;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Achievements'),
        centerTitle: true,
      ),
      body: Container(
        child: Center(
          child: FutureBuilder(
            future:
                DefaultAssetBundle.of(context).loadString('jsons/news.json'),
            builder: (context, snapshot) {
              // json decode
              var data = jsonDecode(snapshot.data.toString());
              // aList = snapshot.value;
              return ListView.builder(
                scrollDirection: Axis.vertical,
                padding: EdgeInsets.symmetric(vertical: 30.0, horizontal: 9.0),
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onLongPressEnd: (dynamic) {
                      _showToast(context);
                    },
                    child: Card(
                      borderOnForeground: true,
                      elevation: 2.0,
                      margin: EdgeInsets.only(bottom: 20),
                      // color: Colors.white12,
                      shape: OutlineInputBorder(
                        gapPadding: 5.0,
                        borderSide: BorderSide(
                            color: Colors.lightBlueAccent, width: 1.0),
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        textDirection: TextDirection.ltr,
                        children: <Widget>[
                          Text(
                            "Headline : " + data[index]["B"],
                            style: kTextStyleForJson1,
                          ),
                          Text(
                            "Content : " + data[index]["C"],
                            style: kTextStyleForJson,
                          ),
                          Text(
                            "Date : " + data[index]["D"],
                            style: kTextStyleForJson,
                          ),
                        ],
                      ),
                    ),
                  );
                },
                itemCount: data == null ? 0 : 103,
              );
            },
          ),
        ),
      ),
    );
  }

  void _showToast(BuildContext context) {
    final scaffy = Scaffold.of(context);
    scaffy.showSnackBar(SnackBar(
      content: Text("long press is yet to be implemented"),
      action: SnackBarAction(
        label: "hide",
        onPressed: scaffy.hideCurrentSnackBar,
      ),
    ));
  }
}
