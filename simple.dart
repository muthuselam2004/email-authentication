import 'package:emailauth/output.dart';
import 'package:flutter/material.dart';


class pnk extends StatefulWidget {
  String a;
  pnk({super.key,required this.a});

  @override
  State<pnk> createState() => _indexState();
}

class _indexState extends State<pnk> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context)=>Bottom()));
        }, icon: Icon(Icons.arrow_back)),
    ),
      body:Center(child: Text(widget.a,style: TextStyle(color: Colors.red,fontSize: 20),)));
  }
}
