import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../screens/signin_screens.dart';
import '../widgets/style.dart';
import '../models/profile.dart';
import '../models/userData.dart';
import '../models/authServices.dart';
import '../models/DatabaseService.dart';
import '../models/users.dart';

class ProfileWidgets extends StatefulWidget {
  final String userEmail;
  final String fullName;
  final bool isTeacher;
  final String profileImageUrl;
  final String designation;
  final String userPhone;
  final String classID;
  final String userDepartment;

  ProfileWidgets({
    @required this.userEmail,
    @required this.fullName,
    @required this.isTeacher,
    @required this.profileImageUrl,
    @required this.designation,
    @required this.userPhone,
    @required this.classID,
    @required this.userDepartment,
  });

  @override
  _ProfileWidgetsState createState() => _ProfileWidgetsState();
}

class _ProfileWidgetsState extends State<ProfileWidgets> {
  AuthServices authServices = new AuthServices();

  var isLoading = false;
  var currentprofileImageUrl =
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRuWlKVGJeILLo6n3_-9GgvdvWyz7MJbC1o7g&usqp=CAU';
  var currentfullName = 'Please edit the name';
  var currentdesignation = 'Please edit the designation';
  var currentuserEmail = 'please edit the email';
  var currentuserPhone = 'Please edit the phone number';
  var currentuserDepartment = 'Please edit the department name';
  var currentclassID = 'Please edit the ID';

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
    return Scaffold(
      body: Container(
        //color: Colors.red,
        padding: EdgeInsets.only(
          top: 16.0,
          right: 32.0,
          bottom: 8.0,
          left: 32.0,
        ),
        //height: MediaQuery.of(context).size.height * 1.0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  height: 150.0,
                  width: 150.0,
                  padding: EdgeInsets.all(15.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(75.0),
                      border: Border.all(
                        width: 2.0,
                        color: Theme.of(context).primaryColor,
                      )),
                  child: CircleAvatar(
                    backgroundColor: lineColor,
                    backgroundImage: NetworkImage(
                      currentprofileImageUrl ?? widget.profileImageUrl,
                    ),
                    radius: 60,
                  ),
                ),
                SizedBox(
                  height: 16.0,
                ),
                Text(
                  currentfullName ?? widget.fullName,
                  style: Theme.of(context).textTheme.headline6.copyWith(
                        color: textdark20,
                      ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 4.0,
                ),
                Container(
                  width: MediaQuery.of(context).size.width - 32.0,
                  child: Text(
                    currentdesignation ?? widget.designation,
                    style: Theme.of(context).textTheme.bodyText1.copyWith(
                          color: textLight60,
                        ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: 16.0,
                ),
                Divider(),
              ],
            ),
            Column(
              children: <Widget>[
                SizedBox(
                  height: 16.0,
                ),
                Container(
                  width: MediaQuery.of(context).size.width - 32.0,
                  child: Text(
                    'Personal Information',
                    style: Theme.of(context).textTheme.subtitle2,
                  ),
                ),
                SizedBox(
                  height: 16.0,
                ),
                SingleChildScrollView(
                  child: Container(
                    width: MediaQuery.of(context).size.width - 32.0,
                    height: 249,
                    child: ListView(
                      children: <Widget>[
                        ListTile(
                          leading: Container(
                            width: 44.0,
                            height: 44.0,
                            child: Icon(
                              Icons.mail_outline,
                              color: textLight60,
                            ),
                          ),
                          title: Text(
                            'Email',
                            style:
                                Theme.of(context).textTheme.subtitle2.copyWith(
                                      fontWeight: FontWeight.normal,
                                    ),
                          ),
                          subtitle: Text(
                            currentuserEmail ?? widget.userEmail,
                            style:
                                Theme.of(context).textTheme.subtitle1.copyWith(
                                      color: textdark40,
                                    ),
                          ),
                        ),
                        SizedBox(
                          height: 16.0,
                        ),
                        ListTile(
                          leading: Container(
                            width: 44.0,
                            height: 44.0,
                            child: Icon(
                              Icons.call_outlined,
                              color: textLight60,
                            ),
                          ),
                          title: Text(
                            'Phone Number',
                            style:
                                Theme.of(context).textTheme.subtitle2.copyWith(
                                      fontWeight: FontWeight.normal,
                                    ),
                          ),
                          subtitle: Text(
                            currentuserPhone ?? widget.userPhone,
                            style:
                                Theme.of(context).textTheme.subtitle1.copyWith(
                                      color: textdark40,
                                    ),
                          ),
                        ),
                        SizedBox(
                          height: 16.0,
                        ),
                        ListTile(
                          leading: Container(
                            width: 44.0,
                            height: 44.0,
                            child: Icon(
                              Icons.school_outlined,
                              color: textLight60,
                            ),
                          ),
                          title: Text(
                            'Department',
                            style:
                                Theme.of(context).textTheme.subtitle2.copyWith(
                                      fontWeight: FontWeight.normal,
                                    ),
                          ),
                          subtitle: Text(
                            currentuserDepartment ?? widget.userDepartment,
                            style:
                                Theme.of(context).textTheme.subtitle1.copyWith(
                                      color: textdark40,
                                    ),
                          ),
                        ),
                        SizedBox(
                          height: 16.0,
                        ),
                        ListTile(
                          leading: Container(
                            width: 44.0,
                            height: 44.0,
                            child: Icon(
                              Icons.tag,
                              color: textLight60,
                            ),
                          ),
                          title: Text(
                            'ID Number',
                            style:
                                Theme.of(context).textTheme.subtitle2.copyWith(
                                      fontWeight: FontWeight.normal,
                                    ),
                          ),
                          subtitle: Text(
                            currentclassID ?? widget.classID,
                            style:
                                Theme.of(context).textTheme.subtitle1.copyWith(
                                      color: textdark40,
                                    ),
                          ),
                        ),
                        SizedBox(
                          height: 16.0,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
