// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:learnify/home.dart';
import 'package:learnify/user.dart';

import 'sign_in_screen.dart';
import 'logout.dart';

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
        '/logout': (context) => const LogoutScreen(),
      },
    );
  }
}
