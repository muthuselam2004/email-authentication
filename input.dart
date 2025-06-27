import 'package:emailauth/Google.dart';
import 'package:emailauth/Signup.dart';
import 'package:emailauth/auth.dart';
import 'package:emailauth/dash.dart';
import 'package:emailauth/output.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'Login.dart';
import 'list.dart';



class input extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<input> {
  @override
  var user=FirebaseAuth.instance.currentUser;

  @override
  void initState() {
    Future.delayed(Duration(seconds: 4),(){
      if(user!=null)
      {
       Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Bottom()));
      }
      else
      {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (builder)=>Login()));
      }
    });
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Google Account ',
          style: TextStyle(fontSize: 45,color: Colors.cyan,fontWeight: FontWeight.bold,),
        ),
      ),
    );
  }
}
