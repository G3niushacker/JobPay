import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:invest/Screens/SignUp.dart';
import 'package:invest/modals/FirebaseServices/Auth.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}
Auth auth = Auth();

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Center(
        child: Text("Prfolie"),
      )
    );
  }
}