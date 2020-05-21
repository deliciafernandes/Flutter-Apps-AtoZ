import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'message_bubble.dart';
import 'package:flash_chat/screens/chat_screen.dart';

class MessagesStreamBuilder extends StatelessWidget {
  const MessagesStreamBuilder({
    Key key,
    @required Firestore firestore,
  })  : _firestore = firestore,
        super(key: key);

  final Firestore _firestore;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _firestore
          .collection('messages')
          .snapshots() //wheres the data gonna come from
      ,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return CircularProgressIndicator(backgroundColor: Colors.blueAccent);
        }

        final messages = snapshot.data.documents.reversed;

        List<MessageBubble> messageBubbles = [];
        for (var message in messages) {
          final messageText = message.data['text'];
          final messageSender = message.data['sender'];

          final currentUser = loggedInUser.email;

          final messageBubble = MessageBubble(
            text: messageText,
            sender: messageSender,
            isMe:
                currentUser == messageSender, //If true means the sender is me!
          );

          messageBubbles.add(messageBubble);
        }

        return Expanded(
          child: ListView(
            reverse: true,
            children: messageBubbles,
          ),
        );
      },
    );
  }
}
