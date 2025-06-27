import 'package:emailauth/Login.dart';
import 'package:emailauth/dash.dart';
import 'package:emailauth/output.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'list.dart';


class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {

  bool pass=true;
  bool a=false;

  final _keys=GlobalKey<FormState>();

  TextEditingController email=TextEditingController();
  TextEditingController password=TextEditingController();







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


  Future<void>create()async
  {
    try{
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email.text,
          password: password.text);

      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Bottom()));
    }
    catch(e){
      Fluttertoast.showToast(msg: "$e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=>FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          leading:  IconButton(onPressed:(){
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Login()));
          }, icon: Icon(Icons.arrow_back)),
          backgroundColor: Colors.cyanAccent,
          title: Center(child: Text("Signup",style: TextStyle(color: Colors.black),)),

        ),
        body: Form(
          key: _keys,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  controller: email,
                  onChanged: (i)
                  {
                    qw();
                  },
                  validator: (input)
                  {
                    if(!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(input!))
                    {
                      return "pls give a valid email";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      hintText: "Email",
                      prefixIcon: Icon(Icons.email),
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
                child: Visibility(
                  visible: a,
                  child: ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Colors.cyanAccent),
                      onPressed: ()
                      {
                        if(_keys.currentState!.validate())
                        {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Login Successful")));
                        }
                        create();
                        }, child: Text("Signup",style: TextStyle(color: Colors.black),)),
                ),
              ),


            ],
          ),
        ),
      ),
    );
  }
}