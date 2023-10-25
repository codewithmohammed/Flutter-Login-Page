import 'package:flutter/material.dart';
import 'package:flutter_application_sw2/main.dart';
import 'package:flutter_application_sw2/screens/home.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ScreenLogin extends StatefulWidget {
  final showSnackBarLogin;
  const ScreenLogin({super.key, required this.showSnackBarLogin});

  @override
  State<ScreenLogin> createState() => _ScreenLoginState();
}

class _ScreenLoginState extends State<ScreenLogin> {
  @override
  void initState() {
    super.initState();
    if (widget.showSnackBarLogin) {
      Future.delayed(Duration.zero, () {
        final scaffoldMessenger = ScaffoldMessenger.of(context);
        scaffoldMessenger.showSnackBar(
          const SnackBar(
            content: Text('Signed Out'),
          ),
        );
      });
    }
  }

  final _usernameController = TextEditingController();

  final _passwordController = TextEditingController();

  bool _isDataMatched = true;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 60),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/telegram.png',
                    height: 200,
                  ),
                  const SizedBox(
                    child: Text(
                      'Sign in To Telegram',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  const SizedBox(
                    width: 300,
                    child: Text(
                      'Please confirm your Email adress and enter your password.',
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  TextFormField(
                    controller: _usernameController,
                    decoration: const InputDecoration(
                        filled: true,
                        fillColor: Color.fromARGB(66, 51, 143, 236),
                        prefixIcon: Icon(
                          Icons.person,
                          color: Color.fromARGB(225, 51, 144, 236),
                        ),
                        hintText: 'Email',
                        hintStyle: TextStyle(color: Colors.grey),
                        contentPadding: EdgeInsets.fromLTRB(4, 1, 0, 0),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 1,
                                color: Color.fromARGB(255, 93, 91, 91))),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 2,
                                color: Color.fromARGB(225, 51, 144, 236))),
                        errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 2,
                                color: Color.fromARGB(255, 255, 0, 0))),
                        focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 2,
                                color: Color.fromARGB(255, 255, 0, 0)))),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'can\'t be empty';
                      }
                      if (value.length < 4) {
                        return 'Too short';
                      }
                      if (!RegExp(
                              r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
                          .hasMatch(value)) {
                        return ' Please enter a valid email';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: const InputDecoration(
                        filled: true,
                        fillColor: Color.fromARGB(66, 51, 143, 236),
                        prefixIcon: Icon(
                          Icons.lock,
                          color: Color.fromARGB(225, 51, 144, 236),
                        ),
                        hintText: 'Password',
                        hintStyle: TextStyle(color: Colors.grey),
                        contentPadding: EdgeInsets.fromLTRB(4, 1, 0, 0),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 1,
                                color: Color.fromARGB(255, 93, 91, 91))),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 2,
                                color: Color.fromARGB(225, 51, 144, 236))),
                        errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 2,
                                color: Color.fromARGB(224, 236, 51, 51))),
                        focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 2,
                                color: Color.fromARGB(224, 236, 51, 51)))),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'can\'t be empty';
                      }
                      if (value.length < 7) {
                        return 'should include minimum 8 characters ';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Visibility(
                    visible: !_isDataMatched,
                    child: const Text(
                      'Username and Password is not Matched.',
                      style: TextStyle(
                          color: Color.fromRGBO(255, 255, 255, 1),
                          backgroundColor: Color.fromARGB(171, 255, 0, 0)),
                    ),
                  ),
                  SizedBox(
                    width: 200,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          checkSignin(context);
                        } else {}
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color.fromARGB(225, 51, 144, 236),
                        foregroundColor:
                            const Color.fromARGB(255, 255, 255, 255),
                      ),
                      child: const Text('Sign in'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void checkSignin(BuildContext ctx) async {
    const predifinedusername = 'rayid@gmail.com';
    const predifinedpassword = 'rayid123';
    final username = _usernameController.text;
    final password = _passwordController.text;

    if (username == predifinedusername && password == predifinedpassword) {
      // print('PAss is matched');
      final sharedPrefs = await SharedPreferences.getInstance();
      await sharedPrefs.setBool(SAVE_KEY_NAME, true);
      Navigator.of(ctx).pushReplacement(MaterialPageRoute(
          builder: (context) => const ScreenHome(
                showSnackbar: false,
              )));
    } else {
      // print('PAss not matched');
      setState(() {
        _isDataMatched = false;
      });
    }
  }
}
