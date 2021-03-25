import 'package:Lument/models/materialData.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import './profile.dart';
import './userClass.dart';
import './userData.dart';
import './users.dart';

class DatabaseService {
  final String uid;
  // final String classId;
  // final String materialId;
  DatabaseService({
    this.uid,
    // this.classId,
    // this.materialId,
  });

  final CollectionReference users = Firestore.instance.collection('Users');
  final CollectionReference classData =
      Firestore.instance.collection('classData');

  Future addClassData(
    final String classCreatorName,
    final String classId,
    final String classSubjectName,
    final String classDepartment,
    final String classBatch,
    final String classSection,
    final String selectedBackgroundColor,
  ) async {
    return classData.document(classId).setData({
      'classCreatorName': classCreatorName,
      'classId': classId,
      'classSubjectName': classSubjectName,
      'classDepartment': classDepartment,
      'classBatch': classBatch,
      'classSection': classSection,
      'colorName': selectedBackgroundColor,
    });
  }

  Future materialUpload(
    final String classId,
    final String materialId,
    final String creatorName,
    final String materialTitle,
    final String materialDescription,
    final String materialLink,
  ) async {
    return classData
        .document(classId)
        .collection('MaterialData')
        .document(materialId)
        .setData({
      'classId': classId,
      'materialId': materialId,
      'creatorName': creatorName,
      'materialTitle': materialTitle,
      'materialDescription': materialDescription,
      'materialLink': materialLink,
    });
  }

  Future assignmentUpload(
    final String classId,
    final String materialId,
    final String questions,
    final String assignmentId,
    final String answers,
    final String creatorName,
  ) async {
    return classData
        .document(classId)
        .collection('MaterialData')
        .document(materialId)
        .collection('AssignmentData')
        .document(assignmentId)
        .setData({
      'classId': classId,
      'materialId': materialId,
      'creatorName': questions,
      'materialTitle': assignmentId,
      'materialDescription': answers,
      'materialLink': creatorName,
    });
  }

  Future updateUserData(
    String userEmail,
    String fullname,
    bool isTeacher,
  ) async {
    return users.document(uid).setData({
      'userEmail': userEmail,
      'fullName': fullname,
      'isTeacher': isTeacher,
    });
  }

  Future updateProfileData(
    final String userEmail,
    final String fullName,
    final bool isTeacher,
    final String profileImageUrl,
    final String designation,
    final String userPhone,
    final String classID,
    final String userDepartment,
  ) async {
    return users.document(uid).collection('ProfileData').document().setData({
      'userEmail': userEmail,
      'fullName': fullName,
      'isTeacher': isTeacher,
      'profileImageUrl': profileImageUrl,
      'designation': designation,
      'userPhone': userPhone,
      'classID': classID,
      'userDepartment': userDepartment,
    });
  }

  UserData userDataFromSnapsot(DocumentSnapshot snapshot) {
    return UserData(
        uid: uid,
        fullName: snapshot.data['name'],
        userEmail: snapshot.data['userEmail'],
        isTeacher: snapshot.data['isTeacher']);
  }

  UserProfileData profileDataFromSnapshot(DocumentSnapshot snapshot) {
    return UserProfileData(
      userEmail: snapshot.data['userEmail'] ?? '',
      fullName: snapshot.data['fullName'] ?? '',
      isTeacher: snapshot.data['isTeacher'] ?? '',
      profileImageUrl: snapshot.data['profileImageUrl'] ?? '',
      designation: snapshot.data['designation'] ?? '',
      userPhone: snapshot.data['userPhone'] ?? '',
      classID: snapshot.data['classID'] ?? '',
      userDepartment: snapshot.data['userDepartment'] ?? '',
    );
  }

  List<UserClass> classDataFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return UserClass(
        classCreatorName: doc.data['classCreatorName'] ?? '',
        classId: doc.data['classId'] ?? '',
        classSubjectName: doc.data['classSubjectName'] ?? '',
        classDepartment: doc.data['classDepartment'] ?? '',
        classBatch: doc.data['classBatch'] ?? '',
        classSection: doc.data['classSection'] ?? '',
        selectedBackgroundColor: doc.data['selectedBackgroundColor'] ?? '',
      );
    }).toList();
  }

  // List<MaterialData> materialDataFromSnapshot(QuerySnapshot snapshot) {
  //   return snapshot.documents.map((doc) {
  //     return MaterialData(
  //       classId: doc.data['classId'] ?? '',
  //       materialId: doc.data['materialId'] ?? '',
  //       creatorName: doc.data['creatorName'] ?? '',
  //       materialTitle: doc.data['materialTitle'] ?? '',
  //       materialDescription: doc.data['materialDescription'] ?? '',
  //       materialLink: doc.data['materialLink'] ?? '',
  //     );
  //   }).toList();
  // }

  Stream<UserData> get userData {
    return users.document(uid).snapshots().map(userDataFromSnapsot);
  }

  Stream<UserProfileData> get profileData {
    return users
        .document(uid)
        .collection('ProfileData')
        .document()
        .snapshots()
        .map(profileDataFromSnapshot);
  }

  getProfileinfo(String uid) async {
    return await users.document(uid).collection('ProfileData').snapshots();
  }

  Stream<List<UserClass>> get classDataFs {
    return classData.snapshots().map(classDataFromSnapshot);
  }

  // Stream<List<MaterialData>> get materialDataFs {
  //   return classData
  //       .document(classId)
  //       .collection('MaterialData')
  //       .snapshots()
  //       .map(materialDataFromSnapshot);
  // }

  getMaterialData(String classId) async {
    return await classData
        .document(classId)
        .collection('MaterialData')
        .snapshots();
  }
}
