// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:store/componants/login_page/custom_gradient.dart';
import 'package:store/componants/login_page/log_in_bottom_sheet.dart';
import 'package:store/componants/login_page/log_in_button.dart';

class LogInPage extends StatelessWidget {
  const LogInPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Color(0xff263720)),
      child: Column(
        children: [
          const SizedBox(
            height: 100,
          ),
          Center(
            child: Column(
              children: [
                Image.asset(
                  'images/welcomeicon.png',
                  width: 150,
                  color: Color.fromARGB(255, 237, 246, 221),
                ),
                SizedBox(
                  height: 30,
                ),
                Text('Welcome to Our Store',
                    style: TextStyle(
                        color: Color.fromARGB(255, 237, 246, 221),
                        fontSize: 35,
                        fontWeight: FontWeight.bold))
              ],
            ),
          ),
          const SizedBox(
            height: 80,
          ),
          Center(
            child: LogInButton(
              text: 'Log In',
              transparent: false,
              onPressed: () async {
                await logInBottomSheet(context,
                    isLogin: true,
                    imagePath: 'images/login.png',
                    buttonText: 'Log In');
              },
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Center(
            child: LogInButton(
              text: 'Sign Up',
              transparent: true,
              onPressed: () async {
                await logInBottomSheet(context,
                    isLogin: false,
                    imagePath: 'images/signup.png',
                    buttonText: 'Sign Up');
              },
            ),
          ),
        ],
      ),
    );
  }
}
