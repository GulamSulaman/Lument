import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../widgets/authentication_widgets.dart';

class AuthenticationScreen extends StatefulWidget {
  @override
  _AuthenticationScreenState createState() => _AuthenticationScreenState();
}

class _AuthenticationScreenState extends State<AuthenticationScreen> {
  FirebaseAuth _auth = FirebaseAuth.instance;
  void submitAuthForm(
    String email,
    String userName,
    String password,
    bool isSignIn,
    BuildContext context,
  ) async {
    AuthResult authResult;

    try {
      if (isSignIn) {
        authResult = await _auth.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
      } else {
        authResult = await _auth.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );
        await Firestore.instance
            .collection('users')
            .document(authResult.user.uid)
            .setData({
          'userName': userName,
          'email': email,
        });
      }
    } on PlatformException catch (error) {
      var message = 'An error occured, Please check your credentials';
      if (error.message != null) {
        message = error.message;
      }
      Scaffold.of(context).showSnackBar(
        SnackBar(
          content: Text(message),
          backgroundColor: Theme.of(context).errorColor,
        ),
      );
    } catch (error) {
      print(error.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        elevation: 0.0,
      ),
      resizeToAvoidBottomInset: false,
      body: Container(
        child: AuthenticationWidgets(submitAuthForm),
      ),
    );
  }
}
