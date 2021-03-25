import 'package:Lument/models/DatabaseService.dart';
import 'package:Lument/models/materialData.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../screens/material_Screens.dart';
import '../models/userClass.dart';
import './style.dart';

class ClassListTileWidgets extends StatefulWidget {
  final UserClass userClass;
  ClassListTileWidgets({@required this.userClass});
  @override
  _ClassListTileWidgetsState createState() => _ClassListTileWidgetsState();
}

class _ClassListTileWidgetsState extends State<ClassListTileWidgets> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Container(
      height: 152.0,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
          color: Colors.redAccent[700],
          borderRadius: BorderRadius.all(Radius.circular(16.0))),
      child: GestureDetector(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      child: Column(
                        //mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.userClass.classSubjectName,
                            style: Theme.of(context)
                                .textTheme
                                .subtitle1
                                .copyWith(color: textLight100),
                          ),
                          SizedBox(
                            height: 2.0,
                          ),
                          Text(
                            widget.userClass.classCreatorName,
                            style:
                                Theme.of(context).textTheme.bodyText1.copyWith(
                                      color: textLight100,
                                      fontSize: 16.0,
                                    ),
                          ),
                        ],
                      ),
                    ),
                    Icon(
                      Icons.chevron_right_outlined,
                      color: background100.withOpacity(0.5),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(child: Container()),
          ],
        ),
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (ctx) => MaterialScreen(
                    classSubjectName: widget.userClass.classSubjectName,
                    creatorName: widget.userClass.classCreatorName,
                    classId: widget.userClass.classId,
                  )));
        },
      ),
    ));
  }
}
