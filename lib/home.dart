import 'package:flutter/material.dart';
import 'package:learnify/constants.dart';
import 'package:learnify/menu.dart';

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
        //Navigator.of(context).pushNamed("/login");
      }
    });
  }

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
