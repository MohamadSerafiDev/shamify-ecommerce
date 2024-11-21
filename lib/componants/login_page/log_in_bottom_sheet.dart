// ignore_for_file: prefer_const_constructors

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:store/componants/login_page/custom_gradient.dart';
import 'package:store/componants/login_page/log_in_button.dart';
import 'package:store/componants/login_page/log_in_text_field.dart';

TextEditingController phonecontroller = TextEditingController();
TextEditingController passwordcontroller = TextEditingController();
TextEditingController confirmcontroller = TextEditingController();

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
      ),
    ),
    context: context,
    builder: (context) {
      return Container(
        height: 600,
        decoration: BoxDecoration(
          gradient: CustomGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
          ),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(40),
            topRight: Radius.circular(40),
          ),
        ),
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
              controller: phonecontroller,
            ),
            const SizedBox(
              height: 0,
            ),
            LogInTextField(
              ispass: true,
              hintText: 'password',
              isLogin: isLogin,
              isconfirm: false,
              controller: passwordcontroller,
            ),
            isLogin
                ? Container()
                : LogInTextField(
                    ispass: true,
                    hintText: 're-confirm your password',
                    isLogin: isLogin,
                    isconfirm: true,
                    controller: confirmcontroller,
                  ),
            LogInButton(
              text: isLogin ? 'Log In' : 'Sign Up',
              transparent: !isLogin,
              onPressed: isLogin
                  ? () {
                      //login logic
                    }
                  : () {
                      //sign up logic
                      if (passwordcontroller.text == confirmcontroller.text) {
                        if (passwordcontroller.text.length < 8) {
                          ErrorDialog(
                            context,
                            title: 'Warning!',
                            contentType: ContentType.help,
                            message:
                                'your password must be at least 8 characters',
                          );
                        } else if (phonecontroller.text.length < 10 ||
                            phonecontroller.text.length > 14) {
                          ErrorDialog(
                            context,
                            title: 'Error',
                            message: 'invalid phone number',
                            contentType: ContentType.warning,
                          );
                        } else {
                          // Forward to next page
                        }
                      } else {
                        ErrorDialog(
                          context,
                          title: 'Error',
                          message: 'passwords do not match',
                          contentType: ContentType.failure,
                        );
                      }
                    },
            )
          ],
        ),
      );
    },
  );
}

Future<dynamic> ErrorDialog(BuildContext context,
    {required String title,
    required String message,
    required ContentType contentType}) {
  return showDialog(
    barrierDismissible: false,
    context: context,
    builder: (context) {
      Future.delayed(Duration(seconds: 2), () {
        Navigator.of(context).pop();
        phonecontroller.clear();
        passwordcontroller.clear();
        confirmcontroller.clear();
      });
      return Center(
        child: AwesomeSnackbarContent(
          title: title,
          message: message,
          contentType: contentType,
        ),
      );
    },
  );
}
