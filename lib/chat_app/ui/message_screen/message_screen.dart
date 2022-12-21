import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_academy_ar/chat_app/ui/message_screen/message-body.dart';
import 'package:google_sign_in/google_sign_in.dart';

class MessageScreen extends StatefulWidget {
  const MessageScreen({Key? key}) : super(key: key);

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: MessageBody(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      title: const Text(
        "Friendly Chat",
        style: TextStyle(fontSize: 16.0),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.local_phone),
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.videocam),
        ),
        IconButton(
          onPressed: () async {
            await GoogleSignIn().signOut();
            await FirebaseAuth.instance.signOut();
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.logout),
        ),
        SizedBox(
          width: 20.0,
        )
      ],
    );
  }
}
