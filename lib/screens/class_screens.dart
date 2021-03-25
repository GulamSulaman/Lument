import 'package:Lument/widgets/classListTitle_widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/userClass.dart';
import '../widgets/style.dart';

class ClassScreen extends StatefulWidget {
  @override
  _ClassScreenState createState() => _ClassScreenState();
}

class _ClassScreenState extends State<ClassScreen> {
  @override
  Widget build(BuildContext context) {
    final userClass = Provider.of<List<UserClass>>(context) ?? [];
    return Scaffold(
      body: Container(
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
                  'Your Class',
                  style: Theme.of(context).textTheme.headline4,
                  textAlign: TextAlign.left,
                ),
                SizedBox(
                  height: 4.0,
                ),
                Text(
                  'Fill out the form to create class',
                  style: Theme.of(context).textTheme.subtitle1,
                  textAlign: TextAlign.left,
                ),
                SizedBox(
                  height: 16.0,
                ),
                Container(
                  width: MediaQuery.of(context).size.width - 32.0,
                  height: 350.0,
                  child: SingleChildScrollView(
                    child: Container(
                      width: MediaQuery.of(context).size.width - 32.0,
                      height: 350,
                      child: ListView.builder(
                        itemCount: userClass.length,
                        itemBuilder: (context, index) {
                          return ClassListTileWidgets(
                            userClass: userClass[index],
                          );
                        },
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
