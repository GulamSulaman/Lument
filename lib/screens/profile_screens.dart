import 'package:Lument/widgets/profile_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './signin_screens.dart';
import '../widgets/style.dart';
import '../models/profile.dart';
import '../models/userData.dart';
import '../models/authServices.dart';
import '../models/DatabaseService.dart';
import '../models/users.dart';

class ProfileScreen extends StatefulWidget {
  final String userEmail;
  final String fullName;
  final bool isTeacher;
  final String profileImageUrl;
  final String designation;
  final String userPhone;
  final String classID;
  final String userDepartment;
  ProfileScreen({
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
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    return ProfileWidgets(
      userEmail: widget.userEmail,
      fullName: widget.fullName,
      isTeacher: widget.isTeacher,
      profileImageUrl: widget.profileImageUrl,
      designation: widget.designation,
      userPhone: widget.userPhone,
      classID: widget.classID,
      userDepartment: widget.userDepartment,
    );
  }
}
