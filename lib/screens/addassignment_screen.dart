import 'package:Lument/models/DatabaseService.dart';
import 'package:Lument/models/assignmentForm.dart';
import 'package:flutter/material.dart';
import 'package:random_string/random_string.dart';

import '../widgets/style.dart';

class AddAssignment extends StatefulWidget {
  final String classId;
  final String materialId;
  final String creatorName;

  AddAssignment(
      {@required this.classId,
      @required this.creatorName,
      @required this.materialId});

  @override
  _AddAssignmentState createState() => _AddAssignmentState();
}

class _AddAssignmentState extends State<AddAssignment> {
  final formKey = GlobalKey<FormState>();
  var questions = '';
  var answers = '';
  var assignmentId = '';
  var isLoading = false;

  addAssignment() async {
    if (formKey.currentState.validate()) {
      setState(() {
        isLoading = true;
      });
      formKey.currentState.save();
      assignmentId = randomAlphaNumeric(10);
      await DatabaseService()
          .assignmentUpload(
        widget.creatorName,
        widget.classId,
        widget.materialId,
        assignmentId,
        questions,
        answers,
      )
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
            child: Text('Add'.toUpperCase(),
                style: Theme.of(context).textTheme.button.copyWith(
                      color: Theme.of(context).primaryColor,
                    )),
            onPressed: addAssignment,
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
                          'Create Assignment',
                          style: Theme.of(context).textTheme.headline4,
                          textAlign: TextAlign.start,
                        ),
                        SizedBox(
                          height: 8.0,
                        ),
                        Text(
                          'Fill out the form to create Assignment',
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
                                return 'Enter a valid questions';
                              }
                              return null;
                            },
                            key: ValueKey('questions'),
                            decoration: InputDecoration(
                              labelText: 'questions',
                              labelStyle: labelTextStyle,
                            ),
                            maxLines: 3,
                            onSaved: (value) {
                              questions = value;
                            },
                          ),
                          SizedBox(
                            height: 16.0,
                          ),
                          TextFormField(
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Enter a valid answers';
                              }
                              return null;
                            },
                            key: ValueKey('answers'),
                            decoration: InputDecoration(
                              labelText: 'answers',
                              labelStyle: labelTextStyle,
                            ),
                            maxLines: 3,
                            onSaved: (value) {
                              answers = value;
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
              ),
            ),
    );
  }
}
