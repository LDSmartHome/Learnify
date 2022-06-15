import 'package:flutter/material.dart';
import 'package:learnify/menu_items.dart';

class MenuWidget extends StatefulWidget {
  const MenuWidget({Key? key, this.body, required this.title})
      : super(key: key);

  final Widget? body;
  final String title;

  @override
  State<MenuWidget> createState() => _MenuWidgetState();
}

class _MenuWidgetState extends State<MenuWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(title: Text(widget.title)),
      body: Center(
        child: widget.body,
      ),
      drawer: const Drawer(
        child: MenuItems(),
      ),
    );
  }
}
