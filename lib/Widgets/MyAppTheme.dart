// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:google_fonts/google_fonts.dart';

class MyAppTheme {
  static ThemeData lightTheme = ThemeData(
      appBarTheme: AppBarTheme(
        elevation: 0.0,
        color: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        titleTextStyle: TextStyle(color: Colors.black, fontSize: 18),
      ),
      primarySwatch: Colors.blueGrey,
      cardColor: Colors.white,
      canvasColor: lightCreamColor,
      indicatorColor: lightBluishColor,
      primaryColor: lightBluishColor,
      primaryColorLight: Colors.white,
      primaryColorDark: lightBluishColor,
      brightness: Brightness.light,
      fontFamily: GoogleFonts.poppins().fontFamily);

  static ThemeData darkTheme = ThemeData(
      appBarTheme: AppBarTheme(
        elevation: 0.0,
        color: Colors.black,
        iconTheme: IconThemeData(color: Colors.white),
        titleTextStyle: TextStyle(color: Colors.white, fontSize: 18),
      ),
      primarySwatch: Colors.deepPurple,
      cardColor: Colors.black,
      canvasColor: darkCreamColor,
      indicatorColor: Colors.white,
      primaryColor: darkBluishColor,
      primaryColorLight: lightBluishColor,
      primaryColorDark: Colors.white,
      brightness: Brightness.dark,
      fontFamily: GoogleFonts.poppins().fontFamily);

  //Colors
  static Color lightCreamColor = Color(0xfff5f5f5);
  static Color lightBluishColor = Color(0xff403b58);
  static Color darkBluishColor = Vx.indigo800;
  static Color darkCreamColor = Color(0xff181818);
}
