import 'package:flutter/material.dart';

class MenuItems extends StatefulWidget {
  const MenuItems({Key? key}) : super(key: key);

  @override
  State<MenuItems> createState() => _MenuItemsState();
}

class _MenuItemsState extends State<MenuItems> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        const DrawerHeader(
          decoration: BoxDecoration(
            color: Colors.blue,
          ),
          child: Text("Learnify"),
        ),
        ListTile(
          title: const Text("Home"),
          trailing: const Icon(Icons.home),
          onTap: () {
            Navigator.of(context).pushReplacementNamed("/");
          },
        ),
        const Divider(),
        ListTile(
          title: const Text("Login"),
          trailing: const Icon(Icons.arrow_forward_ios),
          onTap: () {
            Navigator.of(context).pushReplacementNamed("/login");
          },
        ),
        ListTile(
          title: const Text("Register"),
          trailing: const Icon(Icons.arrow_forward_ios),
          onTap: () {
            Navigator.of(context).pushReplacementNamed("/register");
          },
        ),
        ListTile(
          title: const Text("Logout"),
          trailing: const Icon(Icons.exit_to_app),
          onTap: () {
            Navigator.of(context).pushReplacementNamed("/logout");
          },
        ),
      ],
    );
  }
}
