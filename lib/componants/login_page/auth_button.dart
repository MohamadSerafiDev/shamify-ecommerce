// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class AuthButton extends StatelessWidget {
  final String text;
  final bool transparent;
  final void Function()? onPressed;

  const AuthButton({
    super.key,
    required this.text,
    required this.transparent,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return transparent
        ? OutlinedButton(
            onPressed: onPressed,
            child: Center(
              child: Text(
                text,
                style: TextStyle(
                    color: transparent
                        ? Color.fromRGBO(142, 108, 239, 1)
                        : Colors.white,
                    fontSize: 20),
              ),
            ),
          )
        : ElevatedButton(
            //this to disable splash effect of the button
            style: ButtonStyle(
              splashFactory: NoSplash.splashFactory,
            ),
            onPressed: onPressed,
            child: Center(
                child: Text(
              text,
              style: TextStyle(
                  color: transparent
                      ? Color.fromRGBO(142, 108, 239, 1)
                      : Colors.white,
                  fontSize: 20),
            )),
          );
  }
}
