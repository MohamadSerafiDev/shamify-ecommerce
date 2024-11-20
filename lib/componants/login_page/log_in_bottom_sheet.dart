import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:store/componants/login_page/custom_gradient.dart';
import 'package:store/componants/login_page/log_in_text_field.dart';

Future<dynamic> logInBottomSheet(BuildContext context,
    {required bool isLogin,
    required String imagePath,
    required String buttonText}) {
  return showMaterialModalBottomSheet(
      elevation: 20,
      barrierColor: Colors.black26.withOpacity(0.6),
      duration: const Duration(milliseconds: 600),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
        topLeft: Radius.circular(50),
        topRight: Radius.circular(50),
      )),
      context: context,
      builder: (context) {
        return Container(
          height: 600,
          decoration: BoxDecoration(
              gradient: CustomGradient(
                  begin: Alignment.topRight, end: Alignment.bottomLeft),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(40),
                topRight: Radius.circular(40),
              )),
          child: ListView(
            physics: const NeverScrollableScrollPhysics(),
            children: [
              Center(
                child: Image.asset(
                  imagePath,
                  width: 120,
                ),
              ),
              const SizedBox(
                height: 70,
              ),
              LogInTextField(
                ispass: false,
                hintText: 'phone number',
                isLogin: isLogin,
                isconfirm: false,
              ),
              const SizedBox(
                height: 0,
              ),
              LogInTextField(
                ispass: true,
                hintText: 'password',
                isLogin: isLogin,
                isconfirm: false,
                withbutton: isLogin,
              ),
              isLogin
                  ? Container()
                  : LogInTextField(
                      ispass: true,
                      hintText: 're-confirm your password',
                      isLogin: isLogin,
                      isconfirm: true,
                      withbutton: true,
                    ),
            ],
          ),
        );
      });
}
