import 'package:flutter/material.dart';
import 'package:helloworld/login.dart';
import 'package:helloworld/signup.dart';

class LoginOrRegisterPage extends StatefulWidget {
  const LoginOrRegisterPage({super.key});

  @override
  State<LoginOrRegisterPage> createState() => _LoginOrRegisterPageState();
}

class _LoginOrRegisterPageState extends State<LoginOrRegisterPage> {
  //initially show loginpage
  bool showLogin = true;

  void togglePages() {
    setState(() {
      showLogin = !showLogin;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLogin) {
      return Login(
        onTap: togglePages,
      );
    } else {
      return Signup(
        onTap: togglePages,
      );
    }
  }
}
