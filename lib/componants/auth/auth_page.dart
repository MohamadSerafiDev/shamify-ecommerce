// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:store/componants/auth/auth_bottom_sheet.dart';
import 'package:store/componants/auth/auth_button.dart';
import 'package:store/styles/assets.dart';
import 'package:store/styles/text_styles.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({
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
        Text('Welcome to Our Store',
            style: TextStyles.textStyle32.copyWith(
              color: Color.fromRGBO(142, 108, 239, 1),
            )),
        const SizedBox(
          height: 80,
        ),
        Center(
          child: AuthButton(
            text: 'Log In',
            transparent: false,
            onPressed: () async {
              await authBottomSheet(context,
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
              await authBottomSheet(context,
                  isLogin: false,
                  imagePath: AppImages.signup,
                  buttonText: 'Sign Up');
            },
          ),
        ),
      ],
    );
  }
}
