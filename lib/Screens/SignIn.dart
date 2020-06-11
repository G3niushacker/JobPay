import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:invest/Screens/ResetPassword.dart';
import 'package:invest/Screens/SignUp.dart';
import 'package:invest/modals/constrains.dart';
import 'package:invest/modals/helperFunction.dart';
import 'package:invest/Screens/BottomNavBar.dart';
import 'package:shared_preferences/shared_preferences.dart';
class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}
Constrains constrains = Constrains();
HelperFunction helperFunction = HelperFunction();
class _SignInState extends State<SignIn> {
  var email , paswd;
  String _error;
  bool isLoading = false;

  showProgress(){
    if(isLoading){
      return Center(child: CircularProgressIndicator(),);
    }else{
      return Container(height: 0.0,width: 0.0,);
    }
  }

  restPassword(String email)async{
    return FirebaseAuth.instance.sendPasswordResetEmail(email: email);
  }
  showError(){
    if(_error != null){
      return Container(
        color: Colors.yellow,
        width: double.infinity,
        padding: EdgeInsets.all(8.0),
        child: Row(
          children: <Widget>[
            Icon(Icons.error_outline,color: Colors.red,),
            SizedBox(width: 5.0,),
            Expanded(
              child: Text(_error,style: constrains.error,),
            )
          ],
        ),
      );
    }else{
      return SizedBox(
        height: 0,
      );
    }
  }
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: constrains.appbarColor,
      body: ListView(
        shrinkWrap: true,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              child: Text("Hello",style: constrains.textStyle,),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left:20.0,bottom: 12.0),
            child: Container(
              child: Text("Welcome Back! to countinue sign in with your cradentials",style: constrains.subtitle,),
            ),
          ),
         Padding(
           padding: const EdgeInsets.all(8.0),
           child: Container(
             height: MediaQuery.of(context).size.height / 1.5,
             decoration:BoxDecoration(
               borderRadius: BorderRadius.circular(20),
               color: Colors.white,
             ),
             child: Container(
               child: isLoading ? showProgress(): Form(
                 key: _globalKey,
                 child: Column(
                   children: <Widget>[
                     Row(
                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                       children: <Widget>[
                         MaterialButton(
                           onPressed: (){
                             Navigator.pushReplacement(context, MaterialPageRoute(
                               builder: (context) => SignUp()
                             ));
                           },
                           child: Text("SignUp",),
                           highlightColor: Colors.transparent,
                           hoverColor: Colors.transparent,
                         ),
                          MaterialButton(
                           onPressed: (){},
                           child: Text("Sign in",style: topbtn,),
                         )
                       ],
                     ),
                     showError(),
                     SizedBox(
                       height: 30,
                     ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                    padding: EdgeInsets.only(left: 20),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey,
                      ),
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child:TextFormField(
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Email",
                          icon: Icon(Icons.email)
                      ),
                      onSaved: (val){
                        this.email = val;
                      },
                      validator: (String value){
                        if(value.isEmpty){
                          return "Email is required";
                        }
                        if (!RegExp(
                            r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
                            .hasMatch(value)) {
                          return 'Please enter a valid email Address';
                        }
                      },
                    ),
                   ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                    padding: EdgeInsets.only(left: 20),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey,
                      ),
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: TextFormField(
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Password",
                          icon: Icon(Icons.lock)
                      ),
                      onSaved: (val){
                        this.paswd = val;
                      },
                      validator: (String value){
                        if(value.isEmpty){
                          return "Password is required";
                        }
                      },
                      obscureText: true,
                    ),
            ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("Don't Have An Account?",style: constrains.link,),
                      FlatButton(
                        onPressed: (){
                          Navigator.pushReplacement(context, MaterialPageRoute(
                               builder: (context) => SignUp()
                             ));
                        },
                        child: Text("SignUp Here",style: constrains.link,),
                      )
                    ],
                  ),
                  FlatButton(
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) => ResetPassword()
                      ));
                    },
                    child: Text("Forgot Password?",style: constrains.link,),
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    height: 70,
                    width: 70,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(100),
                      border: Border.all()
                    ),
                    child: IconButton(
                    onPressed: () async {
                      _globalKey.currentState.save();
                      if(_globalKey.currentState.validate()){
                        setState(() {
                          isLoading = true;
                        });
                        save();
                        HelperFunction.saveUserLoggedInSharedPrefrence(true);
                         await FirebaseAuth.instance.signInWithEmailAndPassword(
                            email: email,
                            password: paswd).then((firebaseUser){
                           HelperFunction.saveUserEmailSharedPrefrence(email);
                           HelperFunction.saveUserPasswordSharedPrefrence(paswd);
                           HelperFunction.saveUserLoggedInSharedPrefrence(true);
                          Navigator.pushReplacement(context, MaterialPageRoute(
                              builder: (context) => BottomNavBar()
                          ));
                        }).catchError((e){
                          setState(() {
                            _error = e.message;
                          });
                        });
                      }
                    },
                    icon: Icon(Icons.arrow_forward,size: 50,color: Colors.white,),
                  ),
                  ),
                  SizedBox(height: 0,)
                   ],
                 ),
               ),
             ),
           ),
         ),
          
        ],
      ),
    );
  }
}
 final db = Firestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseUser user;

save() async {
      user = await _auth.currentUser();
      print('$user.displayName');
    HelperFunction.saveUserNameSharedPrefrence(user.displayName);
    HelperFunction.saveUserEmailSharedPrefrence(user.email);
    HelperFunction.saveUserPhoneSharedPrefrence(user.phoneNumber);
  }
