import 'package:flutter/material.dart';
import 'package:flutter_academy_ar/chat_app/models/chats.dart';

class ChatsCard extends StatelessWidget {
  const ChatsCard({
    Key? key,
    required this.chats,
    required this.press,
  }) : super(key: key);

  final Chats chats;
  final void Function()? press;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Row(
          children: [
            Stack(
              children: [
                CircleAvatar(
                  radius: 25,
                  backgroundImage: AssetImage(chats.image),
                ),
                if (chats.isActive)
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: Container(
                      width: 16,
                      height: 16,
                      decoration: BoxDecoration(
                          color: Colors.green,
                          shape: BoxShape.circle,
                          border: Border.all(width: 3, color: Colors.white)),
                    ),
                  ),
              ],
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      chats.name,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 8.0,
                    ),
                    Opacity(
                      opacity: 0.70,
                      child: Text(
                        chats.lastMessage,
                        maxLines: 1,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Opacity(opacity: 0.70,child: Text(chats.time),)
          ],
        ),
      ),
    );
  }
}
