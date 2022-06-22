// ignore_for_file: unused_import

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:learnify/util/constants.dart';
import 'package:learnify/widget/menu.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<StatefulWidget> createState() => _SignUpScreen();
}

class _SignUpScreen extends State<SignUpScreen> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  @override
  void initState() {
    super.initState();

    auth.userChanges().listen((User? user) {
      if (user != null) {
        Navigator.of(context).pushReplacementNamed("/");
      }
    });
  }

  showAlertDialog(String message) {
    // set up the button
    Widget okButton = TextButton(
      child: const Text("OK"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: const Text("Error"),
      content: Text(message),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MenuWidget(
      title: "Register",
      body: Center(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              child: const Center(
                child: Text("Enter your Credentials:"),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: _email,
                decoration: const InputDecoration(labelText: "Email"),
                textInputAction: TextInputAction.next,
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: _password,
                decoration: const InputDecoration(labelText: "Password"),
                textInputAction: TextInputAction.done,
                obscureText: true,
                enableSuggestions: false,
                autocorrect: false,
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: Center(
                child: TextButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacementNamed("/login");
                  },
                  child: const Text("Have an account? Sign in!"),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: ElevatedButton(
                onPressed: () async {
                  try {
                    UserCredential userCredential =
                        await auth.createUserWithEmailAndPassword(
                            email: _email.text, password: _password.text);
                  } on FirebaseAuthException catch (e) {
                    if (e.code == 'weak-password') {
                      showAlertDialog('Password need to have at least 6 characters.');
                    } else if (e.code == 'invalid-email') {
                      showAlertDialog('Invalid email for that user.');
                    } else {
                      showAlertDialog('Unknown Error: ${e.code}');
                    }
                  }
                },
                child: const Text("Sign up"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
