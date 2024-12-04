// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:store/componants/login_page/log_in_page.dart';
import 'package:store/styles/themes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  final bool isdark = true;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: isdark ? Themes().dark : Themes().light,
      home: Scaffold(
        body: LogInPage(),
      ),
    );
  }
}
