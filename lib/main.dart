import 'package:flutter/material.dart';
import 'package:invest/Screens/MyProfile.dart';
import 'package:invest/Screens/Profile.dart';
import 'package:invest/Screens/SignIn.dart';
import 'package:invest/Screens/SignUp.dart';
import 'package:invest/Screens/SplashScreen.dart';
import 'package:invest/Screens/BottomNavBar.dart';
import 'Screens/HomePage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jobpay',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),
    );
  }
}

