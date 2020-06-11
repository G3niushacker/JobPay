import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:invest/Screens/Invitations.dart';
import 'package:invest/Screens/JobFeeds.dart';
import 'package:invest/Screens/Message.dart';
import 'package:invest/Screens/Profile.dart';
import 'package:invest/modals/constrains.dart';
import 'package:invest/modals/message.dart';
class HomePPage extends StatefulWidget {
  @override
  _HomePPageState createState() => _HomePPageState();
}
Constrains constrain = Constrains();
class _HomePPageState extends State<HomePPage> {
 
  bool jobFeeds = false;
  bool message = false;
  bool myProfile = false;
  bool invitation = false;




   Widget messgaeView(){

}

  @override
  Widget build(BuildContext context) {
    return Scaffold(

    );
  }
}

Widget jobFeedData(){
  return Column(
          children: <Widget>[
],
        );
}

