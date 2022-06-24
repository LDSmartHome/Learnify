import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:learnify/util/constants.dart';
import 'package:learnify/util/user.dart';

class DataSet {
  static List<Map<String, String>> createTestData() {
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
    firestore.collection("data").doc("${UserManager.getUser()?.uid}_$name").set({
      "auth_uid": "${UserManager.getUser()?.uid}",
      "name": name,
      "description": description,
      "type": "KeyValue",
      "private": false,
    });

    for (dynamic temp in data) {
      firestore
          .collection("data")
          .doc("${UserManager.getUser()?.uid}_$name")
          .collection("data")
          .add(temp);
    }
  }

  static Future<DocumentSnapshot<Map<String, dynamic>>> getUserInfoByName(String name) {
    return getInfoByID("${UserManager.getUser()?.uid}_$name");
  }

  static Future<DocumentSnapshot<Map<String, dynamic>>> getInfoByID(String id) {
    return firestore
        .collection("data")
        .doc(id)
        .get();
  }

  static Future<QuerySnapshot<Map<String, dynamic>>> getUserDataByName(String name) {
    return getDataByID("${UserManager.getUser()?.uid}_$name");
  }

  static Future<QuerySnapshot<Map<String, dynamic>>> getDataByID(String id) {
    return firestore
        .collection("data")
        .doc(id)
        .collection("data")
        .get();
  }

  static Future<QuerySnapshot<Map<String, dynamic>>> getAllData() {
    return firestore.collection("data").get();
  }
}
