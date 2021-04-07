import 'package:flutter/material.dart';
import 'pages/calculator_page.dart';
import 'package:splashscreen/splashscreen.dart';

void main() {
  runApp(new MaterialApp(
    home: new MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 4,
      navigateAfterSeconds: CalculatorPage(),
      title: Text(
        'CALCULADORA',
        style: TextStyle(
          fontFamily: 'Calculator',
          fontWeight: FontWeight.bold,
          fontSize: 40,
          color: Colors.deepPurple,
        ),
      ),
      backgroundColor: Colors.black,
      image: Image.asset('assets/icons/icon.png'),
      photoSize: 100.0,
      loaderColor: Colors.deepPurple,
    );
  }
}