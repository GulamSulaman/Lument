import 'package:flutter/material.dart';

import './createClass_widget.dart';
import './style.dart';

class CreateOrJoinClassWidgets extends StatefulWidget {
  final String userEmail;
  final String fullName;
  final bool isTeacher;
  CreateOrJoinClassWidgets(
      {@required this.userEmail,
      @required this.fullName,
      @required this.isTeacher});
  @override
  _CreateOrJoinClassWidgetsState createState() =>
      _CreateOrJoinClassWidgetsState();
}

class _CreateOrJoinClassWidgetsState extends State<CreateOrJoinClassWidgets> {
  final formKey = GlobalKey<FormState>();
  var classSubjectName = '';
  var classDepartment = '';
  var classBatch = '';
  var classSection = '';
  var backgroundColor = Colors.cyan[800];

  Color selectedBackgroundColor;

  @override
  Widget build(BuildContext context) {
    return CreateClassWidgets(
      classCreatorName: widget.fullName,
    );
    // return Scaffold(
    //   appBar: AppBar(
    //     backgroundColor: background100,
    //     iconTheme: IconThemeData(
    //       color: textdark20,
    //     ),
    //     brightness: Brightness.light,
    //     elevation: 0.0,
    //     actions: [
    //       FlatButton(
    //         child: Text('Create Class'.toUpperCase(),
    //             style: Theme.of(context).textTheme.button.copyWith(
    //                   color: Theme.of(context).primaryColor,
    //                 )),
    //         onPressed: () {},
    //       ),
    //     ],
    //   ),
    //   body: SingleChildScrollView(
    //     child: Container(
    //       padding: EdgeInsets.only(
    //         top: 16.0,
    //         right: 32.0,
    //         bottom: 8.0,
    //         left: 32.0,
    //       ),
    //       child: Column(
    //         children: <Widget>[
    //           Column(
    //             children: <Widget>[
    //               Text(
    //                 'Create Class',
    //                 style: Theme.of(context).textTheme.headline4,
    //               ),
    //               SizedBox(
    //                 height: 8.0,
    //               ),
    //               Text(
    //                 'Fill out the form to create class',
    //                 style: Theme.of(context).textTheme.subtitle1,
    //               ),
    //             ],
    //           ),
    //           SizedBox(
    //             height: 16.0,
    //           ),
    //           Form(
    //             key: formKey,
    //             child: Column(
    //               children: <Widget>[
    //                 TextFormField(
    //                   validator: (value) {
    //                     if (value.isEmpty ||
    //                         value.length < 4 ||
    //                         value.length > 20) {
    //                       return 'Enter a valid subject name';
    //                     }
    //                     return null;
    //                   },
    //                   key: ValueKey('ClassSubjectName'),
    //                   decoration: InputDecoration(
    //                     labelText: 'Subject Name',
    //                     labelStyle: labelTextStyle,
    //                   ),
    //                   onSaved: (value) {
    //                     classSubjectName = value;
    //                   },
    //                 ),
    //                 SizedBox(
    //                   height: 16.0,
    //                 ),
    //                 TextFormField(
    //                   validator: (value) {
    //                     if (value.isEmpty || value.length > 4) {
    //                       return 'Enter a valid department name';
    //                     }
    //                     return null;
    //                   },
    //                   key: ValueKey('ClassDepartment'),
    //                   decoration: InputDecoration(
    //                     labelText: 'Department',
    //                     labelStyle: labelTextStyle,
    //                   ),
    //                   onSaved: (value) {
    //                     classDepartment = value;
    //                   },
    //                 ),
    //                 SizedBox(
    //                   height: 16.0,
    //                 ),
    //                 TextFormField(
    //                   validator: (value) {
    //                     if (value.isEmpty || value.length > 4) {
    //                       return 'Enter a valid batch name';
    //                     }
    //                     return null;
    //                   },
    //                   key: ValueKey('ClassBatch'),
    //                   decoration: InputDecoration(
    //                     labelText: 'Batch',
    //                     labelStyle: labelTextStyle,
    //                   ),
    //                   onSaved: (value) {
    //                     classBatch = value;
    //                   },
    //                 ),
    //                 SizedBox(
    //                   height: 16.0,
    //                 ),
    //                 TextFormField(
    //                   validator: (value) {
    //                     if (value.isEmpty || value.length > 1) {
    //                       return 'Enter a valid section name';
    //                     }
    //                     return null;
    //                   },
    //                   key: ValueKey('ClassSection'),
    //                   decoration: InputDecoration(
    //                     labelText: 'Section',
    //                     labelStyle: labelTextStyle,
    //                   ),
    //                   onSaved: (value) {
    //                     classSection = value;
    //                   },
    //                 ),
    //                 SizedBox(
    //                   height: 16.0,
    //                 ),
    //                 Text(
    //                   'Select Background Image',
    //                   style: Theme.of(context).textTheme.subtitle1.copyWith(
    //                         color: textLight85,
    //                         fontSize: 14.0,
    //                       ),
    //                 ),
    //                 SizedBox(
    //                   height: 8.0,
    //                 ),
    //                 Container(
    //                   width: MediaQuery.of(context).size.width - 32.0,
    //                   child: SingleChildScrollView(
    //                     scrollDirection: Axis.horizontal,
    //                     child: Expanded(
    //                       child: Row(
    //                         children: [
    //                           GestureDetector(
    //                             child: Container(
    //                               width: 64,
    //                               height: 64,
    //                               color: Colors.redAccent[700],
    //                             ),
    //                             onTap: () {
    //                               selectedBackgroundColor =
    //                                   Colors.redAccent[700];
    //                             },
    //                           ),
    //                           SizedBox(
    //                             width: 4.0,
    //                           ),
    //                           GestureDetector(
    //                             child: Container(
    //                               width: 64,
    //                               height: 64,
    //                               color: Colors.deepPurpleAccent[700],
    //                             ),
    //                             onTap: () {
    //                               selectedBackgroundColor =
    //                                   Colors.deepPurpleAccent[700];
    //                             },
    //                           ),
    //                           SizedBox(
    //                             width: 4.0,
    //                           ),
    //                           GestureDetector(
    //                             child: Container(
    //                               width: 64,
    //                               height: 64,
    //                               color: Colors.blueAccent[700],
    //                             ),
    //                             onTap: () {
    //                               selectedBackgroundColor =
    //                                   Colors.blueAccent[700];
    //                             },
    //                           ),
    //                           SizedBox(
    //                             width: 4.0,
    //                           ),
    //                           GestureDetector(
    //                             child: Container(
    //                               width: 64,
    //                               height: 64,
    //                               color: Colors.greenAccent[700],
    //                             ),
    //                             onTap: () {
    //                               selectedBackgroundColor =
    //                                   Colors.greenAccent[700];
    //                             },
    //                           ),
    //                           SizedBox(
    //                             width: 4.0,
    //                           ),
    //                           GestureDetector(
    //                             child: Container(
    //                               width: 64,
    //                               height: 64,
    //                               color: Colors.yellowAccent[700],
    //                             ),
    //                             onTap: () {
    //                               selectedBackgroundColor =
    //                                   Colors.yellowAccent[700];
    //                             },
    //                           ),
    //                           SizedBox(
    //                             width: 4.0,
    //                           ),
    //                           GestureDetector(
    //                             child: Container(
    //                               width: 64,
    //                               height: 64,
    //                               color: Colors.amberAccent[700],
    //                             ),
    //                             onTap: () {
    //                               selectedBackgroundColor =
    //                                   Colors.amberAccent[700];
    //                             },
    //                           ),
    //                           SizedBox(
    //                             width: 4.0,
    //                           ),
    //                           GestureDetector(
    //                             child: Container(
    //                               width: 64,
    //                               height: 64,
    //                               color: Colors.pinkAccent[700],
    //                             ),
    //                             onTap: () {
    //                               selectedBackgroundColor =
    //                                   Colors.pinkAccent[700];
    //                             },
    //                           ),
    //                         ],
    //                       ),
    //                     ),
    //                   ),
    //                 )
    //               ],
    //             ),
    //           )
    //         ],
    //       ),
    //     ),
    //   ),
    // );
  }
}
