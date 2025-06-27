import 'package:emailauth/Login.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';


class Dash
    extends StatefulWidget {
  const Dash({super.key});

  @override
  State<Dash> createState() => _DashState();
}

class _DashState extends State<Dash> {

  var user = FirebaseAuth.instance.currentUser;


  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        title: Text("Dash"),
      ),
      body: Column(
        children: [
          SizedBox(height: 30,),
          ElevatedButton(style: ElevatedButton.styleFrom(
    backgroundColor: Colors.cyanAccent),
    onPressed: ()async
    {
        await FirebaseAuth.instance.signOut();
        Navigator.pushAndRemoveUntil(
            context, MaterialPageRoute(builder: (context)=>Login()), (route){
              return false;
    });

          }, child: Text("Sign out"))
        ],
      ),
    );
  }
}
