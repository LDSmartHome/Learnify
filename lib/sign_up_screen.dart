import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:flutter/material.dart';
import 'package:learnify/constants.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<StatefulWidget> createState() => _SignUpScreen();
}

class _SignUpScreen extends State<SignUpScreen> {
  final TextEditingController _username = TextEditingController();
  final TextEditingController _password = TextEditingController();

  String _message = "";

  @override
  void initState() {
    super.initState();
  }

  void _login() async {
    //Network network = Network();
    //var value = await network.post(apiLogin,
    //   data: {"username": "user", "password": "123"});

    BaseOptions options = BaseOptions(
      connectTimeout: 10000,
      receiveTimeout: 5000,
      headers: {
        "Accept": "application/json",
      },
    );

    Dio dio = Dio(options);
    dio.interceptors.add(CookieManager(CookieJar()));

    dio.options.extra['withCredentials'] = true;

    var value = await dio.post(apiLogin, queryParameters: {"username": "user", "password": "123"});
    var val = await dio.get(apiIsLogin);

    setState(() {
      _message = "success: ${val.data["success"]}, $value";
    });
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
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: _password,
                decoration: const InputDecoration(labelText: "Password"),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: ElevatedButton(
                onPressed: _login,
                child: const Text("Login"),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: Text(_message, textAlign: TextAlign.center),
            ),
          ],
        ),
      ),
    );
  }
}
