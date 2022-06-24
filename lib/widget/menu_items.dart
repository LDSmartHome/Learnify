import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:learnify/util/constants.dart';

class MenuItems extends StatefulWidget {
  const MenuItems({Key? key, required this.loggedIn}) : super(key: key);

  final bool loggedIn;

  @override
  State<MenuItems> createState() => _MenuItemsState();
}

class _MenuItemsState extends State<MenuItems> {
  String _profile = "ERROR";

  @override
  void initState() {
    super.initState();

    auth.userChanges().listen((User? user) {
      if (user != null) {
        if(mounted) {
          setState(() {
            _profile = user.email.toString();
          });
        }
      }
    });
  }

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
            Navigator.of(context)
                .pushNamedAndRemoveUntil("/", (Route<dynamic> route) => false);
          },
        ),
        ListTile(
          title: const Text("List"),
          trailing: const Icon(Icons.view_array),
          onTap: () {
            Navigator.of(context).pushNamedAndRemoveUntil(
                "/list", (Route<dynamic> route) => false);
          },
        ),
        const Divider(),
        if (!widget.loggedIn) ...{
          ListTile(
            title: const Text("Login"),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.of(context).pushNamedAndRemoveUntil(
                  "/login", (Route<dynamic> route) => false);
            },
          ),
          ListTile(
            title: const Text("Register"),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.of(context).pushNamedAndRemoveUntil(
                  "/register", (Route<dynamic> route) => false);
            },
          ),
        } else ...{
          ListTile(
            trailing: const Icon(Icons.account_circle),
            title: Text(_profile),
          ),
          ListTile(
            title: const Text("Logout"),
            trailing: const Icon(Icons.exit_to_app),
            onTap: () {
              auth.signOut();
              Navigator.of(context).pushNamedAndRemoveUntil(
                  "/", (Route<dynamic> route) => false);
            },
          ),
        }
      ],
    );
  }
}
