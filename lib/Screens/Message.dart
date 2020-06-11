import 'package:flutter/material.dart';
import 'package:invest/modals/message.dart';
import 'package:invest/modals/constrains.dart';

class Message extends StatefulWidget {
  @override
  _MessageState createState() => _MessageState();
}
Constrains constrain = Constrains();
class _MessageState extends State<Message> {

  final List<MessageList> chatListItem = [
    MessageList(
        name : "Johny Sins",
        lastMessage: "Good Bye",
        time: "15.05.2000",
        image: "https://i.imgur.com/BoN9kdC.png"
    ),
    MessageList(
        name : "Johny Sins",
        lastMessage: "Good Bye",
        time: "15.05.2000",
        image: "https://i.imgur.com/BoN9kdC.png"
    ),
    MessageList(
        name : "Johny Sins",
        lastMessage: "Good Bye",
        time: "15.05.2000",
        image: "https://i.imgur.com/BoN9kdC.png"
    ),
    MessageList(
        name : "Johny Sins",
        lastMessage: "Good Bye",
        time: "15.05.2000",
        image: "https://i.imgur.com/BoN9kdC.png"
    ),
    MessageList(
        name : "Johny Sins",
        lastMessage: "Good Bye",
        time: "15.05.2000",
        image: "https://i.imgur.com/BoN9kdC.png"
    ),
    MessageList(
        name : "Johny Sins",
        lastMessage: "Good Bye",
        time: "15.05.2000",
        image: "https://i.imgur.com/BoN9kdC.png"
    ),
    MessageList(
        name : "Johny Sins",
        lastMessage: "Good Bye",
        time: "15.05.2000",
        image: "https://i.imgur.com/BoN9kdC.png"
    ),
    MessageList(
        name : "Johny Sins",
        lastMessage: "Good Bye",
        time: "15.05.2000",
        image: "https://i.imgur.com/BoN9kdC.png"
    ),
    MessageList(
        name : "Johny Sins",
        lastMessage: "Good Bye",
        time: "15.05.2000",
        image: "https://i.imgur.com/BoN9kdC.png"
    ),
    MessageList(
        name : "Johny Sins",
        lastMessage: "Good Bye",
        time: "15.05.2000",
        image: "https://i.imgur.com/BoN9kdC.png"
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        title: Text("Message",style: constrain.cardTitle,),
      ),
      body: ListView.separated(
      itemCount: chatListItem.length,
      separatorBuilder: (context , i ){
        return Divider();
      },
      itemBuilder: (ctx , i ){
        return ListTile(
          title: Text(chatListItem[i].name),
          subtitle: Text(chatListItem[i].lastMessage),
          trailing: Text(chatListItem[i].time),
          leading: Container(
            width: 60,
            height: 80,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: new DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(
                        chatListItem[i].image
                    ))
            ),
          ),
        );
      },
    ),
    );
  }
}
