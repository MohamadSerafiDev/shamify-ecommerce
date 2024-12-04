// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class LogInTextField extends StatelessWidget {
  final bool ispass;
  final bool isconfirm;
  final bool isLogin;
  // final bool withbutton;
  final TextEditingController controller;
  final String hintText;
  const LogInTextField(
      {super.key,
      required this.ispass,
      required this.hintText,
      required this.isLogin,
      required this.isconfirm,
      required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: TextFormField(
            // to decide which controller i should assign to text field
            controller: controller,
            obscureText: ispass,
            keyboardType:
                ispass ? TextInputType.visiblePassword : TextInputType.phone,
            onSaved: (newValue) {
              // some logic
            },
            decoration: InputDecoration(
              floatingLabelBehavior: FloatingLabelBehavior.auto,
              label: Text(hintText),
              suffix: Icon(ispass ? Icons.password : Icons.phone),
              counter: ispass && isLogin
                  ? TextButton(
                      onPressed: () {},
                      child: const Text(
                        "forget your passowrd?",
                        style: TextStyle(
                            color: Color.fromRGBO(5, 147, 255, 1),
                            fontSize: 14),
                      ),
                    )
                  : const Text(''),
            ),
          ),
        ),
      ],
    );
  }
}
