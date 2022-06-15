import 'package:flutter/material.dart';
import 'package:learnify/constants.dart';

class LogoutScreen extends StatefulWidget {
  const LogoutScreen({Key? key}) : super(key: key);

  @override
  State<LogoutScreen> createState() => _LogoutScreenState();
}

class _LogoutScreenState extends State<LogoutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            user.logout();
            Navigator.of(context).pop();
            user.isLogin().then((value) {
              if (!value) {
                Navigator.of(context).pushNamed("/login");
              }
            });
          },
          child: const Text("Logout"),
        ),
      ),
    );
  }
}
