
import 'package:emailauth/list.dart';
import 'package:emailauth/me.dart';
import 'package:emailauth/output.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'data.dart';
import 'dialog.dart';
import 'firebase_options.dart';
import 'input.dart';




Future<void> main() async{

  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(ChangeNotifierProvider(create: (BuildContext context)=>inputt(),
      child: const MyApp()));
}


class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    Provider.of<inputt>(context,listen: false).load();
    super.initState();
  }

  @override

  Widget build(BuildContext context) {

    var provider = Provider.of<inputt>(context);



    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme:provider.show?ThemeData.dark():ThemeData.light(),
        home: sce()
    );
  }
}

class inputt extends ChangeNotifier {

  bool show = true;

  void bol({required bool mode}) async
  {
    show = mode;

    final SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setBool('repeat', show);
    notifyListeners();
  }

  Future<void> load() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    show = prefs.getBool('repeat')! ?? true;

    notifyListeners();
  }
}