import 'package:flutter/material.dart';
import 'package:invest/Screens/Profile.dart';
final Color appbarColor = Color(0xff050296);
final TextStyle textStyle = TextStyle(fontSize: 25);
final TextStyle btntextStyle = TextStyle(fontSize: 25,color: Colors.white);
class Verification extends StatefulWidget {
  @override
  _VerificationState createState() => _VerificationState();
}

class _VerificationState extends State<Verification> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appbarColor,
        leading: IconButton(
          onPressed: (){},
          icon: Icon(Icons.arrow_back_ios,color: Colors.white),
        ),
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Container(
              child: Text("Verification code has been sent to Your Phone messanger",style: textStyle,),
            ),
          ),
          SizedBox(
            height: 100.0,
          ),
          Container(
            padding: EdgeInsets.only(left: 20),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey
              )
            ),
            child: TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Verification Code"
              ),
            ),
          ),
          SizedBox(
            height: 300,
          ),
          MaterialButton(
            minWidth: 400,
            height: 50,
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(
                builder: (context) => Profile()
              ));
            },
            child: Text("Next step",style: btntextStyle,),
            color: Colors.blue,
          )
        ],
      ),
    );
  }
}