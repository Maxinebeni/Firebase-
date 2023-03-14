import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '/components/my_button.dart';
import '/components/my_textfield.dart';

class Login extends StatefulWidget {
  final Function()? onTap;
  Login({super.key, required this.onTap});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  // text controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

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

  void signUserIn() async {
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
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      // pop the loading circle
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      // pop the loading circle
      Navigator.pop(context);
      // WRONG EMAIL
      showErrorMessage(e.code);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(248, 248, 250, 1),
        appBar: AppBar(
          title: Text('MIND MATE'),
          backgroundColor: Color.fromRGBO(80, 165, 112, 100),
          centerTitle: true,
        ),
        body: SafeArea(
          child: Center(
              child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 5),
                Image.asset('assets/images/Logo1.png', height: 80),

                const SizedBox(height: 50),
                const Text(
                  'Welcome back!',
                  style: TextStyle(
                    color: Color.fromRGBO(177, 151, 129, 1),
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 25),

                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 60.0),
                      child: Text(
                        'Email',
                        style: TextStyle(
                          color: Color.fromRGBO(177, 151, 129, 1),
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ],
                ),

                // username textfield
                MyTextField(
                  controller: emailController,
                  obscureText: false,
                ),

                const SizedBox(height: 10),

                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 60.0),
                      child: Text(
                        'Password',
                        style: TextStyle(
                          color: Color.fromRGBO(177, 151, 129, 1),
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ],
                ),

                // password textfield
                MyTextField(
                  controller: passwordController,
                  obscureText: true,
                ),

                const SizedBox(height: 10),

                // forgot password
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 65.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: const [
                      Text(
                        'Forgot Password?',
                        style:
                            TextStyle(color: Color.fromRGBO(177, 151, 129, 1)),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 15),

                // sign- in button
                MyButton(
                  onTap: signUserIn,
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

                      const Text('Not a member?',
                          style: TextStyle(color: Colors.grey)),
                      SizedBox(width: 4),

                      GestureDetector(
                          onTap: widget.onTap,
                          child: const Text(
                            'Register now',
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
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          )),
        ));
  }
}
