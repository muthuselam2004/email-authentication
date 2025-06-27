import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';


class Sign extends StatefulWidget {
  const Sign({super.key});

  @override
  State<Sign> createState() => _SignupState();
}

class _SignupState extends State<Sign> {


  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();


  Future<void> create() async
  {

    await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email.text,
      password: password.text,
    );

    setState(() {

    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Signup with Google"),),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(controller: email,
              decoration: InputDecoration(
                hintText: "Enter the name",
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(controller: password,
              decoration: InputDecoration(
                hintText: "Enter the new password",
                border: OutlineInputBorder(),
              ),
            ),
          ),
          SizedBox(height: 30,),
          OutlinedButton(onPressed: (){
            create();
          }, child: Text("create")),

        ],
      ),
    );
  }
}
