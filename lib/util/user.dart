import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:learnify/util/constants.dart';

class UserManager {
  static Future<UserCredential> login({
    required String email,
    required String password,
  }) {
    return auth.signInWithEmailAndPassword(email: email, password: password);
  }

  static Future<void> logout() {
    return auth.signOut();
  }

  static Future<UserCredential> register({
    required String username,
    required String email,
    required String password,
  }) async {
    UserCredential user = await auth.createUserWithEmailAndPassword(
        email: email, password: password);

    await firestore.collection("users").doc(user.user!.uid).set({
      "email": user.user!.email,
      "user": username,
    });

    return user;
  }

  static Future<DocumentSnapshot<Map<String, dynamic>>> getUserInfo(String uid){
    return firestore.collection("users").doc(uid).get();
  }

  static User? getUser() {
    return auth.currentUser;
  }

  static User? getUserData() {
    return auth.currentUser;
  }
}
