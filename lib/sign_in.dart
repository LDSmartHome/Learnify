import 'package:flutter/material.dart';
import 'package:learnify/constants.dart';
import 'package:learnify/menu.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<StatefulWidget> createState() => _SignInScreen();
}

class _SignInScreen extends State<SignInScreen> {
  final TextEditingController _username = TextEditingController();
  final TextEditingController _password = TextEditingController();

  bool _notEmpty = false;

  @override
  void initState() {
    super.initState();
  }

  void _validate(String data) {
    if (_username.text.isEmpty || _password.text.isEmpty) {
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
      title: "Sign In",
      body: Center(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              child: const Center(
                child: Text("Enter your Login Credentials:"),
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
                    Navigator.of(context).pushReplacementNamed("/register");
                  },
                  child: const Text("Have an no account? Sign up!"),
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
                            .login(_username.text, _password.text)
                            .then((value) =>
                                Navigator.of(context).pushReplacementNamed("/"))
                            .catchError((error) => {
                                  setState(() {
                                    showAlertDialog(error.toString());
                                  })
                                });
                      },
                child: const Text("Login"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
