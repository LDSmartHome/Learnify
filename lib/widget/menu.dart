import 'package:flutter/material.dart';
import 'package:learnify/util/constants.dart';
import 'package:learnify/widget/menu_items.dart';

class MenuWidget extends StatefulWidget {
  const MenuWidget(
      {Key? key, required this.title, required this.body, this.onLoginLoaded})
      : super(key: key);

  final Widget? body;
  final String title;
  final BoolCallback? onLoginLoaded;

  @override
  State<MenuWidget> createState() => _MenuWidgetState();
}

class _MenuWidgetState extends State<MenuWidget> {
  bool _loggedIn = false;

  @override
  void initState() {
    super.initState();

    user.isLogin().then((value) => {
      widget.onLoginLoaded!(value),
      setState((){
        _loggedIn = value;
      })
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
