import 'package:learnify/util/constants.dart';

class DataSet {
  static createTestData() {
    return <Map<String, String>>[
      {
        "key": "Test1",
        "value": "Test2",
      },
      {
        "key": "Test3",
        "value": "Test4",
      }
    ];
  }

  static create(String name, List<dynamic> data,
      {String description = ""}) async {
    firestore.collection("data").doc("${auth.currentUser?.uid}_$name").set({
      "auth_uid": "${auth.currentUser?.uid}",
      "name": name,
      "description": description,
      "type": "KeyValue",
      "private": false,
    });

    for (dynamic temp in data) {
      firestore
          .collection("data")
          .doc("${auth.currentUser?.uid}_$name")
          .collection("data")
          .add(temp);
    }
  }

  static getInfo(String name) {
    return firestore
        .collection("data")
        .doc("${auth.currentUser?.uid}_$name")
        .get();
  }

  static getUserDataByName(String name) {
    return getDataByID("${auth.currentUser?.uid}_$name");
  }

  static getDataByID(String id) {
    return firestore
        .collection("data")
        .doc(id)
        .collection("data")
        .get();
  }

  static getAllData() {
    return firestore.collection("data").get();
  }
}
