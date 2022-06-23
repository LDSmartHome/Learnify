import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:learnify/firebase_options.dart';
import 'package:learnify/pages/home.dart';
import 'package:learnify/pages/sign_in.dart';
import 'package:learnify/pages/sign_up.dart';
import 'package:learnify/pages/list_datasets.dart';
import 'package:learnify/pages/view_dataset.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const SignUpApp());
}

class SignUpApp extends StatelessWidget {
  const SignUpApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const HomeScreen(),
        '/login': (context) => const SignInScreen(),
        '/register': (context) => const SignUpScreen(),
        '/list': (context) => const ListDatasets(),
        '/view': (context) => const ViewDataset(),
      },
    );
  }
}
