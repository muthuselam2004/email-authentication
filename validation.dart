import 'dart:ui';

import 'package:emailauth/input.dart';
import 'package:emailauth/splash.dart';
import 'package:flutter/material.dart';


class validate extends StatefulWidget {
  const validate({super.key});

  @override
  State<validate> createState() => _validateState();
}

class _validateState extends State<validate> {

  final key = GlobalKey<FormState>();

  bool show = false;

  TextEditingController ctrl = TextEditingController();
  TextEditingController web = TextEditingController();


  you()
  {
    setState(() {
      ctrl.text.isNotEmpty && web.text.isNotEmpty ? show = true : show = false;
    });
  }


  bool password = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: key,
        child: Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              border: Border.all(),
              image: DecorationImage(
                image: AssetImage("assets/W.jpg"),
                fit: BoxFit.fill,
              ),
            ),

            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                // crossAxisAlignment:CrossAxisAlignment.center ,
                children: [
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 400,
                        width: 350,
                        decoration: BoxDecoration(
                            color: Colors.lightBlue,
                            border: Border.all(),
                            borderRadius: BorderRadius.circular(40),
                            image: DecorationImage(
                              image: AssetImage("assets/L.jpg"),
                              fit: BoxFit.fill,
                            )
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(40),
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: BackdropFilter(
                              filter: ImageFilter.blur(sigmaX: 5.0,sigmaY: 5.0,),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: TextFormField(
                                      controller: ctrl,
                                      decoration: InputDecoration(
                                        prefixIcon: Icon(Icons.person,color: Colors.black,size: 20,),
                                        suffixIcon: Icon(Icons.mail,color: Colors.black,size: 20,),
                                        hintText: 'Enter the name',
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(10),
                                        ),
                                      ),
                                      validator: (a)
                                      {
                                        if (a == null || a.isEmpty)
                                        {

                                        }
                                        {
                                          return null;
                                        }

                                      },
                                      onChanged: (a){
                                        you();
                                      },
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: TextFormField(
                                      controller: web,
                                      obscureText: password,
                                      decoration: InputDecoration(
                                        hintText: "password",
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(10),
                                        ),
                                        prefixIcon: Icon(Icons.password,color: Colors.black,size: 20,),
                                        suffixIcon: IconButton(onPressed: ()
                                        {
                                          setState(() {
                                            password=!password;
                                          });
                                        } ,
                                            icon: Icon(Icons.remove_red_eye,color: Colors.black,size: 20,)),

                                      ),
                                      validator: (b)
                                      {
                                        if(!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(b!))
                                        {
                                          return "enter the valid password";
                                        }
                                        {
                                          return null;
                                        }

                                      },
                                      onChanged: (b){
                                        you();
                                      },

                                    ),
                                  ),

                                  Visibility(
                                    visible: show,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: ElevatedButton(onPressed: (){
                                        if(key.currentState!.validate())

                                        {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(builder:(context) => input()),
                                          );
                                        }
                                      }, child: Text("LOGIN")),
                                    ),
                                  ),

                                ],
                              ),
                            ),

                          ),
                        ),

                      ),

                    ),
                  ),
                ]
            )


        ),
      ),

    );
  }
}


