import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_country_picker/flutter_country_picker.dart';
import 'package:invest/Screens/AcadmicInformation.dart';
import 'package:invest/Screens/HomePage.dart';
import 'package:invest/Screens/PersonalInformation.dart';
import 'package:invest/Screens/ProfessionalInformation.dart';
import 'package:invest/Screens/SignIn.dart';
import 'package:invest/modals/constrains.dart';
import 'package:invest/modals/helperFunction.dart';
import 'package:invest/modals/provider.dart';
import 'package:invest/modals/FirebaseServices/Auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';


class MyProfile extends StatefulWidget {
  @override
  _MyProfileState createState() => _MyProfileState();
}
Auth auth = Auth();
Constrains constrains = Constrains();
class _MyProfileState extends State<MyProfile> {
  String image;
  String name;
  String email;
  String phone;
  SharedPreferences sp;

  @override
  void initState() {
    initSp();
    super.initState();

  }

  initSp() {
      helperFunction.getSharedPreferences().then((value) {
      setState(() {
        sp = value;
        getInfo();
      });
    });
  }
  getInfo() async {
    name = sp.getString('USERNAMEKEY');
    email = sp.getString('USEREMAILKEY'); 
    phone = sp.getString('USERPHONEKEY');
    print('$name, $email, $phone}');
  }
   @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height / 3,
              width: MediaQuery.of(context).size.width,
              child: Card(
                elevation: 5.0,
                color: constrain.blueclr,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Row(
                      children: <Widget>[

                        Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: new DecorationImage(
                                  fit: BoxFit.fill,
                                  image: NetworkImage(
                                      "https://i.imgur.com/BoN9kdC.png"
                                  ))
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(name??'null',style: constrain.title,),
                            Text("phone",style: constrain.subTitle,),
                          ],
                        )
                      ],
                    ),
                    )
                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                MaterialButton(
                  elevation: 5.0,
                  shape: StadiumBorder(),
                  color: constrain.blueclr,
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context) => PersonalInformation()
                    ));
                  },
                  child: Text("Personal Info",style: constrain.homePagebtn,),
                ),
                MaterialButton(
                  shape: StadiumBorder(),
                  elevation: 5.0,
                  color: constrain.blueclr,
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context) => AcadmicInformation()
                    ));
                  },
                  child: Text("Academic Info",style: constrain.homePagebtn,),
                ),
                MaterialButton(
                  shape: StadiumBorder(),
                  elevation: 5.0,
                  color: constrain.blueclr,
                  onPressed: (){
                    Navigator.pushReplacement(context, MaterialPageRoute(
                      builder: (context) => ProfessionalInformation()
                    ));
                  },
                  child: Text("Professional Info",style: constrain.homePagebtn,),
                ),

              ],
            ),
            ListTile(
              title: Text(email??'null'),
              trailing: Icon(Icons.edit),
            ),
            ListTile(
              title: Text(phone??"null"),
              trailing: Icon(Icons.edit),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: constrains.blueclr,
        onPressed: (){
          auth.signOut();
          setState(() {
            HelperFunction.saveUserEmailSharedPrefrence(null);
            HelperFunction.saveUserPasswordSharedPrefrence(null);
            HelperFunction.saveUserPhoneSharedPrefrence(null);
            HelperFunction.saveUserLoggedInSharedPrefrence(false);
            HelperFunction.saveUserNameSharedPrefrence(null);
          });
          Navigator.pushReplacement(context, MaterialPageRoute(
            builder: (context) => SignIn()
          ));
        },
        child: Icon(Icons.exit_to_app),
      ),
    );
  }
}

