import 'package:flutter/material.dart';

import '../screens/signin_screens.dart';
import '../screens/signup_screens.dart';

class OnboardingWidgets extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomCenter,
      child: Stack(
        alignment: AlignmentDirectional.topCenter,
        overflow: Overflow.visible,
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height * 0.45,
            //color: Colors.white,
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 56.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(32.0),
                  topRight: Radius.circular(32.0)),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        style: Theme.of(context).textTheme.headline4,
                        children: <TextSpan>[
                          TextSpan(
                              text: 'Welcome to ',
                              style: TextStyle(
                                fontWeight: FontWeight.w300,
                              )),
                          TextSpan(text: 'Lument')
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Container(
                      alignment: Alignment.center,
                      width: 328,
                      //height: 47,
                      child: Text(
                        'An assignment evaluation app that helps teachers to evaluate student’s task',
                        style: Theme.of(context).textTheme.bodyText1,
                        softWrap: true,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    FlatButton(
                      padding: EdgeInsets.symmetric(
                        vertical: 21,
                        horizontal: 52.5,
                      ),
                      color: Color.fromRGBO(184, 213, 216, 1.0),
                      child: Text(
                        'Sign In'.toUpperCase(),
                        style: Theme.of(context).textTheme.button.copyWith(
                              color: Color.fromRGBO(0, 131, 143, 1.0),
                            ),
                        textAlign: TextAlign.center,
                      ),
                      onPressed: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => SignInScreen(),
                        ));
                      },
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    FlatButton(
                      padding: EdgeInsets.symmetric(
                        vertical: 21,
                        horizontal: 50.5,
                      ),
                      color: Theme.of(context).primaryColor,
                      child: Text(
                        'Sign up'.toUpperCase(),
                        style: Theme.of(context).textTheme.button.copyWith(
                              color: Colors.white,
                            ),
                        textAlign: TextAlign.center,
                      ),
                      onPressed: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => SignUpScreen(),
                        ));
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            top: -48.0,
            child: Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Color.fromRGBO(1, 12, 13, .16),
                    blurRadius: 48,
                    spreadRadius: 0,
                    offset: Offset(0, 16),
                  ),
                ],
              ),
              child: CircleAvatar(
                radius: 48,
                child: Image.asset('assets/images/Logo.png'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
