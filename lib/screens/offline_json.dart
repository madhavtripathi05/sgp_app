import 'dart:convert';
import 'package:sgp_app/constants.dart';
import 'package:flutter/material.dart';

class OfflineJson extends StatefulWidget {
  static final String id = 'offline_json';
  @override
  _OfflineJsonState createState() => _OfflineJsonState();
}

class _OfflineJsonState extends State<OfflineJson> {
  // GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('offline Json Loader'),
      ),
      body: Container(
        child: Center(
          child: FutureBuilder(
            future: DefaultAssetBundle.of(context)
                .loadString('jsons/Studentsdata.json'),
            builder: (context, snapshot) {
              // json decode
              var data = jsonDecode(snapshot.data.toString());
              return ListView.builder(
                padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 9.0),
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onLongPressEnd: (dynamic) {
                      _showToast(context);
                    },
                    child: Card(
                      borderOnForeground: true,
                      elevation: 2.0,
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
                    ),
                  );
                },
                itemCount: data == null ? 0 : data.length,
                
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
