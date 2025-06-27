import 'package:emailauth/list.dart';
import 'package:emailauth/output.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'Signup.dart';
import 'auth.dart';
import 'dash.dart';
import 'input.dart';


class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  TextEditingController email=TextEditingController();
  TextEditingController password=TextEditingController();


  final GoogleSignIn  googleSignIn = GoogleSignIn(
    clientId:
    "558499934023-4ultmmlecruelcnac023ei9pik175n0j.apps.googleusercontent.com",
  );

  Future<User?> signInWithGoogle(BuildContext context) async {
    FirebaseAuth _auth = FirebaseAuth.instance;
    try {
      UserCredential userCredential;
      if (kIsWeb) {
        var googleProvider = GoogleAuthProvider();
        userCredential = await _auth.signInWithPopup(googleProvider);
      } else
      {
        GoogleSignInAccount googleUser = (await GoogleSignIn().signIn())!;
        final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;
        final googleAuthCredential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );
        userCredential = await _auth.signInWithCredential(googleAuthCredential);
      }
      final user = userCredential.user;
      if (user != null) {

        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
            builder: (context)=>Bottom()),(route)
        {
          return false;
        });

      }
    } catch (e) {
      print(e);
    }
  }






  Future<void> Log()async{
    try{
      setState(() {

      });
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email.text,
          password: password.text);
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Bottom()));
    }
    catch(e){
      Fluttertoast.showToast(msg: "$e");
    }
  }

  bool pass=true;
  bool a=false;


  qw()
  {
    setState(() {
      if(email.text.isNotEmpty && password.text.isNotEmpty)
      {
        a=true;
      }
      else
      {
        a=false;
      }
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Center(child: Text("Login",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: email,
              decoration: InputDecoration(
                  hintText: "Email",
                  prefixIcon: Icon(Icons.person),
                  border: OutlineInputBorder()
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              keyboardType: TextInputType.name,
              obscureText: pass,
              controller: password,
              onChanged: (i)
              {
                qw();
              },
              validator: (input)
              {
                if(!RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$').hasMatch(input!))
                {
                  return "pls enter a valid password";
                }
              },
              decoration: InputDecoration(
                  hintText: "Password",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.password),
                  suffixIcon: IconButton(onPressed: ()
                  {
                    setState(() {
                      pass=!pass;
                    });
                  }, icon: Icon(Icons.remove_red_eye))
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(onPressed: ()
            {
              Log();
            },style: ElevatedButton.styleFrom(backgroundColor: Colors.lightBlue,foregroundColor: Colors.yellowAccent),
                child: Text("Login",style: TextStyle(color: Colors.black),)),
          ),
          ElevatedButton(onPressed: ()
          {
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Signup()));
          },style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red,
            foregroundColor: Colors.red,
          ),

              child: Text("SignIn",style: TextStyle(color: Colors.yellowAccent),)),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Colors.green,foregroundColor: Colors.cyan),
                onPressed: ()
                {
                  signInWithGoogle(context);
                },
                child: Row(
                  children: [

                    Container(
                      height: 45,
                      width: 45,
                      child: Image(image: AssetImage("assets/images.jpg"),fit: BoxFit.fill,),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("SignIn with Google",style: TextStyle(color: Colors.yellowAccent),),
                    ),

                  ],
                )),
          ),

        ],
      ),
    );
  }
}