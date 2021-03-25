import 'package:flutter/material.dart';
import 'package:pdf_flutter/pdf_flutter.dart';

class DocumetnScreen extends StatefulWidget {
  final String documenturl;
  DocumetnScreen({@required this.documenturl});
  @override
  _DocumetnScreenState createState() => _DocumetnScreenState();
}

class _DocumetnScreenState extends State<DocumetnScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500.0,
      width: double.infinity,
      padding: EdgeInsets.all(32.0),
      child: PDF.network(widget.documenturl),
    );
  }
}
