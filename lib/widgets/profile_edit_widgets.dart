import 'dart:io';

import 'package:Lument/models/userData.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:provider/provider.dart';

import './image_picker_widgets.dart';
import '../models/authServices.dart';
import '../models/users.dart';
import '../models/DatabaseService.dart';

import './style.dart';

class ProfileEditWidgets extends StatefulWidget {
  final String userEmail;
  final String fullName;
  final bool isTeacher;
  ProfileEditWidgets(
      {@required this.userEmail,
      @required this.fullName,
      @required this.isTeacher});
  @override
  _ProfileEditWidgetsState createState() => _ProfileEditWidgetsState();
}

class _ProfileEditWidgetsState extends State<ProfileEditWidgets> {
  final formKey = GlobalKey<FormState>();
  var profileImageUrl = '';
  var designation = '';
  var userPhone = '';
  var classID = '';
  var userDepartment = '';
  File userImageFile;
  var isLoading = false;
  File imageFile;

  void pickedImage(File image) {
    imageFile = image;
  }

  saveForm(
      String uId, String userEmail, String fullName, bool isTeacher) async {
    if (imageFile == null) {
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text('Please pick an image'),
        backgroundColor: Theme.of(context).primaryColor,
      ));
      return;
    }

    final ref =
        FirebaseStorage.instance.ref().child('userImage').child(uId + '.jpg');
    await ref.putFile(imageFile).onComplete;

    profileImageUrl = await ref.getDownloadURL();

    if (formKey.currentState.validate()) {
      formKey.currentState.save();
      await DatabaseService(uid: uId).updateProfileData(
          userEmail,
          fullName,
          isTeacher,
          profileImageUrl,
          designation,
          userPhone,
          classID,
          userDepartment);

      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Edit',
          style: Theme.of(context).appBarTheme.textTheme.title.copyWith(
                color: textdark20,
              ),
        ),
        backgroundColor: background100,
        iconTheme: IconThemeData(
          color: textdark20,
        ),
        brightness: Brightness.light,
        elevation: 0.0,
        actions: [
          Row(
            children: <Widget>[
              FlatButton(
                child: Text('Cancel'.toUpperCase(),
                    style: Theme.of(context).textTheme.button.copyWith(
                          color: textLight60,
                        )),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              FlatButton(
                child: Text('Save'.toUpperCase(),
                    style: Theme.of(context).textTheme.button.copyWith(
                          color: Theme.of(context).primaryColor,
                        )),
                onPressed: () {
                  saveForm(user.uId, widget.userEmail, widget.fullName,
                      widget.isTeacher);
                },
              ),
            ],
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(
            top: 16.0,
            right: 32.0,
            bottom: 8.0,
            left: 32.0,
          ),
          child: Column(
            children: <Widget>[
              Column(
                children: [
                  ImagePickerWidgets(pickedImage),
                  SizedBox(
                    height: 16.0,
                  ),
                  Form(
                    key: formKey,
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          validator: (value) {
                            if (value.isEmpty ||
                                value.length < 4 ||
                                value.length > 40) {
                              return 'Enter a valid designation';
                            }
                            return null;
                          },
                          key: ValueKey('Designation'),
                          decoration: InputDecoration(
                            labelText: 'Designation',
                            labelStyle: labelTextStyle,
                          ),
                          onSaved: (value) {
                            designation = value;
                          },
                        ),
                        SizedBox(
                          height: 16.0,
                        ),
                        TextFormField(
                          validator: (value) {
                            if (value.isEmpty ||
                                value.length < 10 ||
                                value.length > 13) {
                              return 'Enter a valid phone number';
                            }
                            return null;
                          },
                          key: ValueKey('PhoneNumber'),
                          decoration: InputDecoration(
                            labelText: 'Phone Number',
                            labelStyle: labelTextStyle,
                          ),
                          keyboardType: TextInputType.number,
                          onSaved: (value) {
                            userPhone = value;
                          },
                        ),
                        SizedBox(
                          height: 16.0,
                        ),
                        TextFormField(
                          validator: (value) {
                            if (value.isEmpty || value.length < 7) {
                              return 'Enter a valid class ID';
                            }
                            return null;
                          },
                          key: ValueKey('IdNumber'),
                          decoration: InputDecoration(
                            labelText: 'ID Number',
                            labelStyle: labelTextStyle,
                          ),
                          keyboardType: TextInputType.number,
                          onSaved: (value) {
                            classID = value;
                          },
                        ),
                        SizedBox(
                          height: 16.0,
                        ),
                        TextFormField(
                          validator: (value) {
                            if (value.isEmpty ||
                                value.length < 2 ||
                                value.length > 40) {
                              return 'Enter a valid department';
                            }
                            return null;
                          },
                          key: ValueKey('Department'),
                          decoration: InputDecoration(
                            labelText: 'Department',
                            labelStyle: labelTextStyle,
                          ),
                          onSaved: (value) {
                            userDepartment = value;
                          },
                        ),
                        SizedBox(
                          height: 16.0,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
