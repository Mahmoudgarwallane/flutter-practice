import 'package:flutter/material.dart';
import 'package:flash_chat/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatScreen extends StatefulWidget {
  static const String id = "/chat";
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

final FirebaseFirestore _fireStore = FirebaseFirestore.instance;
final FirebaseAuth _auth = FirebaseAuth.instance;
User? loggedUser;

class _ChatScreenState extends State<ChatScreen> {
  TextEditingController controller = TextEditingController();
  String? text;

  getUser() {
    try {
      User? user = _auth.currentUser;
      if (user != null) {
        loggedUser = user;
        print(loggedUser!.email);
      }
    } catch (e) {
      print('sign in error in chat screen');
    }
  }

  messagesStream() async {
    await for (var snapchot in _fireStore.collection("messages").snapshots()) {
      for (var message in snapchot.docs) {
        print(message.data());
      }
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUser();
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
                // messagesStream();
              }),
        ],
        title: Text('⚡️Chat'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            MessagesStream(),
            Container(
              decoration: kMessageContainerDecoration,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      controller: controller,
                      style: TextStyle(color: Colors.black),
                      onChanged: (value) {
                        text = value;
                      },
                      decoration: kMessageTextFieldDecoration,
                    ),
                  ),
                  FlatButton(
                    onPressed: () {
                      if (text != null) {
                        _fireStore.collection('messages').add({
                          "text": text,
                          "sender": loggedUser!.email,
                          'ts': Timestamp.now(),
                        });
                      }

                      controller.clear();
                      text = null;
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

class MessagesStream extends StatelessWidget {
  const MessagesStream({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: _fireStore
            .collection("messages")
            .orderBy('ts', descending: true)
            .snapshots(),
        builder: (BuildContext context, snapshot) {
          if (!snapshot.hasData) {
            // ignore: prefer_const_constructors
            return Center(child: CircularProgressIndicator());
          } else {
            final messages = snapshot.data?.docs;
            List<TextBubble> msgs = messages!
                .map((e) => TextBubble(
                    isMe: loggedUser!.email == e["sender"].toString(),
                    sender: e["sender"].toString(),
                    text: e["text"].toString()))
                .toList();
            return Expanded(
              child: ListView(
                reverse: true,
                children: msgs,
              ),
            );
          }
        });
  }
}

class TextBubble extends StatelessWidget {
  final String sender;
  final String text;
  final bool isMe;
  const TextBubble(
      {Key? key, required this.sender, required this.text, required this.isMe})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment:
            isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Text(
            sender,
            style: TextStyle(fontSize: 12, color: Colors.black54),
          ),
          Material(
            elevation: 1,
            borderRadius: isMe
                ? const BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                    bottomLeft: Radius.circular(30))
                : BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                    bottomRight: Radius.circular(30)),
            color: isMe ? Colors.lightBlue : Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                text,
                style: TextStyle(
                    fontSize: 15, color: isMe ? Colors.white : Colors.black),
              ),
            ),
          )
        ],
      ),
    );
  }
}
