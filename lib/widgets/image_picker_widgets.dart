import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import './style.dart';

class ImagePickerWidgets extends StatefulWidget {
  final Function(File pickedImage) imagePickFn;
  ImagePickerWidgets(this.imagePickFn);
  @override
  _ImagePickerWidgetsState createState() => _ImagePickerWidgetsState();
}

class _ImagePickerWidgetsState extends State<ImagePickerWidgets> {
  File pickedImage;
  void pickImage() async {
    final pickedImageFile =
        await ImagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      pickedImage = pickedImageFile;
    });
    widget.imagePickFn(pickedImageFile);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
            backgroundImage: pickedImage != null
                ? FileImage(
                    pickedImage,
                  )
                : null,
            radius: 60,
          ),
        ),
        SizedBox(
          height: 16.0,
        ),
        FlatButton(
          padding: EdgeInsets.symmetric(
            vertical: 21,
          ),
          minWidth: double.infinity,
          color: primaryColorTint,
          child: Text(
            'Upload Image'.toUpperCase(),
            style: Theme.of(context).textTheme.button.copyWith(
                  color: Theme.of(context).primaryColor,
                ),
            textAlign: TextAlign.center,
          ),
          onPressed: pickImage,
        ),
      ],
    );
  }
}
