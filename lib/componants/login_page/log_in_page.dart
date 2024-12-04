// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:store/componants/login_page/log_in_bottom_sheet.dart';
import 'package:store/componants/login_page/auth_button.dart';
import 'package:store/styles/assets.dart';
import 'package:store/styles/text_styles.dart';

class LogInPage extends StatelessWidget {
  const LogInPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 100,
        ),
        Image.asset(
          AppImages.splahview,
          width: 150,
        ),
        const SizedBox(
          height: 30,
        ),
        const Text(
          'Welcome to Our Store',
          style: TextStyle(
              color: Color.fromRGBO(142, 108, 239, 1),
              fontSize: 30,
              fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 80,
        ),
        Center(
          child: AuthButton(
            text: 'Log In',
            transparent: false,
            onPressed: () async {
              await logInBottomSheet(context,
                  isLogin: true,
                  imagePath: AppImages.login,
                  buttonText: 'Log In');
            },
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Center(
          child: AuthButton(
            text: 'Sign Up',
            transparent: true,
            onPressed: () async {
              await logInBottomSheet(context,
                  isLogin: false,
                  imagePath: AppImages.signup,
                  buttonText: 'Sign Up');
            },
          ),
        ),
        Text(
          'im mohamad serafi',
          style: TextStyles.textStyle32,
        )
      ],
    );
  }
}
