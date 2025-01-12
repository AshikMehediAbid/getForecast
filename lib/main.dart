import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/screens/home_Screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: AnimatedSplashScreen(
        splash: Container(
          //width: MediaQuery.of(context).size.width * .5,
          child: Image.asset(
            "assets/sp.png",
            width: 265.75,
          ),
        ),
        duration: 3000,
        backgroundColor: Color.fromRGBO(220, 244, 255, 1),
        nextScreen: HomeScreen(),
      ),
    );
  }
}
