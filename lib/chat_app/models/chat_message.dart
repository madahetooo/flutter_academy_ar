import 'package:flutter/cupertino.dart';

enum ChatMessageType {text, audio, image, video}
enum MessageStatus {not_sent, not_view, viewed}
class ChatMessage{
  final String text;
  final ChatMessageType messageType;
  final MessageStatus messageStatus;
  final bool isSender;
  final String? sender;
  final String? senderImage;
  final String? imageUrl;


  ChatMessage({
   this.text='',
   required this.messageType,
   required this.messageStatus,
   required this.isSender,
   this.sender,
   this.senderImage,
   this.imageUrl,
});
}
class ChatMessages with ChangeNotifier{
  List<ChatMessage> chatMessages =[
    ChatMessage(
      text: "Hi Ahmed, How are you? ",
        messageType: ChatMessageType.text,
        messageStatus: MessageStatus.viewed,
        isSender: true
    ),
    ChatMessage(
        text: "Hi Kareem",
        messageType: ChatMessageType.text,
        messageStatus: MessageStatus.viewed,
        isSender: false
    ),
    ChatMessage(
        text: "Hope you are doing well",
        messageType: ChatMessageType.text,
        messageStatus: MessageStatus.viewed,
        isSender: true
    ),
    ChatMessage(
        text: "I am good Alhamdullilah",
        messageType: ChatMessageType.text,
        messageStatus: MessageStatus.viewed,
        isSender: false
    ),
    ChatMessage(
        text: "Happy to hear that",
        messageType: ChatMessageType.text,
        messageStatus: MessageStatus.viewed,
        isSender: true
    ),
    ChatMessage(
        text: "Thanks",
        messageType: ChatMessageType.text,
        messageStatus: MessageStatus.viewed,
        isSender: false
    ),
  ];

  void addMessage(ChatMessage message){
    chatMessages.add(message);
    notifyListeners();
  }
  List<ChatMessage> get getMessageList => chatMessages;
}