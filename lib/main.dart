// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:learnify/pages/home.dart';
import 'package:learnify/pages/sign_in.dart';
import 'package:learnify/pages/sign_up.dart';
import 'package:learnify/util/user.dart';

void main() => runApp(const SignUpApp());

class SignUpApp extends StatelessWidget {
  const SignUpApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const HomeScreen(),
        '/login': (context) => const SignInScreen(),
        '/register': (context) => const SignUpScreen(),
      },
    );
  }
}
