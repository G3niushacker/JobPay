import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:invest/Screens/HomePage.dart';
import 'package:invest/Screens/SignIn.dart';
import 'package:invest/Screens/BottomNavBar.dart';
import 'package:invest/modals/FirebaseServices/Auth.dart';
import 'package:invest/modals/constrains.dart';
import 'package:invest/modals/helperFunction.dart';
import 'package:firebase_auth/firebase_auth.dart';
class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}
Constrains constrains = Constrains();
HelperFunction helperFunction = HelperFunction();
FirebaseAuth firebase = FirebaseAuth.instance;
Auth auth = Auth();
class _SplashScreenState extends State<SplashScreen> {

  bool isLoggedIn = false;

  conditonchk() {
    Timer(Duration(seconds: 3),()async {
      await HelperFunction.getUserLoggedInSharedPrefrence().then((value) {
        setState(() {
          isLoggedIn = value;
        });
      });
      if(isLoggedIn == true){
        Navigator.pushReplacement(context, MaterialPageRoute(
          builder: (context) => BottomNavBar()
        ));
      }else{
        Navigator.pushReplacement(context, MaterialPageRoute(
          builder: (context) => SignIn()
        ));
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    conditonchk();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: constrains.appbarColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(Icons.work,size: 80.0,color: Colors.white,),
            SizedBox(height: 10,),
            Text("Jobpay",style: constrains.btntextStyle,),
          ],
        ),
      ),
    );
  }
}
