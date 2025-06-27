import 'package:flutter/material.dart';


class phe extends StatefulWidget {
  const phe({super.key});

  @override
  State<phe> createState() => _pheState();
}

class _pheState extends State<phe> {
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      if (_controller.text.length == 10) {
        _focusNode.unfocus(); // This hides the keyboard
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Phone Number Input')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: TextField(
          controller: _controller,
          focusNode: _focusNode,
          keyboardType: TextInputType.number,
          maxLength: 10,
          decoration: InputDecoration(
            labelText: 'Enter phone number',
            counterText: '', // hide character counter
          ),
        ),
      ),
    );
  }
  }

