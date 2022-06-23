import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:learnify/util/constants.dart';
import 'package:learnify/widget/menu.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<StatefulWidget> createState() => _SignInScreen();
}

class _SignInScreen extends State<SignInScreen> {
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

  @override
  Widget build(BuildContext context) {
    return MenuWidget(
      title: "Log In",
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
                    Navigator.of(context).pushReplacementNamed("/register");
                  },
                  child: const Text("Have an no account? Sign up!"),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: ElevatedButton(
                onPressed: () async {
                  try {
                    await auth.signInWithEmailAndPassword(
                        email: _email.text, password: _password.text);
                  } on FirebaseAuthException catch (e) {
                    if (e.code == 'wrong-password') {
                      showErrorDialog(
                          context, 'Wrong password provided for that user.');
                    } else if (e.code == 'invalid-email') {
                      showErrorDialog(context, 'Invalid email for that user.');
                    } else {
                      showErrorDialog(context, 'Unknown Error: ${e.code}');
                    }
                  }
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
