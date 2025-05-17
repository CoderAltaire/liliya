
import 'package:com.example.liliya/view/login/help_us_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../view/login/failed_auth_view.dart';

class AuthService {
  AuthService._();
  static AuthService instance = AuthService._();
  static final _auth = FirebaseAuth.instance;
  Future<User?> signUpUser(

BuildContext context,
      String email,
      String password,
      ) async {
    try {
      var authResult = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);

      User? user = authResult.user;
      debugPrint(user.toString());
      if(user!= null){
        Navigator.push(context, MaterialPageRoute(builder: (context) => HelpUsView(),));
      }


      return user;

    } catch (e) {
      Navigator.push(context, MaterialPageRoute(builder: (context) => ErrorScreen(),));
      print(e);
    }
    return null;
  }
  Future<User?> signInUser(

      BuildContext context,
      String email,
      String password,
      ) async {
    try {
      var authResult = await _auth.signInWithEmailAndPassword(
          email: email, password: password);

      User? user = authResult.user;
      debugPrint(user.toString());
      if(user != null){
        print('if da sing up');
        Navigator.push(context, MaterialPageRoute(builder: (context) => HelpUsView(),));
      }




      return user;

    } catch (e) {   Navigator.push(context, MaterialPageRoute(builder: (context) => ErrorScreen(),));
      print(e);
    }
    return null;
  }


  Future<void> signInUserWithPhone(
      BuildContext context,
      String phoneNumber,
      String smsCode,
      ) async {
    try {
      var authResult = await _auth.signInWithPhoneNumber(
          phoneNumber);


    print(authResult.toString());

      if (authResult != null) {

      }

    } catch (e) {

      print(e);
    }
    return null;
  }


  static Future<Firebase?> signOut(
      BuildContext context,
      ) async {
    _auth.signOut();

    return null;
  }
}