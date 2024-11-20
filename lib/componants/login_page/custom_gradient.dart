// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace

import 'package:flutter/material.dart';

LinearGradient CustomGradient(
    {required AlignmentGeometry begin, required AlignmentGeometry end}) {
  return LinearGradient(
    colors: [
      Colors.black,
      const Color.fromRGBO(44, 24, 55, 1),
      Color.fromRGBO(167, 15, 45, 1),
    ],
    begin: begin,
    end: end,
  );
}
