import 'package:flutter/material.dart';

class str extends StatelessWidget {
  void Function() inc;
   str({super.key,required this.inc});

  @override
  Widget build(BuildContext context) {
    return  Expanded(
      flex: 1,
        child: Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.yellowAccent,
          child: OutlinedButton(onPressed: inc, child: Text("add",style: TextStyle(color: Colors.black,fontSize: 30),)),
        )
    );
  }
}
class src extends StatelessWidget {
  String data;
   src({super.key,required this.data});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 9,
        child: Container(
      width: double.infinity,
      color: Colors.cyan,
      child:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("$data",style: TextStyle(fontSize: 50,color: Colors.black,fontWeight: FontWeight.bold),),
        ],
      ),
    ));
  }
}

