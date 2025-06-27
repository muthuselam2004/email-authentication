import 'package:emailauth/dash.dart';
import 'package:emailauth/image.dart';
import 'package:emailauth/list.dart';
import 'package:emailauth/me.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'main.dart';


class Bottom extends StatefulWidget {
  const Bottom({super.key});

  @override
  State<Bottom> createState() => _BottomState();
}

class _BottomState extends State<Bottom> {

  int _index=0;

  final bot=[
    lists(),
    Pickers()
  ];

  void navi(index)
  {
    setState(() {
      _index=index;
    });
  }

  @override
  Widget build(BuildContext context) {

    var themeProvider = Provider.of<inputt>(context);
    return Scaffold(
      body: bot[_index],
      bottomNavigationBar: BottomNavigationBar(
        items: [BottomNavigationBarItem(icon: Icon(Icons.home,color: Colors.cyan,),label: "Home",),
          BottomNavigationBarItem(icon: Icon(Icons.person,color: Colors.cyan,),label: "Profile"),

        ],
        currentIndex: _index,
        onTap: navi,
      ),

    );
  }
}
