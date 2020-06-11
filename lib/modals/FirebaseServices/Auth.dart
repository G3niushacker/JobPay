import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:invest/Screens/Profile.dart';
import 'package:invest/Screens/SignUp.dart';


final FirebaseAuth  firebaseAuth = FirebaseAuth.instance;

class Auth{
  authHandle(){
    return StreamBuilder(
      stream: FirebaseAuth.instance.onAuthStateChanged,
      builder: (BuildContext context, snapshot){
        if(snapshot.hasData){
          return Profile();
        } 
        else{
          return SignUp();
        }
      },
    );
  }

  Future<String> getCurrentId() async{
    return (await firebaseAuth.currentUser()).uid;
  }
  Future getCurrentUser() async {
    return await firebaseAuth.currentUser();
  }
  resetPassword(String email) async{
    await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
  }


  signOut(){
    FirebaseAuth.instance.signOut();
  }
  signIn(AuthCredential authCredential){
    FirebaseAuth.instance.signInWithCredential(authCredential);
  }
}