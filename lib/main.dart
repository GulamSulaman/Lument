import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './models/users.dart';
import './screens/onboarding_Screens.dart';
import './screens/authentication_Screen.dart';
import './screens/home_screens.dart';
import './screens/profile_screens.dart';
import './widgets/style.dart';
import './models/authServices.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthServices().user,
      child: MaterialApp(
        title: 'Lument App',
        theme: ThemeData(
          primaryColor: Colors.cyan[800],
          accentColor: Colors.amber[700],
          errorColor: Colors.red[700],
          inputDecorationTheme: InputDecorationTheme(
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: lineColor,
                width: 1.5,
              ),
            ),
          ),
          fontFamily: 'Heebo',
          textTheme: ThemeData.light().textTheme.copyWith(
                headline4: headling4TextStyle,
                headline6: headling6TextStyle,
                bodyText1: body1TextStyle,
                button: buttonTextStyle,
                subtitle1: subtitle1TextStyle,
                overline: overlineTextStyle,
                subtitle2: subtitle2TextStyle,
              ),
          buttonTheme: ButtonTheme.of(context).copyWith(
            buttonColor: Theme.of(context).primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
          ),
          appBarTheme: AppBarTheme(
            textTheme: ThemeData.light().textTheme.copyWith(
                  title: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
          ),
        ),
        debugShowCheckedModeBanner: false,
        home: HomeScreens(),
      ),
    );
  }
}
