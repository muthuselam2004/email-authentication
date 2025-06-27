import 'package:flutter/material.dart';


class the extends StatefulWidget {
  const the({super.key});

  @override
  State<the> createState() => _theState();
}

class _theState extends State<the> {

  bool isDarkMode = false;
  List<bool> isSelected = [true,false];


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: isDarkMode ? ThemeMode.dark : ThemeMode.light,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Toggle Theme"),
        ),
        body: Center(
          child: ToggleButtons(
            borderRadius: BorderRadius.circular(8),
            isSelected: isSelected,
            onPressed: (int index) {
              setState(() {
                for (int i = 0; i < isSelected.length; i++) {
                  isSelected[i] = i == index;
                }
                isDarkMode = index == 1;
               });
            },
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text("Light"),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text("Dark"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
