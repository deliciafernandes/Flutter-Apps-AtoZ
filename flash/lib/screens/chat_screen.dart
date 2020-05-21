import 'package:flash_chat/components/messages_stream_builder.dart';
import 'package:flutter/material.dart';
import 'package:flash_chat/constants.dart';
//TODO 7 : import firebase auth package again
import 'package:firebase_auth/firebase_auth.dart';
//TODO 14 : Part 1 (Sending) import cloud firestore
import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseUser loggedInUser;

class ChatScreen extends StatefulWidget {
  static const String id = 'chat_screen';

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  //TODO : IMPORTANT = To delete the text from the text field once the user has sent the message. we need to create a controller!
  final messageTextController = TextEditingController();

  //TODO 8 : Create a new authentication instance - keep it private to avoid other classes to have access
  final _auth = FirebaseAuth.instance;

  //TODO 15 Part 1 (Sending) : Create a new firestore instance
  final _firestore = Firestore.instance;

  String text;

  //TODO 9 : Create getCurrentUser method, which will check to see if there is a current user who has signed in
  void getCurrentUser() async {
    try {
      //TODO 10 : New user variable to check if a newUser is signed in
      final user = await _auth.currentUser();
      //Equal to null if no user is signed in, else equal to new user details
      //TODO 11 : Use if else block to get the loggedInUser details
      if (user != null) {
        loggedInUser = user;
      }
    } catch (e) {
      print(e);
    }
  }

  //Allows us to listen to the stream of messages
//  void messagesStream() async {
//    await for (var snapshot in _firestore.collection('messages').snapshots()) {
//      for (var message in snapshot.documents) {
//        print(message.data);
//      }
//    }
//  }

  @override
  void initState() {
    super.initState();
    // TODO 12 : call getCurrentUser();
    getCurrentUser();
//    messagesStream();
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
              //TODO 13 : Implement logout functionality
              _auth.signOut();
              Navigator.pop(context);
            },
          ),
        ],
        title: Text('⚡️Chat'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            MessagesStreamBuilder(firestore: _firestore),
            Container(
              decoration: kMessageContainerDecoration,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      controller: messageTextController,
                      onChanged: (value) {
                        //TODO 16 Part 1 (Sending) : Do something with the user input.
                        text = value;
                      },
                      decoration: kMessageTextFieldDecoration,
                    ),
                  ),
                  FlatButton(
                    onPressed: () {
                      messageTextController.clear();
                      //TODO 17 Part 1 (Sending) : Implement send functionality.
                      _firestore.collection('messages').add({
                        'text': text,
                        'sender': loggedInUser.email,
                      });
                      //So far the message is saved in the database messages collection
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
