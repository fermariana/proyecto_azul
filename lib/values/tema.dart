

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

const Color primary = Color.fromARGB(255, 137, 166, 245);
const Color secundary = Color(0xffF7C7DB);
const Color crayola = Color(0xffF79AD3);
const Color french = Color.fromARGB(255, 137, 166, 245);
const Color berry = Color(0xff8E518D);

Map<int, Color> color = {
50:french,
};

MaterialColor colorCustom = MaterialColor(0xFFFF5C57, color);

miTema(BuildContext con){
  return ThemeData(
  primaryColor: primary,
  colorScheme: ColorScheme.fromSwatch(
primarySwatch: Colors.blue
).
copyWith(
  secondary:  Color(0xFF89A6F5),
  
)

  );
 
}
