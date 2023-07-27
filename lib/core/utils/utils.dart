import 'dart:developer';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void logApp(dynamic data) {
  if (kDebugMode) {
    inspect(data);
    print(data);
  }
}

void showSnackBar(
    BuildContext context, String content, Color? bgColor, Color? fontColor) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        content,
        style: TextStyle(color: fontColor ?? Colors.white, fontSize: 15),
      ),
      backgroundColor: bgColor ?? Colors.black87,
    ),
  );
}

Future<File?> pickImage(BuildContext context) async {
  File? image;
  try {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      image = File(pickedImage.path);
    }
  } catch (e) {
    showSnackBar(context, e.toString(), Colors.red, Colors.white);
  }

  return image;
}
