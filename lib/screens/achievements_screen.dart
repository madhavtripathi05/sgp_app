import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:sgp_app/constants.dart';

class AchievementScreen extends StatefulWidget {
  @override
  _AchievementScreenState createState() => _AchievementScreenState();
}

class _AchievementScreenState extends State<AchievementScreen> {
  var fireInstance = FirebaseDatabase.instance.reference();
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: fireInstance.onValue,
      // initialData: initialData ,
      builder: (BuildContext context, AsyncSnapshot snap) {
        if (snap.hasData &&
            !snap.hasError &&
            snap.data.snapshot.value != null) {
          //taking the data snapshot.
          DataSnapshot snapshot = snap.data.snapshot;
          List data = [];
          List _list = [];
          _list = snapshot.value;
          _list.forEach((f) {
            if (f != null) {
              data.add(f);
            }
          });
          return Scaffold(
            appBar: AppBar(
              title: Text('Achievements'),
              centerTitle: true,
            ),
            body: snap.data.snapshot.value == null
                ? SizedBox()
                : ListView.builder(
                    scrollDirection: Axis.vertical,
                    padding:
                        EdgeInsets.symmetric(vertical: 30.0, horizontal: 9.0),
                    itemBuilder: (context, index) {
                      return Card(
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
                              "NAME : " + data[index]["B"],
                              style: kTextStyleForJson,
                            ),
                            Text(
                              "ID : " + data[index]["C"],
                              style: kTextStyleForJson,
                            ),
                            Text(
                              "ACHIEVEMENT : " + data[index]["D"],
                              style: kTextStyleForJson,
                            ),
                            Text(
                              "DATE : " +
                                  data[index]["E"] +
                                  '/' +
                                  data[index]["F"],
                              style: kTextStyleForJson,
                            ),
                            Text(
                              "ORGANIZED BY : " + data[index]["G"],
                              style: kTextStyleForJson,
                            ),
                          ],
                        ),
                      );
                    },
                    itemCount: data == 0 ? null : 103,
                  ),
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
