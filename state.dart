import 'package:emailauth/splash.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(ChangeNotifierProvider(create: (BuildContext context) =>  Themeprovider(),
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
    Provider.of<Themeprovider>(context,listen: false).load();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {

    var themeProvider = Provider.of<Themeprovider>(context);







    return MaterialApp(

      theme:themeProvider.darkmode ? ThemeData.dark() :  ThemeData.light(),

      debugShowCheckedModeBanner: false,
      home:  state(),


    );
  }
}


class Themeprovider extends ChangeNotifier
{
  bool darkmode = true;

  Future<void> update({required bool dark}) async
  {
    darkmode = dark;

    final SharedPreferences prefs = await SharedPreferences.getInstance();


    await prefs.setBool('darkmode', darkmode);

    notifyListeners();
  }

  Future<void> load() async
  {

    final SharedPreferences prefs = await SharedPreferences.getInstance();


    darkmode = await prefs.getBool('darkmode', )! ?? true;

    notifyListeners();
  }




}




class state extends StatefulWidget {
  const state({super.key});

  @override
  State<state> createState() => _stateState();
}

class _stateState extends State<state> {




  @override
  Widget build(BuildContext context) {

    var themeProvider = Provider.of<Themeprovider>(context);

    return Scaffold(
      body: Column(
        children: [

          Switch(value: themeProvider.darkmode, onChanged: (value)
          {
            themeProvider.update(dark: value);
          })

        ],
      ),
    );
  }
}