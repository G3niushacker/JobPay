import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:invest/Screens/Profile.dart';
import 'package:invest/Screens/SignIn.dart';
import 'package:invest/Screens/Verification.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:invest/modals/FirebaseServices/Auth.dart';
import 'package:invest/modals/constrains.dart';
import 'package:invest/modals/helperFunction.dart';
import 'package:invest/Screens/BottomNavBar.dart';


final Color appbarColor = Color(0xff050296);
final TextStyle textStyle = TextStyle(fontSize: 25);
final TextStyle btntextStyle = TextStyle(fontSize: 25,color: Colors.white);
final TextStyle topbtn = TextStyle(fontSize: 20,color: Colors.blue);
final TextStyle sidbtn = TextStyle(fontSize: 15,);


class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}
Constrains constrains = Constrains();
Firestore firestore = Firestore.instance;
HelperFunction helperFunction = HelperFunction();

class _SignUpState extends State<SignUp> {

 String name, email, password, confrmPassword;
 String phoneController, verificationId , signedinUser;
 bool isLoading = false;

 showProgress(){
   if(isLoading){
     return Container(
         height: MediaQuery.of(context).size.height / 1,
         child: Center(child: CircularProgressIndicator(),));
   }else{
     return Container(height: 0.0,width: 0.0,);
   }
 }

 final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: constrains.appbarColor,
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Container(
            padding: const EdgeInsets.all(20.0),
            child: Text("Welcome",style: constrains.textStyle,),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left:20.0,bottom: 12.0),
            child: Container(
            child: Text("SignUp by your details",style: constrains.subtitle,),
            ),
          ),
         Padding(
           padding: const EdgeInsets.all(8.0),
           child: Container(
             decoration:BoxDecoration(
               borderRadius: BorderRadius.circular(20),
               color: Colors.white,
             ),
             child: Form(
               key: _formkey,
               child: Column(
                 children: <Widget>[
                   Row(
                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                     children: <Widget>[
                       MaterialButton(
                         onPressed: (){},
                         child: Text("SignUp",style: topbtn,),
                         highlightColor: Colors.transparent,
                         hoverColor: Colors.transparent,
                       ),
                        MaterialButton(
                         onPressed: (){
                           Navigator.pushReplacement(context, MaterialPageRoute(
                             builder: (context) => SignIn()
                           ));
                         },
                         child: Text("Sign in"),
                       )
                     ],
                   ),
                   SizedBox(
                     height: 20,
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
                             hintText: "Name",
                             icon: Icon(Icons.lock)
                         ),
                         onSaved: (val){
                           name = val;
                         },
                         validator: (String value){
                           if(value.isEmpty){
                             return "Name is required";
                           }else{
                             return null;
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
                      hintText: "Email",
                      icon: Icon(Icons.email)
                    ),
                    onSaved: (val){
                      email = val;
                    },
                    validator: (String value){
                      if(value.isEmpty){
                        return "Email is required";
                      }
                      else if (!RegExp(
                          r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
                          .hasMatch(value)) {
                            return 'Please enter a valid email Address';
                        }else{
                        return null;
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
                      password = val;
                    },
                    validator: (String value){
                      if(value.isEmpty){
                        return "Password is required";
                      }else{
                        return null;
                      }
                    },
                    obscureText: true,
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
                             hintText: "Confirm Password",
                             icon: Icon(Icons.lock)
                         ),
                         onSaved: (val){
                           confrmPassword = val;
                         },
                         validator: (String value){
                           if(value.isEmpty){
                             return "Confirm Password is required";
                           }else if(confrmPassword != password){
                             return "Password must be match";
                           }
                           else{
                             return null;
                           }
                         },
                         obscureText: true,
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
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Phone Number",
                        icon: Icon(Icons.phone)
                    ),
                    onSaved: (val){
                      phoneController = val;
                    },
                    validator: (String value){
                      if(value.isEmpty) {
                        return "Phone is required";
                      }else{
                        return null;
                      }
                    },
                  ),
                 ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("Already Have An Account?",style: constrains.link,),
                    FlatButton(
                      onPressed: (){
                        Navigator.pushReplacement(context, MaterialPageRoute(
                             builder: (context) => SignIn()
                           ));
                      },
                      child: Text("Sign in Here",style: constrains.link,),
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
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
                  onPressed: (){
                    signinwithemail();
                    if(_formkey.currentState.validate()){
                      HelperFunction.saveUserNameSharedPrefrence(name);
                      HelperFunction.saveUserEmailSharedPrefrence(email);
                      HelperFunction.saveUserPasswordSharedPrefrence(password);
                      HelperFunction.saveUserPhoneSharedPrefrence(phoneController);
                      HelperFunction.saveUserLoggedInSharedPrefrence(true);
                    signinwithemail();
                    setState(() {
                      isLoading = true;
                    });
                    }
                    _formkey.currentState.save();
                    },
                  icon: Icon(Icons.arrow_forward,size: 50,color: Colors.white,),
                ),
                ),
                SizedBox(height: 10,)
                 ],
               ),
             ),
           ),
         ),
          
        ],
      ),
    );
  }
  Future<void> verifyPhone() async {
    final PhoneVerificationCompleted verified = (AuthCredential authresult){
      Auth().signIn(authresult);
    };
     final PhoneVerificationFailed verificField = (AuthException authException){
      print('$authException.message');
    };
    final PhoneCodeSent smsSent = (String verId, [int forcedResend]){
      this.verificationId = verId;
    };
    final PhoneCodeAutoRetrievalTimeout autotimeOut = (String verId){
      this.verificationId = verId;
    };
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: phoneController,
      timeout: Duration(seconds: 60),
      verificationCompleted: verified,
      verificationFailed: verificField, 
      codeSent: smsSent,
      codeAutoRetrievalTimeout: autotimeOut);
  }
  signinwithemail()async{
    await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email,
    password: password).then((signedInUser){
    firestore.collection('user').add({'email': email, 'password': password,'name': name,'confirmPassword': confrmPassword,'phone': phoneController}).then((value){
        if(signedInUser!= null){
          HelperFunction.saveUserLoggedInSharedPrefrence(true);
          Navigator.pushReplacement(context, MaterialPageRoute(
            builder: (context) => BottomNavBar()
          ));
        }
      }).catchError((e){
        return print(e.message);});
    });
  }
  addData(){
    Firestore.instance.collection('user').add({'name' : name, 'phone' :phoneController});
  }
}