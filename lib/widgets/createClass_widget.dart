import 'package:flutter/material.dart';
import 'package:random_string/random_string.dart';

import '../models/DatabaseService.dart';
import './style.dart';

class CreateClassWidgets extends StatefulWidget {
  final String classCreatorName;
  CreateClassWidgets({@required this.classCreatorName});
  @override
  _CreateClassWidgetsState createState() => _CreateClassWidgetsState();
}

class _CreateClassWidgetsState extends State<CreateClassWidgets> {
  final formKey = GlobalKey<FormState>();
  var classId = '';
  var classSubjectName = '';
  var classDepartment = '';
  var classBatch = '';
  var classSection = '';
  var selectedBackgroundColor = '';
  //var selectedBackgroundColor = 'redAccent[700]';
  var backgroundColor = Colors.cyan[800];
  var isLoading = false;

  //Color selectedBackgroundColor;

  createClass() async {
    if (formKey.currentState.validate()) {
      setState(() {
        isLoading = true;
      });
      formKey.currentState.save();
      classId = randomAlphaNumeric(10);
      await DatabaseService()
          .addClassData(
              widget.classCreatorName,
              classId,
              classSubjectName,
              classDepartment,
              classBatch,
              classSection,
              selectedBackgroundColor)
          .then((value) {
        setState(() {
          isLoading = false;
        });
        Navigator.of(context).pop();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: background100,
        iconTheme: IconThemeData(
          color: textdark20,
        ),
        brightness: Brightness.light,
        elevation: 0.0,
        actions: [
          FlatButton(
            child: Text('Create Class'.toUpperCase(),
                style: Theme.of(context).textTheme.button.copyWith(
                      color: Theme.of(context).primaryColor,
                    )),
            onPressed: createClass,
          ),
        ],
      ),
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                  top: 16.0,
                  right: 32.0,
                  bottom: 8.0,
                  left: 32.0,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Create Class',
                          style: Theme.of(context).textTheme.headline4,
                          textAlign: TextAlign.start,
                        ),
                        SizedBox(
                          height: 8.0,
                        ),
                        Text(
                          'Fill out the form to create class',
                          style: Theme.of(context).textTheme.subtitle1,
                          textAlign: TextAlign.start,
                        ),
                      ],
                    ),
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
                                  value.length > 20) {
                                return 'Enter a valid subject name';
                              }
                              return null;
                            },
                            key: ValueKey('ClassSubjectName'),
                            decoration: InputDecoration(
                              labelText: 'Subject Name',
                              labelStyle: labelTextStyle,
                            ),
                            onSaved: (value) {
                              classSubjectName = value;
                            },
                          ),
                          SizedBox(
                            height: 16.0,
                          ),
                          TextFormField(
                            validator: (value) {
                              if (value.isEmpty || value.length > 4) {
                                return 'Enter a valid department name';
                              }
                              return null;
                            },
                            key: ValueKey('ClassDepartment'),
                            decoration: InputDecoration(
                              labelText: 'Department',
                              labelStyle: labelTextStyle,
                            ),
                            onSaved: (value) {
                              classDepartment = value;
                            },
                          ),
                          SizedBox(
                            height: 16.0,
                          ),
                          TextFormField(
                            validator: (value) {
                              if (value.isEmpty || value.length > 4) {
                                return 'Enter a valid batch name';
                              }
                              return null;
                            },
                            key: ValueKey('ClassBatch'),
                            decoration: InputDecoration(
                              labelText: 'Batch',
                              labelStyle: labelTextStyle,
                            ),
                            onSaved: (value) {
                              classBatch = value;
                            },
                          ),
                          SizedBox(
                            height: 16.0,
                          ),
                          TextFormField(
                            validator: (value) {
                              if (value.isEmpty || value.length > 1) {
                                return 'Enter a valid section name';
                              }
                              return null;
                            },
                            key: ValueKey('ClassSection'),
                            decoration: InputDecoration(
                              labelText: 'Section',
                              labelStyle: labelTextStyle,
                            ),
                            onSaved: (value) {
                              classSection = value;
                            },
                          ),
                          SizedBox(
                            height: 16.0,
                          ),
                          Text(
                            'Select Background Image',
                            style:
                                Theme.of(context).textTheme.subtitle1.copyWith(
                                      color: textLight85,
                                      fontSize: 14.0,
                                    ),
                            textAlign: TextAlign.start,
                          ),
                          SizedBox(
                            height: 8.0,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width - 32.0,
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Container(
                                child: Row(
                                  children: [
                                    GestureDetector(
                                      child: Container(
                                        width: 64,
                                        height: 64,
                                        color: Colors.redAccent[700],
                                      ),
                                      onTap: () {
                                        selectedBackgroundColor =
                                            'redAccent[700]';
                                      },
                                    ),
                                    SizedBox(
                                      width: 4.0,
                                    ),
                                    GestureDetector(
                                      child: Container(
                                        width: 64,
                                        height: 64,
                                        color: Colors.deepPurpleAccent[700],
                                      ),
                                      onTap: () {
                                        selectedBackgroundColor =
                                            'deepPurpleAccent[700]';
                                      },
                                    ),
                                    SizedBox(
                                      width: 4.0,
                                    ),
                                    GestureDetector(
                                      child: Container(
                                        width: 64,
                                        height: 64,
                                        color: Colors.blueAccent[700],
                                      ),
                                      onTap: () {
                                        selectedBackgroundColor =
                                            'blueAccent[700]';
                                      },
                                    ),
                                    SizedBox(
                                      width: 4.0,
                                    ),
                                    GestureDetector(
                                      child: Container(
                                        width: 64,
                                        height: 64,
                                        color: Colors.greenAccent[700],
                                      ),
                                      onTap: () {
                                        selectedBackgroundColor =
                                            'greenAccent[700]';
                                      },
                                    ),
                                    SizedBox(
                                      width: 4.0,
                                    ),
                                    GestureDetector(
                                      child: Container(
                                        width: 64,
                                        height: 64,
                                        color: Colors.yellowAccent[700],
                                      ),
                                      onTap: () {
                                        selectedBackgroundColor =
                                            'yellowAccent[700]';
                                      },
                                    ),
                                    SizedBox(
                                      width: 4.0,
                                    ),
                                    GestureDetector(
                                      child: Container(
                                        width: 64,
                                        height: 64,
                                        color: Colors.amberAccent[700],
                                      ),
                                      onTap: () {
                                        selectedBackgroundColor =
                                            'amberAccent[700]';
                                      },
                                    ),
                                    SizedBox(
                                      width: 4.0,
                                    ),
                                    GestureDetector(
                                      child: Container(
                                        width: 64,
                                        height: 64,
                                        color: Colors.pinkAccent[700],
                                      ),
                                      onTap: () {
                                        selectedBackgroundColor =
                                            'pinkAccent[700]';
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
    );
  }
}
