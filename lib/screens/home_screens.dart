import '../models/DatabaseService.dart';
import '../widgets/profile_edit_widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './onboarding_Screens.dart';
import '../models/userData.dart';
import '../models/users.dart';
import '../widgets/home_widgets.dart';

class HomeScreens extends StatefulWidget {
  @override
  _HomeScreensState createState() => _HomeScreensState();
}

class _HomeScreensState extends State<HomeScreens> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    if (user == null) {
      return OnboardingScreen();
    } else {
      return StreamBuilder<UserData>(
          stream: DatabaseService(uid: user.uId).userData,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            UserData userData = snapshot.data;
            return HomeWidgets(
                uId: userData.uid,
                userEmail: userData.userEmail,
                fullName: userData.fullName,
                isTeacher: userData.isTeacher);
          });
    }
  }
}
