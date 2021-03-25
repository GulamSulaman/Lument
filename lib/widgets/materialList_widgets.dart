import 'package:Lument/models/materialData.dart';
import 'package:Lument/screens/addassignment_screen.dart';
import 'package:Lument/screens/document_screens.dart';
import 'package:flutter/material.dart';

import './style.dart';

class MaterialListWidgets extends StatefulWidget {
  // final MaterialData materialItemData;
  // MaterialListWidgets({@required this.materialItemData});
  final String classId;
  final String materialId;
  final String creatorName;
  final String materialTitle;
  final String materialDescription;
  final String materialLink;
  final int numberOfMaterials;

  MaterialListWidgets({
    @required this.classId,
    @required this.materialId,
    @required this.creatorName,
    @required this.materialTitle,
    @required this.materialDescription,
    @required this.materialLink,
    @required this.numberOfMaterials,
  });

  @override
  _MaterialListWidgetsState createState() => _MaterialListWidgetsState();
}

class _MaterialListWidgetsState extends State<MaterialListWidgets> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 700.0,
      width: double.infinity,
      padding: EdgeInsets.all(16),
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            FlatButton(
              padding: EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 20,
              ),
              color: Color.fromRGBO(184, 213, 216, 1.0),
              child: Text(
                'Materials'.toUpperCase(),
                style: Theme.of(context).textTheme.button.copyWith(
                      color: Color.fromRGBO(0, 131, 143, 1.0),
                      fontSize: 12.0,
                    ),
                textAlign: TextAlign.center,
              ),
              onPressed: () {},
            ),
            SizedBox(
              height: 4.0,
            ),
            Container(
              width: double.infinity,
              child: Text(
                widget.materialTitle,
                style: Theme.of(context)
                    .textTheme
                    .subtitle1
                    .copyWith(color: textdark40),
              ),
            ),
            SizedBox(
              height: 4.0,
            ),
            Container(
              height: 100,
              width: double.infinity,
              child: Text(
                widget.materialDescription,
                style: Theme.of(context)
                    .textTheme
                    .bodyText1
                    .copyWith(color: textdark40),
                overflow: TextOverflow.fade,
              ),
            ),
            SizedBox(
              height: 4.0,
            ),
            FlatButton(
              child: Text('View Document'),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => DocumetnScreen(
                      documenturl: widget.materialLink,
                    ),
                  ),
                );
              },
            ),
            SizedBox(
              height: 4.0,
            ),
            FlatButton(
              child: Text('Add Assignment'),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => AddAssignment(
                      classId: widget.classId,
                      creatorName: widget.creatorName,
                      materialId: widget.materialId,
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

// Container(
//       height: 200.0,
//       width: double.infinity,
//       padding: EdgeInsets.all(16),
//       decoration: BoxDecoration(
//           color: Colors.yellow,
//           borderRadius: BorderRadius.all(Radius.circular(16.0))),
//       child: Container(
//         child: Column(
//           children: <Widget>[
//             FlatButton(
//               padding: EdgeInsets.symmetric(
//                 vertical: 21,
//                 horizontal: 52.5,
//               ),
//               color: Color.fromRGBO(184, 213, 216, 1.0),
//               child: Text(
//                 'Materials'.toUpperCase(),
//                 style: Theme.of(context).textTheme.button.copyWith(
//                       color: Color.fromRGBO(0, 131, 143, 1.0),
//                       fontSize: 12.0,
//                     ),
//                 textAlign: TextAlign.center,
//               ),
//               onPressed: () {},
//             ),
//             SizedBox(
//               height: 4.0,
//             ),
//             Container(
//                 width: double.infinity,
//                 child: Text(
//                   widget.materialItemData.materialTitle,
//                   style: Theme.of(context)
//                       .textTheme
//                       .subtitle1
//                       .copyWith(color: textdark40),
//                 )),
//           ],
//         ),
//       ),
//     );
