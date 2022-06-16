import 'package:flutter/material.dart';
import 'package:learnify/util/constants.dart';
import 'package:learnify/widget/menu.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<StatefulWidget> createState() => _SignUpScreen();
}

class _SignUpScreen extends State<SignUpScreen> {
  final TextEditingController _username = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  bool _notEmpty = false;

  @override
  void initState() {
    super.initState();
  }

  void _validate(String data) {
    if (_username.text.isEmpty ||
        _password.text.isEmpty ||
        _email.text.isEmpty) {
      setState(() {
        _notEmpty = false;
      });
    } else {
      setState(() {
        _notEmpty = true;
      });
    }
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
                controller: _username,
                decoration: const InputDecoration(labelText: "Username"),
                textInputAction: TextInputAction.next,
                onChanged: _validate,
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: _email,
                decoration: const InputDecoration(labelText: "Email"),
                textInputAction: TextInputAction.next,
                onChanged: _validate,
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
                onChanged: _validate,
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
                onPressed: !_notEmpty
                    ? null
                    : () {
                        user
                            .register(
                                _username.text, _email.text, _password.text)
                            .then((value) =>
                                Navigator.of(context).pushReplacementNamed("/"))
                            .catchError((error) => {
                                  setState(() {
                                    showAlertDialog(error.toString());
                                  })
                                });
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
