import 'package:flutter/material.dart';
import 'package:flutter_primary_architecture/core/utils/designers.dart';

ThemeData theme() {
  return ThemeData(fontFamily: 'Comfortaa', appBarTheme: appBarTheme());
}

AppBarTheme appBarTheme() {
  return const AppBarTheme(
      color: Colors.white,
      elevation: 0,
      iconTheme: IconThemeData(color: Color(0xFF8B8B8B)),
      titleTextStyle: TextStyle(color: Color(0xFF8B8B8B), fontSize: 18));
}
