import 'package:flutter/material.dart';
import 'package:learnify/constants.dart';
import 'package:learnify/menu.dart';

class LogoutScreen extends StatefulWidget {
  const LogoutScreen({Key? key}) : super(key: key);

  @override
  State<LogoutScreen> createState() => _LogoutScreenState();
}

class _LogoutScreenState extends State<LogoutScreen> {
  @override
  Widget build(BuildContext context) {
    return MenuWidget(
      title: "Logout",
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            user.logout();
            Navigator.of(context).pushReplacementNamed("/");
          },
          child: const Text("Logout"),
        ),
      ),
    );
  }
}
