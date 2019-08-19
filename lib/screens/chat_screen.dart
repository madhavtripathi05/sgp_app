import 'package:flutter/material.dart';
import 'package:sgp_app/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatScreen extends StatefulWidget {
  static const String id = 'chat_screen';
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

final _firestore = Firestore.instance;
FirebaseUser loggedInUser;

class _ChatScreenState extends State<ChatScreen> {

  final messageTextController = TextEditingController();
  final _auth = FirebaseAuth.instance;

  String messageText;

  @override
  void initState() {
    super.initState();

    getCurrentUser();
  }


  void getCurrentUser()async{
    try{
      final _user = await _auth.currentUser();
      if(_user != null){
        loggedInUser = _user;
//        print(loggedInUser.email);
      }
    }catch(e){
     print(e);
    }
  }

//  void getMessages()async{
//    final messageList = await _firestore.collection('messages').getDocuments();
//    for(var message in messageList.documents){
//      print(message.data);
//    }
//  }

  void messagesStream()async{
    await for(var snapshot in _firestore.collection('messages').snapshots()){
      for(var message in snapshot.documents){
        print(message.data);
      }
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
               _auth.signOut();
               Navigator.pop(context);
//                messagesStream();
              }),
        ],

        title: Text('Chat Screen'),
        backgroundColor: Colors.blue,
      ),

      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            MessageStream(),

            Container(
              decoration: kMessageContainerDecoration,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      controller: messageTextController,
                      onChanged: (value) {
                        messageText = value;
                      },
                      decoration: kMessageTextFieldDecoration,
                    ),
                  ),
                  FlatButton(
                    onPressed: () {
                        messageTextController.clear();
                      _firestore.collection('messages').add({
                        'test':messageText,
                        'sender': loggedInUser.email

                      });
                    },
                    child: Text(
                      'Send',
                      style: kSendButtonTextStyle,

                    ),
                  ),
                ],
              ),
            ),
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
      stream: _firestore.collection('messages').snapshots(),
      builder: (context,snapshot) {
        if(!snapshot.hasData){
          return Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.lightBlueAccent,
            ),
          );
        }
        final messages = snapshot.data.documents.reversed;
        List<MessageBubble> messageBubbles = [];

        for(var message in messages){
          final messageText = message.data['test'];
          final messageSender = message.data['sender'];

          final currentUser = loggedInUser.email;

          final messageBubble = MessageBubble(
            text: messageText,
            sender: messageSender,
            isMe: currentUser == messageSender
          );
          messageBubbles.add(messageBubble);
        }

        return Expanded(
          child: ListView(
            reverse: true,
            padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 10.0),
            children: messageBubbles,
          ),
        );

      },
    );
  }
}



class MessageBubble extends StatelessWidget {

  MessageBubble({this.text,this.sender,this.isMe});

  final String sender;
  final String text;
  bool isMe;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: isMe?CrossAxisAlignment.end:CrossAxisAlignment.start,
          children: <Widget>[
            Text(
                sender,
              style: TextStyle(
                fontSize: 10.0,
                color: Colors.white70
              ),
            ),
            Material(
              borderRadius: BorderRadius.only(
                topLeft: isMe?Radius.circular(30):Radius.zero,
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
                topRight: !isMe?Radius.circular(30):Radius.zero,
              ),
              elevation: 5.0,
              color: isMe?Colors.blue:Colors.white,
              child:Padding(
                padding: EdgeInsets.symmetric(vertical: 10,horizontal: 20),
                child: Text(
                  text,
                  style: TextStyle(
                      fontSize: 14.0,
                      color: isMe?Colors.white:Colors.blue,
                  ),
                ),
              )
            ),
          ],
        ),
    );
  }
}

