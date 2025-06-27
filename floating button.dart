import 'package:emailauth/simple.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class float extends StatefulWidget {
  const float({super.key});

  @override
  State<float> createState() => _floatState();
}

class _floatState extends State<float> {

  final FocusNode mob = FocusNode();
  final FocusNode name = FocusNode();
  final FocusNode email = FocusNode();
  final FocusNode pass = FocusNode();


  final _key=GlobalKey<FormState>();


  TextEditingController ctr=TextEditingController();
  TextEditingController ctr1=TextEditingController();
  TextEditingController ctr2=TextEditingController();
  TextEditingController ctr3=TextEditingController();
  TextEditingController ctr4=TextEditingController();



  List <String>items=[];


  void additem()
  {
    String a=ctr.text;
    String b=ctr2.text;
    String c=ctr3.text;
    String d=ctr4.text;

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
    Navigator.push(context, MaterialPageRoute(builder: (context)=>pnk(a: data))).
    then((edit)
    {
      setState(() {
        items[items.indexWhere((element)=>element==data)]=edit;
      });
    });
  }

  void ShowAddDialog(){
    showDialog(context: context,
        builder: (context)=>AlertDialog(
          title: Text("Enter Details"),
          content: SingleChildScrollView(
              child: Form(
                key: _key,
                child: Column(
                    children: [
                // Text(user!.email.toString(),),
                Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                    controller: ctr1,
                    focusNode: name,
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
                    onChanged: (value) {
                      if (value.length == 15) {
                        name.unfocus(); // Hide the keyboard
                      }
                    }
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                    controller: ctr2,
                    focusNode: email,

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
                    onChanged: (value) {
                      if (value.length == 25) {
                        email.unfocus(); // Hide the keyboard
                      }
                    }
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                    keyboardType: TextInputType.name,
                    controller: ctr3,
                    focusNode: pass,

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
                    onChanged: (value) {
                      if (value.length == 12) {
                        pass.unfocus(); // Hide the keyboard
                      }
                    }
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                    controller: ctr4,
                    focusNode: mob,

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
                    onChanged: (value) {
                      if (value.length == 10) {
                        mob.unfocus(); // Hide the keyboard
                      }
                    }
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(onPressed: ()
                {
                  if(_key.currentState!.validate())
                  {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Ok valid")));
                  }
                  additem();
                  list();
                },
                    child: Text("CRUD")),
              ),
                    ]
        )
    )
          ),
        )
    );
  }







  void _onFabPressed() {
    print("Regular FAB Pressed!");
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Main Page'),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: ShowAddDialog,
            child: Icon(Icons.add,size: 30,color: Colors.black,),
            tooltip: 'Add',
            heroTag: 'fab1',
          ),
          SizedBox(height: 16),
        ],
      ),
    );
  }
}
