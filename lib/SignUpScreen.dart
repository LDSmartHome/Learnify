import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:learnify/constants.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  _SignUpScreen createState() => _SignUpScreen();
}

class _SignUpScreen extends State<SignUpScreen> {
  late Future<http.Response> futureStr;

  Future<http.Response> fetchStr() async{
    return http.get(Uri.parse(apiUrl));
  }

  @override
  void initState() {
    super.initState();
    futureStr = fetchStr();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[200],
        body: Center(
            child: FutureBuilder<http.Response>(
                future: futureStr,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Text(snapshot.data!.body.toString());
                  }
                  // By default, show a loading spinner.
                  return const CircularProgressIndicator();
                })));
  }
}
