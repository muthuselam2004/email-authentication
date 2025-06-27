
import 'package:emailauth/output.dart';
import 'package:emailauth/sign.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';


class gog extends StatefulWidget {
  const gog({super.key});

  @override
  State<gog> createState() => _gogState();
}

class _gogState extends State<gog> {

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();



  Future<void> loginn() async
  {


    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email.text,
        password: password.text
    );

    Navigator.push(context, MaterialPageRoute(builder: (context)=>Bottom()));

    setState(() {});

  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Google",style: TextStyle(color: Colors.black,fontSize: 30,fontWeight: FontWeight.bold),),),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: email,
              decoration: InputDecoration(
                hintText: "Enter the Email",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: password,
              decoration: InputDecoration(
                hintText: "Enter the Password",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                )
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(onPressed: (){
              loginn();
            }, child: Text("LOGIN",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),)),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Sign()));

            }, child: Text("Signup",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),)),
          ),

        ],
      ),
    );
  }
}
