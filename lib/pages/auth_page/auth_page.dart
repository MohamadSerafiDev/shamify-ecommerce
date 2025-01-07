import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:store/pages/auth_page/widgets/auth_bottom_sheet.dart';
import 'package:store/pages/auth_page/widgets/auth_button.dart';
import 'package:store/styles/assets.dart';
import 'package:store/styles/constants.dart';
import 'package:store/styles/text_styles.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Gap(
            160,
          ),
          Image.asset(
            AppImages.splashview,
            color: Constants.buttoncolor,
            width: 250,
          ),
          const Gap(
            30,
          ),
          const Gap(
            80,
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
          const Gap(
            20,
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
      ),
    );
  }
}
