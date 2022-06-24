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
    required String email,
    required String password,
  }) {
    return auth.createUserWithEmailAndPassword(email: email, password: password);
  }

  static User? getUser() {
    return auth.currentUser;
  }

  static User? getUserData() {
    return auth.currentUser;
  }
}
