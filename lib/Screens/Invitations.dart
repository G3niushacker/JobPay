import 'package:flutter/material.dart';
import 'package:invest/modals/constrains.dart';
import 'package:invest/modals/constrains.dart';
class Invitations extends StatefulWidget {
  @override
  _InvitationsState createState() => _InvitationsState();
}
Constrains constrain = Constrains();
class _InvitationsState extends State<Invitations> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        title: Text("Invitaions",style: constrain.cardTitle,),
      ),
      body: Center(
        child: Text("This Will Come Soon",style: constrain.cardTitle,),
      ),
    );
  }
}