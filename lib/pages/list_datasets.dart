import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:learnify/util/constants.dart';
import 'package:learnify/util/dataset.dart';
import 'package:learnify/widget/menu.dart';
import 'package:tuple/tuple.dart';

class ListDatasets extends StatefulWidget {
  const ListDatasets({Key? key}) : super(key: key);

  @override
  State<ListDatasets> createState() => _ListDatasetsState();
}

class _ListDatasetsState extends State<ListDatasets> {
  @override
  void initState() {
    super.initState();

    auth.userChanges().listen((User? user) {
      if (user == null) {
        Navigator.of(context)
            .pushNamedAndRemoveUntil("/", (Route<dynamic> route) => false);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MenuWidget(
      title: "List",
      body: FutureBuilder<QuerySnapshot>(
          future: DataSet.getUserData(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasData) {
              return ListView(
                children: snapshot.data!.docs.map((DocumentSnapshot document) {
                  Map<String, dynamic> data =
                      document.data()! as Map<String, dynamic>;
                  return ListTile(
                    leading: const Icon(Icons.list),
                    trailing: Text(
                      data['type'].toString(),
                      style: const TextStyle(color: Colors.green, fontSize: 15),
                    ),
                    title: Text(data['name']),
                    subtitle: Text(data['description']),
                    onTap: () {
                      Navigator.of(context)
                          .pushNamed("/view", arguments: document.id);
                    },
                  );
                }).toList(),
              );
            } else if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            } else {
              return const CircularProgressIndicator();
            }
          }),
    );
  }
}
