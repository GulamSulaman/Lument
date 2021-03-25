import 'package:Lument/models/DatabaseService.dart';
import 'package:Lument/models/materialData.dart';
import 'package:Lument/widgets/materialsItems_Widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/userClass.dart';
import '../widgets/material_upload_widget.dart';
import '../widgets/style.dart';
import '../widgets/materialList_widgets.dart';

class MaterialScreen extends StatefulWidget {
  final String classSubjectName;
  final String creatorName;
  final String classId;
  MaterialScreen({
    @required this.classSubjectName,
    @required this.creatorName,
    @required this.classId,
  });

  @override
  _MaterialScreenState createState() => _MaterialScreenState();
}

class _MaterialScreenState extends State<MaterialScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.redAccent[700],
      appBar: AppBar(
        title: Text(
          widget.classSubjectName,
          style: Theme.of(context).appBarTheme.textTheme.title.copyWith(
                color: textLight100,
              ),
        ),
        backgroundColor: Colors.redAccent[700],
        elevation: 0.0,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add_outlined,
          color: background100,
        ),
        backgroundColor: Theme.of(context).accentColor,
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => MaterialUploadWidgets(
              materialCreatorName: widget.creatorName,
              classId: widget.classId,
            ),
          ));
        },
        elevation: 3.0,
      ),
      body: MaterialsItemsWidgets(
        classId: widget.classId,
      ),
    );
  }
}

// Container(
//         height: MediaQuery.of(context).size.height * 1,
//         alignment: Alignment.bottomCenter,
//         padding: EdgeInsets.only(
//           top: 32.0,
//           right: 32.0,
//           bottom: 32.0,
//           left: 32.0,
//         ),
//         decoration: BoxDecoration(
//           color: background98,
//           borderRadius: BorderRadius.only(
//               topLeft: Radius.circular(32.0), topRight: Radius.circular(32.0)),
//         ),

// Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>[
//             Column(
//               mainAxisAlignment: MainAxisAlignment.start,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: <Widget>[
//                 Text(
//                   'Class Materials',
//                   style: Theme.of(context).textTheme.headline4,
//                   textAlign: TextAlign.left,
//                 ),
//                 SizedBox(
//                   height: 16.0,
//                 ),
//                 Container(
//                   width: MediaQuery.of(context).size.width - 32.0,
//                   height: 540,
//                   child: SingleChildScrollView(
//                     child: Container(
//                       width: MediaQuery.of(context).size.width - 32.0,
//                       height: 540,
//                       child: Container(
//                         child: ListView.builder(
//                           itemCount: materialData.length,
//                           itemBuilder: (context, index) {
//                             return MaterialListWidgets(
//                                 materialItemData: materialData[index]);
//                           },
//                         ),
//                       ),
//                     ),
//                   ),
//                 )
//               ],
//             )
//           ],
//         )

// body: Container(
//   padding: EdgeInsets.only(
//     top: 16.0,
//     right: 32.0,
//     bottom: 8.0,
//     left: 32.0,
//   ),
//   child: Column(
//     mainAxisAlignment: MainAxisAlignment.start,
//     crossAxisAlignment: CrossAxisAlignment.start,
//     children: <Widget>[
//       Column(
//         mainAxisAlignment: MainAxisAlignment.start,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: <Widget>[
//           Text(
//             'Your Class',
//             style: Theme.of(context).textTheme.headline4,
//             textAlign: TextAlign.left,
//           ),
//           SizedBox(
//             height: 4.0,
//           ),
//           Text(
//             'Fill out the form to create class',
//             style: Theme.of(context).textTheme.subtitle1,
//             textAlign: TextAlign.left,
//           ),
//           SizedBox(
//             height: 16.0,
//           ),
//           Container(
//             width: MediaQuery.of(context).size.width - 32.0,
//             height: 350.0,
//             child: SingleChildScrollView(
//               child: Container(
//                 width: MediaQuery.of(context).size.width - 32.0,
//                 height: 350,
//                 child: ListView.builder(
//                   itemCount: userClass.length,
//                   itemBuilder: (context, index) {
//                     return ClassListTileWidgets(
//                       userClass: userClass[index],
//                     );
//                   },
//                 ),
//               ),
//             ),
//           )
//         ],
//       )
//     ],
//   ),
// ),
// ListView.builder(
//                               itemCount: materialData.length,
//                               itemBuilder: (context, index) {
//                                 return MaterialListWidgets(
//                                     materialItemData: materialData[index]);
//                               },
//                             ),
