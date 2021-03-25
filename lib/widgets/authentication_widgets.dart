import 'package:flutter/material.dart';

import '../models/authServices.dart';
import './style.dart';

class AuthenticationWidgets extends StatefulWidget {
  final void Function(
    String email,
    String userName,
    String password,
    bool isSignIn,
    BuildContext ctx,
  ) submitFn;

  AuthenticationWidgets(this.submitFn);

  @override
  _AuthenticationWidgetsState createState() => _AuthenticationWidgetsState();
}

class _AuthenticationWidgetsState extends State<AuthenticationWidgets> {
  final formKey = GlobalKey<FormState>();
  var isSignIn = true;
  var isLoading = false;

  var userEmail = '';
  var userName = '';
  var userPassword = '';

  var radioSelectedValue = 0;

  void signIn() {
    setState(() {
      isSignIn = !isSignIn;
    });
  }

  void trySubmit() {
    final isValid = formKey.currentState.validate();
    FocusScope.of(context).unfocus();
    if (isValid) {
      formKey.currentState.save();
      print(userPassword);
      widget.submitFn(
        userEmail.trim(),
        userName.trim(),
        userPassword,
        isSignIn,
        context,
      );
    }
  }

  Color radioSelectedTextColor = textLight60;
  @override
  Widget build(BuildContext context) {
    return Container(
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
                    isSignIn ? 'Sign in' : 'Create an account',
                    style: Theme.of(context).textTheme.headline4.copyWith(
                          color: textLight100,
                        ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 8.0,
                  ),
                  Text(
                    isSignIn
                        ? 'Please sign up to your account'
                        : 'Please sign up to create an account',
                    style: Theme.of(context).textTheme.subtitle1.copyWith(
                          color: textLight85,
                        ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              Container(
                height: isSignIn
                    ? (MediaQuery.of(context).size.height * .55)
                    : (MediaQuery.of(context).size.height * .75),
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
                                // if (!isSignIn)
                                //   Row(
                                //     children: <Widget>[
                                //       Expanded(
                                //         child: RadioListTile(
                                //           title: Text(
                                //             'Teacher',
                                //             style: Theme.of(context)
                                //                 .textTheme
                                //                 .subtitle1
                                //                 .copyWith(
                                //                     color:
                                //                         radioSelectedValue == 1
                                //                             ? Colors.amber[700]
                                //                             : textLight60),
                                //           ),
                                //           value: 1,
                                //           groupValue: radioSelectedValue,
                                //           activeColor:
                                //               Theme.of(context).accentColor,
                                //           onChanged: (val) {
                                //             setState(() {
                                //               radioSelectedValue = val;
                                //             });
                                //           },
                                //           selected: radioSelectedValue == 1,
                                //         ),
                                //       ),
                                //       Expanded(
                                //         child: RadioListTile(
                                //           title: Text(
                                //             'Student',
                                //             style: Theme.of(context)
                                //                 .textTheme
                                //                 .subtitle1
                                //                 .copyWith(
                                //                     color:
                                //                         radioSelectedValue == 2
                                //                             ? Colors.amber[700]
                                //                             : textLight60),
                                //           ),
                                //           value: 2,
                                //           groupValue: radioSelectedValue,
                                //           activeColor:
                                //               Theme.of(context).accentColor,
                                //           onChanged: (val) {
                                //             setState(() {
                                //               radioSelectedValue = val;
                                //             });
                                //           },
                                //         ),
                                //       ),
                                //     ],
                                //   ),
                                //   SizedBox(
                                //   height: 8.0,
                                // ),
                                if (!isSignIn)
                                  TextFormField(
                                    validator: (value) {
                                      if (value.isEmpty || value.length < 4) {
                                        return 'Enter a valid username';
                                      }
                                      return null;
                                    },
                                    key: ValueKey('UserName'),
                                    decoration: InputDecoration(
                                      labelText: 'UserName',
                                      labelStyle: labelTextStyle,
                                    ),
                                    onSaved: (value) {
                                      userName = value;
                                    },
                                  ),
                                TextFormField(
                                  validator: (value) {
                                    if (value.isEmpty || !value.contains('@')) {
                                      return 'Enter a valid email';
                                    }
                                    return null;
                                  },
                                  key: ValueKey('Email'),
                                  keyboardType: TextInputType.emailAddress,
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
                                    if (value.isEmpty || value.length < 7) {
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
                                isSignIn
                                    ? 'Sign in'.toUpperCase()
                                    : 'Sign up'.toUpperCase(),
                                style: Theme.of(context).textTheme.button,
                                textAlign: TextAlign.center,
                              ),
                              onPressed: trySubmit,
                            ),
                            SizedBox(
                              height: 8.0,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  isSignIn
                                      ? 'Don\'t have an account?'
                                      : 'Have an account?',
                                  style: Theme.of(context).textTheme.subtitle1,
                                ),
                                SizedBox(
                                  width: 4.0,
                                ),
                                GestureDetector(
                                  child: Text(
                                    isSignIn ? 'Sign up' : 'Sign in',
                                    style: Theme.of(context)
                                        .textTheme
                                        .subtitle1
                                        .copyWith(
                                          fontWeight: FontWeight.bold,
                                          color: Theme.of(context).accentColor,
                                        ),
                                  ),
                                  onTap: signIn,
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
