import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/users.dart';
import '../screens/signin_screens.dart';
import '../screens/home_screens.dart';
import '../models/authServices.dart';
import './style.dart';

enum Occupation {
  none,
  teacher,
  student,
}

class SignUpWidgets extends StatefulWidget {
  @override
  _SignUpWidgetsState createState() => _SignUpWidgetsState();
}

class _SignUpWidgetsState extends State<SignUpWidgets> {
  final formKey = GlobalKey<FormState>();
  var fullName = '';
  var userEmail = '';
  var userPassword = '';
  var isTeacher = false;
  var isLoading = false;
  Occupation radioSelectedValue = Occupation.none;
  Color radioSelectedTextColor = textLight60;

  AuthServices authservices = new AuthServices();

  User user = new User();

  signUp() async {
    if (formKey.currentState.validate()) {
      if (radioSelectedValue != Occupation.none) {
        setState(() {
          isLoading = true;
        });
        formKey.currentState.save();
        await authservices
            .signUpWithEmailAndPassword(
          userEmail,
          userPassword,
          fullName,
          isTeacher,
        )
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
                          'Create an account',
                          style: Theme.of(context).textTheme.headline4.copyWith(
                                color: textLight100,
                              ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: 8.0,
                        ),
                        Text(
                          'Please sign up to create an account',
                          style: Theme.of(context).textTheme.subtitle1.copyWith(
                                color: textLight85,
                              ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * .75,
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
                                      Row(
                                        children: <Widget>[
                                          Expanded(
                                            child: RadioListTile(
                                              title: Text(
                                                'Teacher',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .subtitle1
                                                    .copyWith(
                                                        color:
                                                            radioSelectedValue ==
                                                                    Occupation
                                                                        .teacher
                                                                ? Colors
                                                                    .amber[700]
                                                                : textLight60),
                                              ),
                                              value: Occupation.teacher,
                                              groupValue: radioSelectedValue,
                                              activeColor:
                                                  Theme.of(context).accentColor,
                                              onChanged: (val) {
                                                setState(() {
                                                  radioSelectedValue = val;
                                                  isTeacher = true;
                                                });
                                              },
                                            ),
                                          ),
                                          Expanded(
                                            child: RadioListTile(
                                              title: Text(
                                                'Student',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .subtitle1
                                                    .copyWith(
                                                        color:
                                                            radioSelectedValue ==
                                                                    Occupation
                                                                        .student
                                                                ? Colors
                                                                    .amber[700]
                                                                : textLight60),
                                              ),
                                              value: Occupation.student,
                                              groupValue: radioSelectedValue,
                                              activeColor:
                                                  Theme.of(context).accentColor,
                                              onChanged: (val) {
                                                setState(() {
                                                  radioSelectedValue = val;
                                                  isTeacher = false;
                                                });
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 8.0,
                                      ),
                                      TextFormField(
                                        validator: (value) {
                                          if (value.isEmpty ||
                                              value.length < 4) {
                                            return 'Enter a valid fullname';
                                          }
                                          return null;
                                        },
                                        key: ValueKey('FullName'),
                                        decoration: InputDecoration(
                                          labelText: 'Full Name',
                                          labelStyle: labelTextStyle,
                                        ),
                                        onSaved: (value) {
                                          fullName = value;
                                        },
                                      ),
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
                                      'Sign up'.toUpperCase(),
                                      style: Theme.of(context).textTheme.button,
                                      textAlign: TextAlign.center,
                                    ),
                                    onPressed: signUp,
                                  ),
                                  SizedBox(
                                    height: 8.0,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Have an account?',
                                        style: Theme.of(context)
                                            .textTheme
                                            .subtitle1,
                                      ),
                                      SizedBox(
                                        width: 4.0,
                                      ),
                                      GestureDetector(
                                        child: Text(
                                          'Sign in',
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
                                                SignInScreen(),
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
