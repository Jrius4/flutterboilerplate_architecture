import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  String? fieldLabel;
  String? fieldHint;
  FontWeight? textFontWeight;
  double? textFontSize;
  TextInputType? inputType;
  int? maxLine;
  IconData? icon;
  TextEditingController controller;
  Color? textIconColor;
  bool? hasIcon;
  Color? textFillColor;

  CustomTextField(
      {super.key,
      this.fieldLabel,
      this.fieldHint,
      this.textFontWeight,
      this.textFontSize,
      this.icon,
      this.inputType,
      this.maxLine,
      this.textIconColor,
      this.textFillColor,
      this.hasIcon,
      required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          fieldLabel != null
              ? Container(
                  margin: const EdgeInsets.fromLTRB(5, 5, 5, 10),
                  child: Text(
                    fieldLabel!,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 16),
                  ))
              : Container(),
          TextFormField(
            controller: controller,
            keyboardType: inputType,
            cursorColor: Colors.cyanAccent,
            maxLines: maxLine,
            decoration: InputDecoration(
                prefixIcon: hasIcon == true
                    ? Container(
                        margin: const EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: textIconColor ?? Colors.cyanAccent.shade700),
                        child: Icon(
                          icon,
                          size: 20,
                          color: Colors.white,
                        ),
                      )
                    : SizedBox(
                        width: 1,
                      ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    color: Colors.transparent,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    color: Colors.transparent,
                  ),
                ),
                hintText: fieldHint,
                alignLabelWithHint: true,
                border: InputBorder.none,
                fillColor: textFillColor ?? Colors.blue.shade100,
                filled: true),
          ),
        ],
      ),
    );
  }
}
