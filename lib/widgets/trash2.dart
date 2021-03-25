// // import 'dart:convert';
// // import 'dart:io';
// // import 'dart:math';

// import 'package:flutter/material.dart';
// import 'package:flutter_plugin_pdf_viewer/flutter_plugin_pdf_viewer.dart';
// //import 'package:file_picker/file_picker.dart';
// //import 'package:firebase_database/firebase_database.dart';
// // import 'package:firebase_storage/firebase_storage.dart';

// //final mainReference = FirebaseDatabase.instance.reference().child('Database');

// // Future getPdfUpload() async {
// //   var nameGenerator = Random();
// //   var randomName = '';
// //   for (var i = 0; i < 10; i++) {
// //     print(nameGenerator.nextInt(100));
// //     randomName += nameGenerator.nextInt(100).toString();
// //   }
// //   File file = await FilePicker.getFile(type: FileType.custom);
// //   String fileName = '$randomName.pdf';
// //   savePdf(file.readAsBytesSync(), fileName);
// // }

// // savePdf(List<int> asset, String name) async {
// //   StorageReference reference =
// //       FirebaseStorage.instance.ref().child('Material').child(name);
// //   StorageUploadTask uploadTask = reference.putData(asset);
// //   String url = await (await uploadTask.onComplete).ref.getDownloadURL();
// //   documentFileUpload(url);
// // }

// // String CreateCryotoRandomString([int length = 32]) {
// //   final randomData = Random.secure();
// //   var values = List<int>.generate(length, (i) => randomData.nextInt(256));
// //   return base64Url.encode(values);
// // }

// // void documentFileUpload(String url) {
// //   var data = {
// //     'PDF': url,
// //     'FileName': 'MyPDF',
// //   };
// //   mainReference.child(CreateCryotoRandomString()).set(data).then((v) {
// //     print('Stored Successfully');
// //   });
// // }
// class UploadWidget extends StatefulWidget {
//   @override
//   _UploadWidgetState createState() => _UploadWidgetState();
// }

// class _UploadWidgetState extends State<UploadWidget> {
//   String pdfAssets = 'assets/pdf/Lument.pdf';
//   PDFDocument _assetsPDF;
//   var _isloading = false;

//   @override
//   void initState() {
//     _initPdf();
//     super.initState();
//   }

//   _initPdf() async {
//     setState(() {
//       _isloading = true;
//     });
//     final assetsPDF = await PDFDocument.fromAsset(pdfAssets);
//     setState(() {
//       _assetsPDF = assetsPDF;
//       _isloading = false;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return _isloading
//         ? Center(
//             child: CircularProgressIndicator(),
//           )
//         : PDFViewer(
//             document: _assetsPDF,
//           );
//   }
// }
