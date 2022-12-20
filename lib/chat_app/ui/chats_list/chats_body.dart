import 'package:flutter/material.dart';
import 'package:flutter_academy_ar/chat_app/models/chats.dart';
import 'package:flutter_academy_ar/chat_app/ui/chats_list/components/chats_card.dart';
import 'package:flutter_academy_ar/chat_app/ui/chats_list/components/fil_outline_button.dart';
import 'package:flutter_academy_ar/chat_app/ui/message_screen/message_screen.dart';
class ChatsBody extends StatelessWidget {
  const ChatsBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        Container(
          padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
          color: Colors.green,
          child: Row(
            children: [
              FillOutlineButton(press: (){},text: "Recent Message",isFilled:true),
              SizedBox(width: 10,),
              FillOutlineButton(press: (){},text: "Active",isFilled:false),
            ],
          ),
        ),
        Expanded(child: ListView.builder(
          itemCount: chatsData.length,
            itemBuilder: (context,index) =>ChatsCard(
                chats: chatsData[index],
                press: ()=> Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MessageScreen())))
            ))
      ],
    );
  }
}
