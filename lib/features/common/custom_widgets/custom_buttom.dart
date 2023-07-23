import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  String buttontext;
  final VoidCallback onPressed;
  final Color? bottomColor;
  CustomButton(
      {super.key,
      required this.buttontext,
      required this.onPressed,
      this.bottomColor});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(
        buttontext,
        style: TextStyle(fontSize: 16),
      ),
      style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
          backgroundColor: MaterialStateProperty.all<Color>(
              bottomColor ?? Colors.cyanAccent.shade700),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.0)))),
    );
  }
}
