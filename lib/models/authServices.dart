import 'package:Lument/models/DatabaseService.dart';
import 'package:firebase_auth/firebase_auth.dart';

import './users.dart';

class AuthServices {
  FirebaseAuth _auth = FirebaseAuth.instance;

  User userFromFirebaseUser(FirebaseUser user) {
    return user != null ? User(uId: user.uid) : null;
  }

  Future<String> getCurrentUid() async {
    return (await _auth.currentUser()).uid;
  }

  Stream<User> get user {
    return _auth.onAuthStateChanged
        .map((FirebaseUser user) => userFromFirebaseUser(user));
  }

  Future signInEmailAndPassword(String email, String password) async {
    try {
      AuthResult authResult = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      FirebaseUser firebaseUser = authResult.user;
    } catch (error) {
      print(error.toString());
    }
  }

  Future signUpWithEmailAndPassword(
    String email,
    String password,
    String fullName,
    bool isTeacher,
  ) async {
    try {
      AuthResult authResult = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      FirebaseUser firebaseUser = authResult.user;

      await DatabaseService(uid: firebaseUser.uid)
          .updateUserData(email, fullName, isTeacher);

      return userFromFirebaseUser(firebaseUser);
    } catch (error) {
      print(error.toString());
    }
  }

  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (error) {
      print(error.toString());
      return null;
    }
  }
}
