// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:learnify/util/constants.dart';
import 'package:learnify/widget/menu.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return const MenuWidget(
      title: "Home",
      body: Center(
        child: Text("Home"),
      ),
    );
  }
}
