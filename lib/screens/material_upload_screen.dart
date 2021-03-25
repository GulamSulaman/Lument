// import 'package:flutter/material.dart';
// import 'package:flutter_plugin_pdf_viewer/flutter_plugin_pdf_viewer.dart';

// import '../widgets/style.dart';
// import '../widgets/material_upload_widget.dart';

// class MaterialUpload extends StatefulWidget {
//   @override
//   _MaterialUploadState createState() => _MaterialUploadState();
// }

// class _MaterialUploadState extends State<MaterialUpload> {
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
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Upload Materials'),
//       ),
//       floatingActionButton: FloatingActionButton(
//         child: Icon(
//           Icons.add,
//           color: background100,
//         ),
//         backgroundColor: Theme.of(context).accentColor,
//         onPressed: () {
//           print('say hi');
//         },
//       ),
//       body: Center(
//         child: _isloading
//             ? Center(
//                 child: CircularProgressIndicator(),
//               )
//             : PDFViewer(
//                 document: _assetsPDF,
//               ),
//       ),
//     );
//   }
// }
