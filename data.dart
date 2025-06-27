import 'package:flutter/material.dart';

import 'counter.dart';

class sce extends StatefulWidget {
  const sce({super.key});

  @override
  State<sce> createState() => _sceState();
}

class _sceState extends State<sce> {
  int counter = 0;
  inc(){
    setState(() {
      counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          src(data: "$counter"),
          str(inc:inc),
        ],
      ),
    );
  }
}
