import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import './splash.dart';
import './signup.dart';
import './login.dart';
import './auth_page.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var nextScreen;
    return MaterialApp(
        // Application name
        title: 'Mindmate',
        // Application theme data, you can set the colors for the application as
        // you want
        theme: ThemeData(
            colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: const Color.fromARGB(0xff, 0x50, 0xA5, 0x70),
        )),
        // A widget which will be started on application startup
        home: AnimatedSplashScreen(
          splashTransition: SplashTransition.rotationTransition,
          backgroundColor: Color.fromARGB(0xff, 0xF8, 0xF8, 0xFA),
          splash: Center(
            child: Image.asset(
              "assets/images/Logo1.png",
            ),
          ),
          nextScreen: AuthPage(),
        ));
  }
}

class MyHomePage extends StatelessWidget {
  final String title;
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AuthPage(),
    );
  }
}
