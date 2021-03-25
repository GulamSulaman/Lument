import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/users.dart';
import '../screens/signup_screens.dart';
import '../screens/home_screens.dart';
import '../models/authServices.dart';
import './style.dart';

class SignInWidgets extends StatefulWidget {
  @override
  _SignInWidgetsState createState() => _SignInWidgetsState();
}

class _SignInWidgetsState extends State<SignInWidgets> {
  final formKey = GlobalKey<FormState>();
  var userEmail = '';
  var userPassword = '';
  var isLoading = false;

  AuthServices authservices = new AuthServices();
  signIn() async {
    if (formKey.currentState.validate()) {
      setState(() {
        isLoading = true;
      });
      formKey.currentState.save();
      await authservices
          .signInEmailAndPassword(userEmail, userPassword)
          .then((value) {
        setState(() {
          isLoading = false;
        });
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => HomeScreens(),
        ));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    return isLoading
        ? Center(
            child: CircularProgressIndicator(),
          )
        : Container(
            child: Padding(
              padding: EdgeInsets.only(
                top: 16.0,
              ),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Text(
                          'Sign in',
                          style: Theme.of(context).textTheme.headline4.copyWith(
                                color: textLight100,
                              ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: 8.0,
                        ),
                        Text(
                          'Please sign in to your account',
                          style: Theme.of(context).textTheme.subtitle1.copyWith(
                                color: textLight85,
                              ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * .55,
                      alignment: Alignment.bottomCenter,
                      padding: EdgeInsets.only(
                        top: 32.0,
                        right: 16.0,
                        bottom: 56.0,
                        left: 16.0,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(32.0),
                            topRight: Radius.circular(32.0)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Form(
                          key: formKey,
                          child: Column(
                            // main column
                            children: <Widget>[
                              Expanded(
                                child: SingleChildScrollView(
                                  child: Column(
                                    //form column
                                    children: <Widget>[
                                      TextFormField(
                                        validator: (value) {
                                          if (value.isEmpty ||
                                              !value.contains('@')) {
                                            return 'Enter a valid email';
                                          }
                                          return null;
                                        },
                                        key: ValueKey('Email'),
                                        keyboardType:
                                            TextInputType.emailAddress,
                                        decoration: InputDecoration(
                                          labelText: 'Email Address',
                                          labelStyle: labelTextStyle,
                                        ),
                                        onSaved: (value) {
                                          userEmail = value;
                                        },
                                      ),
                                      SizedBox(
                                        height: 8.0,
                                      ),
                                      TextFormField(
                                        validator: (value) {
                                          if (value.isEmpty ||
                                              value.length < 7) {
                                            return 'Please enter a password with at least 7 characters';
                                          }
                                          return null;
                                        },
                                        key: ValueKey('Password'),
                                        decoration: InputDecoration(
                                          labelText: 'Password',
                                          labelStyle: labelTextStyle,
                                        ),
                                        obscureText: true,
                                        onSaved: (value) {
                                          userPassword = value;
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              // button column
                              Column(
                                children: <Widget>[
                                  FlatButton(
                                    padding: EdgeInsets.symmetric(
                                      vertical: 21,
                                    ),
                                    minWidth: double.infinity,
                                    color: Theme.of(context).primaryColor,
                                    child: Text(
                                      'Sign in'.toUpperCase(),
                                      style: Theme.of(context).textTheme.button,
                                      textAlign: TextAlign.center,
                                    ),
                                    onPressed: signIn,
                                  ),
                                  SizedBox(
                                    height: 8.0,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Don\'t have an account?',
                                        style: Theme.of(context)
                                            .textTheme
                                            .subtitle1,
                                      ),
                                      SizedBox(
                                        width: 4.0,
                                      ),
                                      GestureDetector(
                                        child: Text(
                                          'Sign up',
                                          style: Theme.of(context)
                                              .textTheme
                                              .subtitle1
                                              .copyWith(
                                                fontWeight: FontWeight.bold,
                                                color: Theme.of(context)
                                                    .accentColor,
                                              ),
                                        ),
                                        onTap: () {
                                          Navigator.of(context).pushReplacement(
                                              MaterialPageRoute(
                                            builder: (context) =>
                                                SignUpScreen(),
                                          ));
                                        },
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ]),
            ),
          );
  }
}
