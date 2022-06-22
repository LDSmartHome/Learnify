// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:learnify/util/constants.dart';
import 'package:learnify/widget/menu_items.dart';

class MenuWidget extends StatefulWidget {
  const MenuWidget({Key? key, required this.title, required this.body})
      : super(key: key);

  final Widget body;
  final String title;

  @override
  State<MenuWidget> createState() => _MenuWidgetState();
}

class _MenuWidgetState extends State<MenuWidget> {
  bool _loggedIn = false;

  @override
  void initState() {
    super.initState();

    auth.authStateChanges().listen((User? user) {
      if (user != null) {
        setState(() {
          _loggedIn = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(title: Text(widget.title)),
      body: Center(
        child: widget.body,
      ),
      drawer: Drawer(
        child: MenuItems(
          loggedIn: _loggedIn,
        ),
      ),
    );
  }
}
