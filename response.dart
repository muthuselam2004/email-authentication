import 'package:flutter/material.dart';


class res extends StatefulWidget {
  const res({super.key});

  @override
  State<res> createState() => _resState();
}

class _resState extends State<res> {



  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;

    bool mobile = screenwidth < 600;

    return Scaffold(
      appBar: AppBar(
        title: Text("Responsible framework"),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                height: 210,
                width: 180,
                color: Colors.cyan,
              ),
              Container(
                height: 210,
                width: 180,
                color: Colors.yellow,
              ),
            ],
          )

        ],
      )
    );
  }
}
