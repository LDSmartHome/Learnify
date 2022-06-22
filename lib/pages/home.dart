// ignore_for_file: unused_import, prefer_final_fields

import 'package:flutter/material.dart';
import 'package:learnify/util/constants.dart';
import 'package:learnify/widget/menu.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _message = "";

  @override
  Widget build(BuildContext context) {
    return MenuWidget(
      title: "Home",
      body: Center(
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            const Text("Home"),
            ElevatedButton(
              onPressed: () {
              },
              child: const Text("addTest"),
            ),
            Text(_message)
          ],
        ),
      ),
    );
  }
}
