import 'package:flutter/material.dart';
import 'package:invest/Screens/JobFeeds.dart';
import 'package:invest/Screens/Message.dart';
import 'package:invest/Screens/MyProfile.dart';
import 'package:invest/Screens/Invitations.dart';
import 'package:invest/modals/bottomNavDestination.dart';
import 'package:invest/modals/constrains.dart';
class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}
Constrains constrains = Constrains();

class _BottomNavBarState extends State<BottomNavBar> {

  int _currentIndex = 0;

  final allScreensDestination = [
    JobFeeds(),
    Message(),
    MyProfile(),
    Invitations(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: false,
        child: IndexedStack(
          index: _currentIndex,
          children: allScreensDestination,
        ),
      ),
        bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: _currentIndex,
            selectedItemColor: Colors.white,
            selectedLabelStyle: TextStyle(color: Colors.white),
            selectedIconTheme: IconThemeData(
                color: Colors.white
            ),
            backgroundColor: constrains.blueclr,
            onTap: (int index){
              setState(() {
                _currentIndex = index;
              });
            },
            items: allDestination.map((Destination destination){
              return BottomNavigationBarItem(
                  icon : Icon(destination.icon,color: constrains.bottomNavBarIcon),
                  backgroundColor: Colors.white,
                  title: Text(destination.title,style: constrains.bottomnavbartitle,)
              );
            }).toList()
        ),
    );
  }
}
