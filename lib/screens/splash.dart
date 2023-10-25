import 'package:flutter/material.dart';
import 'package:flutter_application_sw2/main.dart';
import 'package:flutter_application_sw2/screens/home.dart';
import 'package:flutter_application_sw2/screens/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ScreenSplash extends StatefulWidget {
  const ScreenSplash({super.key});

  @override
  State<ScreenSplash> createState() => _ScreenSplashState();
}

class _ScreenSplashState extends State<ScreenSplash> {
  @override
  void initState() {
    checkUserLoggedIn();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: const Color.fromARGB(1, 255, 255, 255)),
      body: SafeArea(
          child: Center(
        child: Image.asset(
          'assets/images/telegram.png',
          height: 150,
        ),
      )),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> checkUserLoggedIn() async {
    final sharedPrefs = await SharedPreferences.getInstance();
    final userLoggedIn = sharedPrefs.getBool(SAVE_KEY_NAME);

    if (userLoggedIn == null || userLoggedIn == false) {
      loginwait();
    } else {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => const ScreenHome(
          showSnackbar: false,
        ),
      ));
    }
  }

  Future<void> loginwait() async {
    await Future.delayed(const Duration(seconds: 3));
    Navigator.of(context).pushReplacement(MaterialPageRoute(
      builder: (ctx) => const ScreenLogin(
        showSnackBarLogin: false,
      ),
    ));
  }
}
