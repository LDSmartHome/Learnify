import 'package:flutter/material.dart';
import 'package:learnify/constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();

    user.isLogin().then((value) {
      if (!value) {
        Navigator.of(context).pushNamed("/login");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.of(context).pushNamed("/logout");
          },
          child: const Text("LogouScreen"),
        ),
      ),
    );
  }
}
