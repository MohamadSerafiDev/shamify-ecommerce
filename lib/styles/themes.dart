// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:store/styles/constants.dart';

class Themes {
  ThemeData light = ThemeData.light(useMaterial3: true).copyWith(
    scaffoldBackgroundColor: Constants.lightbackgroundcolor,
    textTheme: GoogleFonts.aBeeZeeTextTheme(),
    buttonTheme: ButtonThemeData(
      buttonColor: Constants.buttoncolor,
    ),
    bottomSheetTheme: BottomSheetThemeData(
      backgroundColor: Constants.lightbackgroundcolor,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Constants.buttoncolor,
        foregroundColor: Colors.white,
        maximumSize: Size(300, 50),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: Constants.buttoncolor,
        maximumSize: Size(300, 50),
        side: BorderSide(
          color: Constants.buttoncolor,
        ),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      filled: true,
      fillColor: Constants.lightinsidecolor,
      border: const OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
      ),
    ),
  );
  //dark mode
  ThemeData dark = ThemeData.dark(useMaterial3: true).copyWith(
    scaffoldBackgroundColor: Constants.darkbackgroundcolor,
    textTheme: GoogleFonts.aBeeZeeTextTheme(),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Constants.buttoncolor,
        foregroundColor: Colors.white,
        maximumSize: Size(300, 50),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: Constants.buttoncolor,
        maximumSize: Size(300, 50),
        side: BorderSide(
          color: Constants.buttoncolor,
        ),
      ),
    ),
    bottomSheetTheme: BottomSheetThemeData(
      backgroundColor: Constants.darkbackgroundcolor,
    ),
    inputDecorationTheme: InputDecorationTheme(
      floatingLabelBehavior: FloatingLabelBehavior.always,
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      filled: true,
      fillColor: Constants.darkinsidecolor,
      border: const OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
      ),
    ),
  );
}
