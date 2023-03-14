import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import './textfield.dart';
import 'login.dart';
import '/components/button.dart';

class Signup extends StatefulWidget {
  final Function()? onTap;
  Signup({Key? key, this.onTap}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final ConfirmPasswordController = TextEditingController();

  void signUserUp() async {
    // show loading circle
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );

    try {
      if (passwordController.text == ConfirmPasswordController.text) {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        );
      } else {
        showErrorMessage("Passwords dont match");
      }

      // pop the loading circle
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      // pop the loading circle
      Navigator.pop(context);
      // WRONG EMAIL
      showErrorMessage(e.code);
    }
  }

  void showErrorMessage(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.deepPurple,
          title: Center(
            child: Text(
              message,
              style: TextStyle(color: Colors.white),
            ),
          ),
        );
      },
    );
  }

  // wrong email message popup

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,

          // The title text which will be shown on the action bar
          title: Text('MIND MATE'),
        ),
        backgroundColor: const Color.fromARGB(0xff, 0xF8, 0xF8, 0xFA),
        body: SafeArea(
            child: Center(
                child: SingleChildScrollView(
                    child: Column(children: [
          const SizedBox(height: 50),
          Image.asset('assets/images/Logo1.png', height: 80),
          const SizedBox(height: 10),
          Text('Welcome to Mind Mate! Register',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),

          //EMAIL
          const SizedBox(height: 15),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                const Text("Enter your email"),
              ])),

          const SizedBox(width: 5.0),
          MyTextfield(
            controller: emailController,
            hintText: 'email',
            obscureText: false,
          ),

          //PASSWORD
          const SizedBox(height: 8),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                Text('Enter your password'),
              ])),

          const SizedBox(width: 5.0),
          MyTextfield(
            controller: passwordController,
            hintText: 'password',
            obscureText: true,
          ),

          //CONFIRM PASSWORD
          const SizedBox(height: 8),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                Text('Confirm password'),
              ])),

          const SizedBox(
            width: 5.0,
          ),

          MyTextfield(
            controller: ConfirmPasswordController,
            hintText: 'ConfirmPassword',
            obscureText: true,
          ),

          const SizedBox(height: 20),
          //BUTTON

          Button(
            onTap: signUserUp,
          ),

          const SizedBox(height: 25),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Row(
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  const Expanded(
                      child: Divider(
                    indent: 20.0,
                    thickness: 0.5,
                    color: Colors.grey,
                  )),

                  // not a member register now

                  const Text('Already Registered?',
                      style: TextStyle(color: Colors.grey)),
                  SizedBox(width: 4),

                  GestureDetector(
                      onTap: widget.onTap,
                      child: const Text(
                        'Login instead',
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      )),
                  const Expanded(
                      child: Divider(
                    indent: 10.0,
                    endIndent: 20.0,
                    thickness: 1,
                  ))
                ]),
          )
        ])))));
  }
}
