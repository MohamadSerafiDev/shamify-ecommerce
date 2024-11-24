// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class LogInButton extends StatelessWidget {
  final String text;
  final bool transparent;
  final void Function()? onPressed;

  const LogInButton({
    super.key,
    required this.text,
    required this.transparent,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      //this to disable splash effect of the button
      style: ButtonStyle(
        splashFactory: NoSplash.splashFactory,
      ),
      onPressed: onPressed,
      child: Container(
        width: 300,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(40)),
          border: Border.all(
            color: Color.fromARGB(255, 237, 246, 221),
            style: transparent ? BorderStyle.solid : BorderStyle.none,
          ),
          color: transparent
              ? Colors.transparent
              : const Color.fromARGB(255, 237, 246, 221),
        ),
        child: Center(
            child: Text(
          text,
          style: TextStyle(
              color: transparent
                  ? Color.fromARGB(255, 237, 246, 221)
                  : Color(0xff263720),
              fontSize: 20),
        )),
      ),
    );
  }
}
