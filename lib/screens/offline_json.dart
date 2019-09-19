import 'dart:convert';
import 'package:sgp_app/constants.dart';
import 'package:flutter/material.dart';

class OfflineJson extends StatefulWidget {
  static final String id = 'offline_json';
  @override
  _OfflineJsonState createState() => _OfflineJsonState();
}

class _OfflineJsonState extends State<OfflineJson> {
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
                  return Card(
                    borderOnForeground: true,
                    elevation: 12.0,
                    // color: Colors.white12,
                    shape: OutlineInputBorder(
                      gapPadding: 5.0,
                      borderSide: BorderSide(color: Colors.blue[100], width: 1.0),
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
                          "DATE : " + data[index]["E"] + '/' + data[index]["F"],
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
                itemCount: data == null ? 0 : 50 /*data.length */,
              );
            },
          ),
        ),
      ),
    );
  }
}
