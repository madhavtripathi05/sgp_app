// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// import 'dart:convert';
// import 'dart:async';

class AchievementScreen extends StatefulWidget {
  static const String id = 'achievements_screen';
  @override
  _AchievementScreenState createState() => _AchievementScreenState();
}

final _firestore = Firestore.instance;

class _AchievementScreenState extends State<AchievementScreen> {
  void messagesStream() async {
    await for (var snapshot
        in _firestore.collection('achievements').snapshots()) {
      for (var message in snapshot.documents) {
        print(message.data);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Achievements of Depstar Students:'),
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            MessageStream(),
          ],
        ),
      ),
    );
  }
}

class MessageStream extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _firestore.collection('achievements').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.lightBlueAccent,
            ),
          );
        }
        final messages = snapshot.data.documents.reversed;
        List<MessageBubble> messageBubbles = [];

        for (var message in messages) {
          final name = message.data['Student Name'];
          final achievement = message.data['Achievement'];

          final messageBubble = MessageBubble(
            name: name,
            achievements: achievement,
          );
          messageBubbles.add(messageBubble);
        }

        return Expanded(
          child: ListView(
            reverse: true,
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
            children: messageBubbles,
          ),
        );
      },
    );
  }
}

class MessageBubble extends StatelessWidget {
  MessageBubble({this.name, this.achievements, this.dateTime});

  final String name;
  final String achievements;
  final DateTime dateTime;
  // final String id;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text(
            name,
            style: TextStyle(fontSize: 10.0, color: Colors.white70),
          ),
          Material(
              borderRadius: BorderRadius.all(Radius.circular(28.0)),
              elevation: 5.0,
              color: Colors.blue,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Text(
                  achievements,
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.white,
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
