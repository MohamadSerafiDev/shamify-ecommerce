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
      style: const ButtonStyle(splashFactory: NoSplash.splashFactory),
      onPressed: onPressed,
      child: Container(
        width: 300,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(40)),
          border: Border.all(
            color: Colors.white,
            style: transparent ? BorderStyle.solid : BorderStyle.none,
          ),
          color: transparent
              ? Colors.transparent
              : const Color.fromARGB(210, 255, 255, 255),
        ),
        child: Center(
            child: Text(
          text,
          style: TextStyle(
              color: transparent ? Colors.white : Colors.black, fontSize: 20),
        )),
      ),
    );
  }
}
