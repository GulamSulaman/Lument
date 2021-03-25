import 'package:Lument/models/profile.dart';
import 'package:Lument/models/userData.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../screens//signin_screens.dart';
import '../widgets/style.dart';
import '../models/authServices.dart';
import '../models/DatabaseService.dart';
import '../models/users.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  AuthServices authServices = new AuthServices();

  var isLoading = false;
  var profileImageUrl =
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRuWlKVGJeILLo6n3_-9GgvdvWyz7MJbC1o7g&usqp=CAU';
  var fullName = 'Arif Ahmad';
  var designation = 'Assistant Professor and Department Head';
  var userEmail = 'abir.sulaman@gmail.com';
  var userPhone = '01796269229';
  var userDepartment = 'CSE';
  var classID = '1812020014';

  signOut() async {
    setState(() {
      isLoading = true;
    });
    await authServices.signOut().then((val) {
      setState(() {
        isLoading = false;
      });
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => SignInScreen(),
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    return Scaffold(
      body: Container(
        //color: Colors.red,
        padding: EdgeInsets.only(
          top: 16.0,
          right: 32.0,
          bottom: 8.0,
          left: 32.0,
        ),
        //height: MediaQuery.of(context).size.height * 1.0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  height: 150.0,
                  width: 150.0,
                  padding: EdgeInsets.all(15.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(75.0),
                      border: Border.all(
                        width: 2.0,
                        color: Theme.of(context).primaryColor,
                      )),
                  child: CircleAvatar(
                    backgroundColor: lineColor,
                    backgroundImage: NetworkImage(
                      profileImageUrl,
                    ),
                    radius: 60,
                  ),
                ),
                SizedBox(
                  height: 16.0,
                ),
                Text(
                  fullName,
                  style: Theme.of(context).textTheme.headline6.copyWith(
                        color: textdark20,
                      ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 4.0,
                ),
                Container(
                  width: MediaQuery.of(context).size.width - 32.0,
                  child: Text(
                    designation,
                    style: Theme.of(context).textTheme.bodyText1.copyWith(
                          color: textLight60,
                        ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: 16.0,
                ),
                Divider(),
              ],
            ),
            Column(
              children: <Widget>[
                SizedBox(
                  height: 16.0,
                ),
                Container(
                  width: MediaQuery.of(context).size.width - 32.0,
                  child: Text(
                    'Personal Information',
                    style: Theme.of(context).textTheme.subtitle2,
                  ),
                ),
                SizedBox(
                  height: 16.0,
                ),
                SingleChildScrollView(
                  child: Container(
                    width: MediaQuery.of(context).size.width - 32.0,
                    height: 249,
                    child: ListView(
                      children: <Widget>[
                        ListTile(
                          leading: Container(
                            width: 44.0,
                            height: 44.0,
                            child: Icon(
                              Icons.mail_outline,
                              color: textLight60,
                            ),
                          ),
                          title: Text(
                            'Email',
                            style:
                                Theme.of(context).textTheme.subtitle2.copyWith(
                                      fontWeight: FontWeight.normal,
                                    ),
                          ),
                          subtitle: Text(
                            userEmail,
                            style:
                                Theme.of(context).textTheme.subtitle1.copyWith(
                                      color: textdark40,
                                    ),
                          ),
                        ),
                        SizedBox(
                          height: 16.0,
                        ),
                        ListTile(
                          leading: Container(
                            width: 44.0,
                            height: 44.0,
                            child: Icon(
                              Icons.call_outlined,
                              color: textLight60,
                            ),
                          ),
                          title: Text(
                            'Phone Number',
                            style:
                                Theme.of(context).textTheme.subtitle2.copyWith(
                                      fontWeight: FontWeight.normal,
                                    ),
                          ),
                          subtitle: Text(
                            userPhone,
                            style:
                                Theme.of(context).textTheme.subtitle1.copyWith(
                                      color: textdark40,
                                    ),
                          ),
                        ),
                        SizedBox(
                          height: 16.0,
                        ),
                        ListTile(
                          leading: Container(
                            width: 44.0,
                            height: 44.0,
                            child: Icon(
                              Icons.school_outlined,
                              color: textLight60,
                            ),
                          ),
                          title: Text(
                            'Department',
                            style:
                                Theme.of(context).textTheme.subtitle2.copyWith(
                                      fontWeight: FontWeight.normal,
                                    ),
                          ),
                          subtitle: Text(
                            userDepartment,
                            style:
                                Theme.of(context).textTheme.subtitle1.copyWith(
                                      color: textdark40,
                                    ),
                          ),
                        ),
                        SizedBox(
                          height: 16.0,
                        ),
                        ListTile(
                          leading: Container(
                            width: 44.0,
                            height: 44.0,
                            child: Icon(
                              Icons.tag,
                              color: textLight60,
                            ),
                          ),
                          title: Text(
                            'ID Number',
                            style:
                                Theme.of(context).textTheme.subtitle2.copyWith(
                                      fontWeight: FontWeight.normal,
                                    ),
                          ),
                          subtitle: Text(
                            classID,
                            style:
                                Theme.of(context).textTheme.subtitle1.copyWith(
                                      color: textdark40,
                                    ),
                          ),
                        ),
                        SizedBox(
                          height: 16.0,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// Container(
//                       width: MediaQuery.of(context).size.width - 32.0,
//                       child: SingleChildScrollView(
//                         scrollDirection: Axis.horizontal,
//                         child: Container(
//                           child: Row(
//                             children: [
//                               GestureDetector(
//                                 child: Container(
//                                   width: 64,
//                                   height: 64,
//                                   color: Colors.redAccent[700],
//                                 ),
//                                 onTap: () {
//                                   selectedBackgroundColor = 'redAccent[700]';
//                                 },
//                               ),
//                               SizedBox(
//                                 width: 4.0,
//                               ),
//                               GestureDetector(
//                                 child: Container(
//                                   width: 64,
//                                   height: 64,
//                                   color: Colors.deepPurpleAccent[700],
//                                 ),
//                                 onTap: () {
//                                   selectedBackgroundColor =
//                                       'deepPurpleAccent[700]';
//                                 },
//                               ),
//                               SizedBox(
//                                 width: 4.0,
//                               ),
//                               GestureDetector(
//                                 child: Container(
//                                   width: 64,
//                                   height: 64,
//                                   color: Colors.blueAccent[700],
//                                 ),
//                                 onTap: () {
//                                   selectedBackgroundColor = 'blueAccent[700]';
//                                 },
//                               ),
//                               SizedBox(
//                                 width: 4.0,
//                               ),
//                               GestureDetector(
//                                 child: Container(
//                                   width: 64,
//                                   height: 64,
//                                   color: Colors.greenAccent[700],
//                                 ),
//                                 onTap: () {
//                                   selectedBackgroundColor = 'greenAccent[700]';
//                                 },
//                               ),
//                               SizedBox(
//                                 width: 4.0,
//                               ),
//                               GestureDetector(
//                                 child: Container(
//                                   width: 64,
//                                   height: 64,
//                                   color: Colors.yellowAccent[700],
//                                 ),
//                                 onTap: () {
//                                   selectedBackgroundColor = 'yellowAccent[700]';
//                                 },
//                               ),
//                               SizedBox(
//                                 width: 4.0,
//                               ),
//                               GestureDetector(
//                                 child: Container(
//                                   width: 64,
//                                   height: 64,
//                                   color: Colors.amberAccent[700],
//                                 ),
//                                 onTap: () {
//                                   selectedBackgroundColor = 'amberAccent[700]';
//                                 },
//                               ),
//                               SizedBox(
//                                 width: 4.0,
//                               ),
//                               GestureDetector(
//                                 child: Container(
//                                   width: 64,
//                                   height: 64,
//                                   color: Colors.pinkAccent[700],
//                                 ),
//                                 onTap: () {
//                                   selectedBackgroundColor = 'pinkAccent[700]';
//                                 },
//                               ),
//                             ],
//                           ),
//                         ),

// Container(
//         child: Container(
//       height: 152.0,
//       padding: EdgeInsets.all(16),
//       decoration: BoxDecoration(
//           color: Colors.redAccent[700],
//           borderRadius: BorderRadius.all(Radius.circular(16.0))),
//       child: GestureDetector(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Expanded(
//               child: Container(
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     Container(
//                       child: Column(
//                         //mainAxisAlignment: MainAxisAlignment.start,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             'Hi I am Abit',
//                             style: Theme.of(context)
//                                 .textTheme
//                                 .subtitle1
//                                 .copyWith(color: textLight100),
//                           ),
//                           SizedBox(
//                             height: 2.0,
//                           ),
//                           Text(
//                             'Hi this is subtitle',
//                             style:
//                                 Theme.of(context).textTheme.bodyText1.copyWith(
//                                       color: textLight100,
//                                       fontSize: 16.0,
//                                     ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     Icon(
//                       Icons.chevron_right_outlined,
//                       color: background100.withOpacity(0.5),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             Expanded(child: Container()),
//           ],
//         ),
//         onTap: () {},
//       ),
//     ));
// return Container(
//   height: 200.0,
//   width: double.infinity,
//   padding: EdgeInsets.all(16),
//   decoration: BoxDecoration(
//       color: Colors.yellow,
//       borderRadius: BorderRadius.all(Radius.circular(16.0))),
//   child: Container(
//     child: Column(
//       children: <Widget>[
//         FlatButton(
//           padding: EdgeInsets.symmetric(
//             vertical: 21,
//             horizontal: 52.5,
//           ),
//           color: Color.fromRGBO(184, 213, 216, 1.0),
//           child: Text(
//             'Materials'.toUpperCase(),
//             style: Theme.of(context).textTheme.button.copyWith(
//                   color: Color.fromRGBO(0, 131, 143, 1.0),
//                   fontSize: 12.0,
//                 ),
//             textAlign: TextAlign.center,
//           ),
//           onPressed: () {},
//         ),
//         SizedBox(
//           height: 4.0,
//         ),
//         Container(
//             width: double.infinity,
//             child: Text(
//               widget.materialItemData.materialTitle,
//               style: Theme.of(context)
//                   .textTheme
//                   .subtitle1
//                   .copyWith(color: textdark40),
//             )),
//       ],
//     ),
//   ),
// );

//Material screen
// Container(
//     padding: EdgeInsets.only(
//       top: 16.0,
//       right: 32.0,
//       bottom: 8.0,
//       left: 32.0,
//     ),
//     child: Column(
//       mainAxisAlignment: MainAxisAlignment.start,
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: <Widget>[
//         Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>[
//             Text(
//               'Your Class',
//               style: Theme.of(context).textTheme.headline4,
//               textAlign: TextAlign.left,
//             ),
//             SizedBox(
//               height: 4.0,
//             ),
//             Text(
//               'Fill out the form to create class',
//               style: Theme.of(context).textTheme.subtitle1,
//               textAlign: TextAlign.left,
//             ),
//             SizedBox(
//               height: 16.0,
//             ),
//             Container(
//               width: MediaQuery.of(context).size.width - 32.0,
//               height: 350.0,
//               child: SingleChildScrollView(
//                 child: Container(
//                   width: MediaQuery.of(context).size.width - 32.0,
//                   height: 350,
//                   child: Column(
//                     children: [
