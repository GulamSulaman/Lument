import 'package:Lument/widgets/signup_widgets.dart';
import 'package:flutter/material.dart';

import '../widgets/signup_widgets.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        elevation: 0.0,
      ),
      resizeToAvoidBottomInset: false,
      body: Container(
        child: SignUpWidgets(),
      ),
    );
  }
}
