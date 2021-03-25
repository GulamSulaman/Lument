import 'package:flutter/material.dart';
import 'package:random_string/random_string.dart';

import '../models/DatabaseService.dart';
import './style.dart';

class MaterialUploadWidgets extends StatefulWidget {
  final String materialCreatorName;
  final String classId;
  MaterialUploadWidgets(
      {@required this.materialCreatorName, @required this.classId});
  @override
  _MaterialUploadWidgetsState createState() => _MaterialUploadWidgetsState();
}

class _MaterialUploadWidgetsState extends State<MaterialUploadWidgets> {
  final formKey = GlobalKey<FormState>();
  var materialId = '';
  var materialTitle = '';
  var materialDescription = '';
  var materialLink = '';
  var isLoading = false;

  upload() async {
    if (formKey.currentState.validate()) {
      setState(() {
        isLoading = true;
      });
      formKey.currentState.save();
      materialId = randomAlphaNumeric(10);
      await DatabaseService()
          .materialUpload(
        widget.classId,
        materialId,
        widget.materialCreatorName,
        materialTitle,
        materialDescription,
        materialLink,
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
            child: Text('Upload'.toUpperCase(),
                style: Theme.of(context).textTheme.button.copyWith(
                      color: Theme.of(context).primaryColor,
                    )),
            onPressed: upload,
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Upload Materials',
                          style: Theme.of(context).textTheme.headline4,
                          textAlign: TextAlign.start,
                        ),
                        SizedBox(
                          height: 8.0,
                        ),
                        Text(
                          'Fill out the form to uplod meterials',
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
                                return 'Enter a valid Title';
                              }
                              return null;
                            },
                            key: ValueKey('materialTitle'),
                            decoration: InputDecoration(
                              labelText: 'Material Title',
                              labelStyle: labelTextStyle,
                            ),
                            onSaved: (value) {
                              materialTitle = value;
                            },
                          ),
                          SizedBox(
                            height: 16.0,
                          ),
                          TextFormField(
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Enter a valid description';
                              }
                              return null;
                            },
                            key: ValueKey('materialDescription'),
                            maxLines: 3,
                            decoration: InputDecoration(
                              labelText: 'Material Description',
                              labelStyle: labelTextStyle,
                            ),
                            onSaved: (value) {
                              materialDescription = value;
                            },
                          ),
                          SizedBox(
                            height: 16.0,
                          ),
                          TextFormField(
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Enter a valid link';
                              }
                              return null;
                            },
                            key: ValueKey('materialLink'),
                            decoration: InputDecoration(
                              labelText: 'Material Link',
                              labelStyle: labelTextStyle,
                            ),
                            onSaved: (value) {
                              materialLink = value;
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
    ;
  }
}

// class CreateClassWidgets extends StatefulWidget {
//   final String classCreatorName;
//   CreateClassWidgets({@required this.classCreatorName});
//   @override
//   _CreateClassWidgetsState createState() => _CreateClassWidgetsState();
// }

// class _CreateClassWidgetsState extends State<CreateClassWidgets> {
//   final formKey = GlobalKey<FormState>();
//   var classId = '';
//   var classSubjectName = '';
//   var classDepartment = '';
//   var classBatch = '';
//   var classSection = '';
//   var selectedBackgroundColor = '';
//   //var selectedBackgroundColor = 'redAccent[700]';
//   var backgroundColor = Colors.cyan[800];
//   var isLoading = false;

//   //Color selectedBackgroundColor;

//   createClass() async {
//     if (formKey.currentState.validate()) {
//       setState(() {
//         isLoading = true;
//       });
//       formKey.currentState.save();
//       classId = randomAlphaNumeric(10);
//       await DatabaseService()
//           .addClassData(
//               widget.classCreatorName,
//               classId,
//               classSubjectName,
//               classDepartment,
//               classBatch,
//               classSection,
//               selectedBackgroundColor)
//           .then((value) {
//         setState(() {
//           isLoading = false;
//         });
//         Navigator.of(context).pop();
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return
//   }
// }
