import 'package:flutter/material.dart';

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
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      title: const Text(
        "Eslam Medhat",
        style: TextStyle(fontSize: 16.0),
      ),
      actions: [
        IconButton(onPressed: (){}, icon: Icon(Icons.local_phone),),
        IconButton(onPressed: (){}, icon: Icon(Icons.videocam),),
        IconButton(onPressed: (){}, icon: Icon(Icons.logout),),
      ],
    );
  }
}
