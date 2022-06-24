import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:learnify/util/constants.dart';
import 'package:learnify/util/dataset.dart';
import 'package:learnify/widget/menu.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return MenuWidget(
      title: "Home",
      body: Center(
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            const Text("Home"),
            ElevatedButton(
              onPressed: () {
                DataSet.create("name", DataSet.createTestData(), description: "Test")
                    .then((value) => showInfoDialog(context, "Data Added"))
                    .catchError((error) =>
                        showErrorDialog(context, "Failed to add data: $error"));
              },
              child: const Text("addTest"),
            ),
          ],
        ),
      ),
    );
  }
}
