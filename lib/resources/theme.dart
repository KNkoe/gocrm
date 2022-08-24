import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

var lightThemeData = ThemeData(
  primarySwatch: Colors.blueGrey,
  primaryColor: cardetBlue,
  backgroundColor: Colors.white,
  highlightColor: lightGreen,
  buttonTheme: const ButtonThemeData(buttonColor: oceanGreen),
  cardColor: teaGreen,
  fontFamily: GoogleFonts.roboto().fontFamily,
  primaryTextTheme: TextTheme(
    button: TextStyle(
      color: Colors.blueGrey,
      decorationColor: Colors.blueGrey[300],
    ),
    subtitle2: TextStyle(
      color: Colors.blueGrey[900],
    ),
    subtitle1: const TextStyle(
      color: Colors.black,
    ),
    headline1: TextStyle(color: Colors.blueGrey[800]),
  ),
  bottomAppBarColor: Colors.blueGrey[900],
  iconTheme: const IconThemeData(color: Colors.blueGrey),
  brightness: Brightness.light,
);

const Color denimBlue = Color(0xff023FB4);
const Color lightGreen = Color(0xff80ED99);
const Color oceanGreen = Color(0xff57CC99);
const Color cardetBlue = Color(0xff38A3A5);
const Color teaGreen = Color(0xffC7F9CC);
const Color porlandOrange = Color(0xffF46036);
const Color goldenRod = Color(0xffE6AF2E);
const Color violetBlue = Color(0xff6369D1);

MaterialColor? primarySwatch = lightGreen as MaterialColor?;
