import 'package:flutter/material.dart';
import 'package:flutter_application_sw2/screens/splash.dart';

const SAVE_KEY_NAME = 'UserLoggedIn';
void main(List<String> args) {
  runApp(const Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const ScreenSplash(),
    );
  }
}
