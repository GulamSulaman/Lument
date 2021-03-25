import 'package:flutter/material.dart';

import '../widgets/signin_widgets.dart';

class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        elevation: 0.0,
      ),
      resizeToAvoidBottomInset: false,
      body: Container(
        child: SignInWidgets(),
      ),
    );
  }
}
