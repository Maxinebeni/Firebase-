import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final controller;
  final bool obscureText;

  const MyTextField(
      {super.key, required this.controller, required this.obscureText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 60.0),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        decoration: const InputDecoration(
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color.fromARGB(255, 91, 95, 99))),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Color.fromRGBO(80, 165, 112, 100),
              ),
            ),
            fillColor: Color.fromRGBO(135, 170, 200, 1),
            filled: true),
      ),
    );
  }
}
