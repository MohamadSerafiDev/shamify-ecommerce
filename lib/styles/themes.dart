import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:store/styles/constants.dart';

class Themes {
  ThemeData light = ThemeData.light(useMaterial3: true).copyWith(
    scaffoldBackgroundColor: Constants.lightbackgroundcolor,
    textTheme: GoogleFonts.aBeeZeeTextTheme(),
    iconTheme: const IconThemeData(color: Colors.black),
    cardColor: Constants.lightinsidecolor,
    buttonTheme: const ButtonThemeData(
      buttonColor: Constants.buttoncolor,
    ),
    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: Constants.lightbackgroundcolor,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Constants.buttoncolor,
        foregroundColor: Colors.white,
        maximumSize: const Size(300, 50),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: Constants.buttoncolor,
        maximumSize: const Size(300, 50),
        side: const BorderSide(
          color: Constants.buttoncolor,
        ),
      ),
    ),
    inputDecorationTheme: const InputDecorationTheme(
      contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      filled: true,
      fillColor: Constants.lightinsidecolor,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
      ),
    ),
  );
  //dark mode
  ThemeData dark = ThemeData.dark(useMaterial3: true).copyWith(
    scaffoldBackgroundColor: Constants.darkbackgroundcolor,
    textTheme: GoogleFonts.aBeeZeeTextTheme(Typography.whiteHelsinki),
    iconTheme: const IconThemeData(color: Colors.white),
    cardColor: Constants.darkinsidecolor,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Constants.buttoncolor,
        foregroundColor: Colors.white,
        maximumSize: const Size(300, 50),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: Constants.buttoncolor,
        maximumSize: const Size(300, 50),
        side: const BorderSide(
          color: Constants.buttoncolor,
        ),
      ),
    ),
    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: Constants.darkbackgroundcolor,
    ),
    inputDecorationTheme: const InputDecorationTheme(
      floatingLabelBehavior: FloatingLabelBehavior.always,
      contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      filled: true,
      fillColor: Constants.darkinsidecolor,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
      ),
    ),
  );
}
