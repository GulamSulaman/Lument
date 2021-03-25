import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../screens/class_screens.dart';
import '../screens/profile_screens.dart';
import '../screens/signin_screens.dart';
import './CreateOrJoinClass_widgets.dart';
import './profile_edit_widgets.dart';
import './style.dart';
import '../models/userClass.dart';
import '../models/authServices.dart';
import '../models/userData.dart';
import '../models/DatabaseService.dart';
import '../models/profile.dart';
import '../models/users.dart';

class HomeWidgets extends StatefulWidget {
  final String uId;
  final String userEmail;
  final String fullName;
  final bool isTeacher;
  HomeWidgets({this.uId, this.userEmail, this.fullName, this.isTeacher});
  @override
  _HomeWidgetsState createState() => _HomeWidgetsState();
}

class _HomeWidgetsState extends State<HomeWidgets> {
  Stream profileDataStream;
  DatabaseService databaseservice = new DatabaseService();

  AuthServices authServices = new AuthServices();
  final tabs = [];
  var isLoading = false;
  var _currentIndex = 0;

  @override
  void initState() {
    databaseservice.getProfileinfo(widget.uId).then((value) {
      profileDataStream = value;
      setState(() {});
    });
    super.initState();
  }

  // tabs[_currentIndex]
  // final tabs = [
  //   Center(
  //     child: Text('Class Screen'),
  //   ),
  //   Container(
  //     child: StreamBuilder<UserProfileData>(
  //         stream: DatabaseService().profileData,
  //         builder: (context, profileDataSnapshot) {

  //           if (profileDataSnapshot.connectionState ==
  //               ConnectionState.waiting) {
  //             return Center(
  //               child: CircularProgressIndicator(),
  //             );
  //           }

  //           UserProfileData userProfileData = profileDataSnapshot.data;
  //           return ProfileScreen(
  //             userEmail: userProfileData.userEmail,
  //             fullName: userProfileData.fullName,
  //             isTeacher: userProfileData.isTeacher,
  //             profileImageUrl: userProfileData.profileImageUrl,
  //             designation: userProfileData.designation,
  //             userPhone: userProfileData.userPhone,
  //             classID: userProfileData.classID,
  //             userDepartment: userProfileData.userDepartment,
  //           );
  //         }),
  //   ),
  // ];

  signOut() async {
    setState(() {
      isLoading = true;
    });
    await authServices.signOut().then((val) {
      setState(() {
        isLoading = false;
      });
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => SignInScreen(),
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    return Scaffold(
      backgroundColor: background100,
      appBar: AppBar(
        title: Text(
          _currentIndex == 1 ? 'Profile' : 'Home',
          style: Theme.of(context).appBarTheme.textTheme.title.copyWith(
                color: textdark20,
              ),
        ),
        elevation: 0.0,
        backgroundColor: background100,
        actions: <Widget>[
          _currentIndex == 1
              ? FlatButton.icon(
                  icon: Icon(
                    Icons.logout,
                    color: Theme.of(context).errorColor,
                  ),
                  label: Text('Sign Out'.toUpperCase(),
                      style: Theme.of(context).textTheme.button.copyWith(
                            color: Theme.of(context).errorColor,
                          )),
                  onPressed: signOut,
                )
              : Container(),
        ],
      ),
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0.0,
        currentIndex: _currentIndex,
        backgroundColor: background100,
        type: BottomNavigationBarType.fixed,
        selectedFontSize: 12,
        unselectedFontSize: 12,
        selectedLabelStyle: TextStyle(
          color: Theme.of(context).primaryColor,
          fontFamily: fontNameDefault,
          fontWeight: FontWeight.w500,
        ),
        unselectedLabelStyle: TextStyle(
          color: textLight85,
          fontFamily: fontNameDefault,
          fontWeight: FontWeight.w500,
        ),
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_outlined,
            ),
            label: 'Home',
            backgroundColor: Theme.of(context).primaryColor,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person_outlined,
            ),
            label: 'Profile',
            backgroundColor: Theme.of(context).primaryColor,
          ),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          _currentIndex == 1 ? Icons.edit : Icons.add_outlined,
          color: background100,
        ),
        backgroundColor: Theme.of(context).accentColor,
        onPressed: () {
          if (_currentIndex == 1) {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => ProfileEditWidgets(
                userEmail: widget.userEmail,
                fullName: widget.fullName,
                isTeacher: widget.isTeacher,
              ),
            ));
          } else {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => CreateOrJoinClassWidgets(
                userEmail: widget.userEmail,
                fullName: widget.fullName,
                isTeacher: widget.isTeacher,
              ),
            ));
          }
        },
        elevation: 3.0,
      ),
      body: _currentIndex == 0
          ? Container(
              child: StreamProvider<List<UserClass>>.value(
              value: DatabaseService().classDataFs,
              child: ClassScreen(),
            ))
          : Container(
              child: StreamBuilder(
                  stream: profileDataStream,
                  builder: (context, snapshot) {
                    UserProfileData userProfileData = snapshot.data;
                    return snapshot.data == null
                        ? Center(
                            child: CircularProgressIndicator(),
                          )
                        : ListView.builder(
                            itemCount: snapshot.data.documents.length,
                            itemBuilder: (context, index) {
                              final profilesnapshot =
                                  snapshot.data.documents[index].data;
                              return ProfileScreen(
                                classID: profilesnapshot['classID'],
                                designation: profilesnapshot['designation'],
                                fullName: profilesnapshot['fullName'],
                                isTeacher: profilesnapshot['isTeacher'],
                                profileImageUrl:
                                    profilesnapshot['profileImageUrl'],
                                userDepartment:
                                    profilesnapshot['userDepartment'],
                                userEmail: profilesnapshot['userEmail'],
                                userPhone: profilesnapshot['userPhone'],
                              );
                            },
                          );
                  }),
            ),
    );
  }
}

// ProfileScreen(
//                             userEmail: widget.userEmail,
//                             fullName: widget.fullName,
//                             isTeacher: widget.isTeacher,
//                             profileImageUrl: userProfileData.profileImageUrl,
//                             designation: userProfileData.designation,
//                             userPhone: userProfileData.userPhone,
//                             classID: userProfileData.classID,
//                             userDepartment: userProfileData.userDepartment,
//                           );
