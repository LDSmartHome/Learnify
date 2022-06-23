import 'package:learnify/util/constants.dart';

class DataSet {
  static createData() {
    return <String, String>{
      "key1": "value2",
    };
  }

  static create(String name, dynamic data, {String description = ""}) {
    return firestore
        .collection("data")
        .doc("${auth.currentUser?.uid}_$name")
        .set({
      "auth_uid": "${auth.currentUser?.uid}",
      "name": name,
      "description": description,
      "type": "KeyValue",
      "data": data,
    });
  }

  static get(String name) {
    return firestore
        .collection("data")
        .doc("${auth.currentUser?.uid}_$name")
        .get();
  }

  static getUserData() {
    return firestore.collection("data").get();
  }
}
