import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:invest/Screens/SignIn.dart';
import 'package:invest/modals/FirebaseServices/Auth.dart';
import 'package:invest/modals/constrains.dart';
class ResetPassword extends StatefulWidget {
  @override
  _ResetPasswordState createState() => _ResetPasswordState();
}
Constrains constrains = Constrains();
final TextStyle textStyle = TextStyle(fontSize: 25);

Auth auth = Auth();
GlobalKey<FormState> _key = GlobalKey<FormState>();
class _ResetPasswordState extends State<ResetPassword> {
  var email;
  bool isclicked = false;
  var _error;
  bool _mailsent = false;

  resetPassword(String email) async{
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
    }
    catch(e){
      setState(() {
        _error = e.message;
      });

    }
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: constrains.appbarColor,
      appBar: AppBar(
        title: Text("Rest Your Password"),
        backgroundColor: constrains.appbarColor,
        elevation: 0.0,
      ),
      body: Form(
        key: _key,
        child: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("We will Mail You link Please click on that link to rest Password...",style: constrains.textStyle,),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20)
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    SizedBox(height: 20,),
                    showError(),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Enter Email",style: textStyle,),
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
                    SizedBox(
                      height: 10,
                    ),
                    isclicked ?
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: MaterialButton(
                        shape: StadiumBorder(),
                        height: 40,
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) => SignIn()
                          ));
                        },
                        child: Text("Back To Login",style: constrains.textStyle,),
                        color: constrains.blueclr,
                      ),
                    ):
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: MaterialButton(
                        shape: StadiumBorder(),
                        height: 40,
                        onPressed: (){
                          _key.currentState.save();
                          if(_key.currentState.validate()){
                            resetPassword(email);
                            setState(() {
                              isclicked = true;
                              _mailsent = true;
                            });

                          }

                        },
                        child: Text("Reset",style: constrains.textStyle,),
                        color: constrains.blueclr,
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
