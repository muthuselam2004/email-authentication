import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'main.dart';

class lists extends StatefulWidget {
  const lists({super.key});

  @override
  State<lists> createState() => _listsState();
}


class _listsState extends State<lists> {
  final _formKey = GlobalKey<FormState>();
  final FocusNode phoneFocus = FocusNode();

  List<String> items = [];

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final phoneController = TextEditingController();
  final editController = TextEditingController();

  @override
  void initState() {
    super.initState();
    loadItems();
  }

  void addItem() {
    final name = nameController.text;
    final email = emailController.text;
    final password = passwordController.text;
    final phone = phoneController.text;

    items.add("Name: $name\nEmail: $email\nPassword: $password\nPhone: $phone");
    saveItems();
    clearControllers();
    setState(() {});
  }

  void saveItems() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('items', items);
  }

  void loadItems() async {
    final prefs = await SharedPreferences.getInstance();
    items = prefs.getStringList('items') ?? [];
    setState(() {});
  }

  void clearControllers() {
    nameController.clear();
    emailController.clear();
    passwordController.clear();
    phoneController.clear();
  }

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    var provider = Provider.of<inputt>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellowAccent,
        title: const Center(
          child: Text(
            "HomePage",
            style: TextStyle(
              color: Colors.black,
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            if (user != null)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(user.email ?? '', style: const TextStyle(fontSize: 16)),
              ),
            Container(
              child: SizedBox(
                height: 500,
                width: 400,
                child: ListView.builder(
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    return Card(
                      margin: const EdgeInsets.all(8),
                      child: ListTile(
                        title: Text(items[index]),
                        tileColor: Colors.cyan,
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.edit, color: Colors.black),
                              onPressed: () {
                                editController.text = items[index];
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: const Text("Edit Item"),
                                      content: TextField(
                                        controller: editController,
                                        maxLines: 5,
                                      ),
                                      actions: [
                                        ElevatedButton(
                                          onPressed: () {
                                            setState(() {
                                              items[index] = editController.text;
                                              saveItems();
                                            });
                                            Navigator.pop(context);
                                          },
                                          child: const Text("Update"),
                                        )
                                      ],
                                    );
                                  },
                                );
                              },
                            ),
                            IconButton(
                              icon: const Icon(Icons.delete, color: Colors.black),
                              onPressed: () {
                                setState(() {
                                  items.removeAt(index);
                                  saveItems();
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,
        child: const Icon(Icons.edit, color: Colors.yellow),
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text("Add New Entry"),
                content: SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: nameController,
                          decoration: const InputDecoration(
                            hintText: "Name",
                            prefixIcon: Icon(Icons.person),
                            border: OutlineInputBorder(),
                          ),
                          validator: (value) =>
                          value == null || value.isEmpty ? "Enter a valid name" : null,
                        ),
                        const SizedBox(height: 10),
                        TextFormField(
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: const InputDecoration(
                            hintText: "Email",
                            prefixIcon: Icon(Icons.email),
                            border: OutlineInputBorder(),
                          ),
                          validator: (value) =>
                          !RegExp(r"^[\w-.]+@([\w-]+\.)+[\w-]{2,4}").hasMatch(value ?? '')
                              ? "Enter a valid email"
                              : null,
                        ),
                        const SizedBox(height: 10),
                        TextFormField(
                          controller: passwordController,
                          decoration: const InputDecoration(
                            hintText: "Password",
                            prefixIcon: Icon(Icons.lock),
                            border: OutlineInputBorder(),
                          ),
                          obscureText: true,
                          validator: (value) =>
                          !RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
                              .hasMatch(value ?? '')
                              ? "Enter a valid password"
                              : null,
                        ),
                        const SizedBox(height: 10),
                        TextFormField(
                          controller: phoneController,
                          keyboardType: TextInputType.phone,
                          focusNode: phoneFocus,
                          decoration: const InputDecoration(
                            hintText: "Mobile",
                            prefixIcon: Icon(Icons.phone),
                            border: OutlineInputBorder(),
                          ),
                          onChanged: (val) {
                            if (val.length == 10) phoneFocus.unfocus();
                          },
                          validator: (value) =>
                          !RegExp(r'^(?:[+0]9)?[0-9]{10,12}$').hasMatch(value ?? '')
                              ? "Enter a valid mobile number"
                              : null,
                        ),
                      ],
                    ),
                  ),
                ),
                actions: [
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        addItem();
                        Navigator.pop(context);
                      }
                    },
                    child: const Text("Add"),
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}