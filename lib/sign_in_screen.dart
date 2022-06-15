import 'package:flutter/material.dart';
import 'package:learnify/constants.dart';

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
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Center(
        child: ListView(
          padding: const EdgeInsets.all(10),
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: _username,
                decoration: const InputDecoration(labelText: "Username"),
                onChanged: _validate,
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: _password,
                decoration: const InputDecoration(labelText: "Password"),
                onChanged: _validate,
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
                            .then((value) => Navigator.of(context).pop())
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
