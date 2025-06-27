import 'package:emailauth/simple.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'main.dart';

class crud extends StatefulWidget {
  const crud({super.key});

  @override
  State<crud> createState() => _crudState();
}

class _crudState extends State<crud> {

  final  FocusNode phone=FocusNode();

  final _focusNode=FocusNode();

  List <String>items=[];



  final _key=GlobalKey<FormState>();

  TextEditingController ctr=TextEditingController();
  TextEditingController ctr3=TextEditingController();
  TextEditingController ctr4=TextEditingController();
  TextEditingController ctr5=TextEditingController();
  TextEditingController ctr2=TextEditingController();


  void additem()
  {
    String a=ctr3.text;
    String b=ctr4.text;
    String c=ctr5.text;
    String d=ctr.text;

    items.add("$a\n$b\n$c\n$d");
    setState(() {

    });
  }


  void list()async{

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('items',items);

    setState(() {
      items;
    });
  }

  Future<void>load()async
  {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    items = await prefs.getStringList('items')! ?? [];

    setState(() {

    });
  }

  @override
  void initState() {
    load();
    super.initState();
  }



  route(String data){
    setState(() {

    });
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>pnk(a: data))).
    then((edit)
    {
      setState(() {
        items[items.indexWhere((element)=>element==data)]=edit;
      });
    });
  }

  var user=FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {

    var provider=Provider.of<inputt>(context);

    return
      GestureDetector(
        onTap: ()
        {
          _focusNode.unfocus();
        },
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.yellowAccent,
            title: Center(child: Text("HomePage",style: TextStyle(color: Colors.black,fontSize: 25,fontWeight: FontWeight.bold),)),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [


                Text(user!.email.toString(),),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                      height: 500,
                      width: 400,
                      child: ListView.builder(
                        itemCount: items.length,
                        itemBuilder: (BuildContext,index)
                        {
                          return GestureDetector(
                            onTap: ()
                            {
                              route(items[index]);
                            },
                            child: Column(
                              children: [
                                Container(
                                  height: 200,
                                  width: 600,
                                  decoration: BoxDecoration(
                                      color: Colors.cyanAccent,
                                  ),child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(items[index],style: TextStyle(color: Colors.black),),
                                    ),
                                    IconButton(onPressed: ()
                                    {
                                      showDialog(context: (context), builder: (BuildContext)
                                      {
                                        return AlertDialog(
                                          title: TextFormField(controller: ctr2,),
                                          actions: [
                                            ElevatedButton(onPressed: ()
                                            {
                                              setState(() {
                                                items[index]=ctr2.text;
                                                Navigator.pop(context);
                                              });
                                            }, child: Text("Update"))
                                          ],
                                        );
                                      });
                                    }, icon: Icon(Icons.add,color: Colors.black,)),
                                    IconButton(onPressed: ()
                                    {
                                      setState(() {
                                        items.removeAt(index);
                                      });
                                    }, icon: Icon(Icons.delete,color: Colors.black,))
                                  ],
                                ),
                                )
                              ],
                            ),
                          );
                        },
                      )),
                ),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(

              child: Icon(Icons.edit,color: Colors.yellow,),
              onPressed: ()
              {
                showDialog(context: (context), builder: (BuildContext context)
                {
                  return AlertDialog(

                    actions: [
                      SingleChildScrollView(
                        child: Form(
                          key: _key,
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextFormField(
                                  focusNode: _focusNode,
                                  controller: ctr,
                                  keyboardType: TextInputType.name,
                                  validator: (input)
                                  {
                                    if(input==null || input.isEmpty)
                                    {
                                      return "Please enter the valid name";
                                    }
                                  },
                                  decoration: InputDecoration(
                                      hintText: "Name",
                                      prefixIcon: Icon(Icons.person),
                                      border: OutlineInputBorder()
                                  ),

                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextFormField(

                                  controller: ctr3,

                                  keyboardType: TextInputType.emailAddress,
                                  validator: (input)
                                  {
                                    if(!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(input!))
                                    {
                                      return "please enter the valid EmailId";
                                    }
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
                                  controller: ctr4,

                                  validator: (input)
                                  {
                                    if(!RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$').hasMatch(input!))
                                    {
                                      return "please enter the valid password";
                                    }
                                  },

                                  decoration: InputDecoration(
                                      hintText: "Password",
                                      prefixIcon: Icon(Icons.password),
                                      border: OutlineInputBorder()
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextFormField(
                                    focusNode: phone,
                                    controller: ctr5,

                                    keyboardType: TextInputType.number,
                                    validator: (input)
                                    {
                                      if(!RegExp( r'(^(?:[+0]9)?[0-9]{10,12}$)').hasMatch(input!))
                                      {
                                        return "Please enter the valid mobile number";

                                      }
                                    },
                                    decoration: InputDecoration(
                                        hintText: "Mobile",
                                        prefixIcon: Icon(Icons.phone_android),
                                        border: OutlineInputBorder()
                                    ),
                                    onChanged: (value){
                                      if(value.length == 10){
                                        phone.unfocus();

                                      }
                                    }
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Tooltip(message: "I am a Tooltip",
                                  child: ElevatedButton(onPressed: ()
                                  {
                                    if(_key.currentState!.validate())
                                    {
                                      Navigator.pop(context);
                                      additem();
                                    }
                                    list();
                                  },
                                      child: Text("CRUD")),
                                ),
                              ),

                            ],
                          ),
                        ),
                      )
                    ],
                  );
                });
              },backgroundColor: Colors.red,
              ),


        ),

      );
  }
}