import 'dart:io';

import 'package:emailauth/Login.dart';
import 'package:emailauth/main.dart';
import 'package:emailauth/state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';


class Pickers extends StatefulWidget {
  const Pickers({super.key});

  @override
  State<Pickers> createState() => _PickersState();
}

class _PickersState extends State<Pickers> {

  bool show=true;


  File? _image;

  final ImagePicker pick=ImagePicker();

  @override
  void initState() {
    super.initState();
    _loadTheme();
  }

  Future<void> _loadTheme() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      show = prefs.getBool('isDarkMode') ?? true;
    });
  }

  Future<void> _saveTheme(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isDarkMode', value);
  }





  Future<void> photos()async{
    final XFile? pickedImage=
    await pick.pickImage(source: ImageSource.gallery);
    if(pickedImage!=null)
    {
      setState(() {
        _image=File(pickedImage.path);

      });
    }
  }

  Future<void> camera()async{
    final XFile? pickedImage=
    await pick.pickImage(source: ImageSource.camera);
    if(pickedImage!=null)
    {
      setState(() {
        _image=File(pickedImage.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<inputt>(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: show ? ThemeData.dark():ThemeData.light(),
      home: Scaffold(
        appBar: AppBar(
          title: Center(child: Text("Profile",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),)),
          backgroundColor: Colors.yellow,
          actions: [
            Switch(
              value: themeProvider.show,
              onChanged: (value) {

                setState(() {
                  show = value;
                  themeProvider.bol(mode: show);
                });
                _saveTheme(value);
              },
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(onPressed: ()
                {
                  photos();
                },style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.black,
                  backgroundColor: Colors.yellowAccent,
                ),
                    child: Text("Select an image")),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(onPressed: ()
                {
                  camera();
                },style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.cyanAccent,
                  foregroundColor: Colors.black,
                ),
                    child: Text("Upload from camera")),
              ),
              SizedBox(height: 30,),
              Container(
                height: 500,
                width: 400,
                child: _image!=null
                    ?Image.file(_image!,fit: BoxFit.fill,)
                    :Center(child: Text("Please Upload image",style: TextStyle(color: Colors.yellowAccent,fontSize: 20,fontWeight: FontWeight.bold),)),
              ),Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(onPressed: ()async
                {
                  await FirebaseAuth.instance.signOut();
          
                  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>Login()),(route)
                  {
                    return false;
                  });
                },style: ElevatedButton.styleFrom(backgroundColor: Colors.red,foregroundColor: Colors.red),
                    child: Text("SignOut",style: TextStyle(color: Colors.black),)),
              )
            ],
          ),
        ),
      ),
    );


  }
}
