import 'package:flutter/material.dart';

class MyColors {
  static Color primaryColor = const Color.fromARGB(255, 137, 166, 245);
  static Color secundaryColor = const Color.fromARGB(255, 137, 139, 245);
  static Color azulColor = const Color.fromRGBO(0, 206, 209, 50);
  static Color purple = Color.fromARGB(255, 137, 166, 245);

  static _PurplePalette purpleS = _PurplePalette(0xFFEEAA00);
}

class _PurplePalette extends Color {
  _PurplePalette(int value) : super(value);
}
