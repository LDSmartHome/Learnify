import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreen createState() => _SignUpScreen();
}

class _SignUpScreen extends State<SignUpScreen> {
  int _count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[200],
        body: Center(
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  _count++;
                });
              },
              child: Text(_count.toString()),
            )
        )
    );
  }
}
