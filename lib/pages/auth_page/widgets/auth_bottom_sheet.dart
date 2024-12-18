// ignore_for_file: use_build_context_synchronously, library_prefixes

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart'
    as gTransition;
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:store/cubits/auth/auth_cubit.dart';
import 'package:store/pages/auth_page/widgets/error_dialog.dart';
import 'package:store/pages/auth_page/widgets/auth_button.dart';
import 'package:store/pages/auth_page/widgets/auth_text_field.dart';
import 'package:store/pages/home_page/main_home_page.dart';

TextEditingController phonecontroller = TextEditingController();
TextEditingController passwordcontroller = TextEditingController();
TextEditingController confirmcontroller = TextEditingController();

Future<dynamic> authBottomSheet(BuildContext context,
    {required bool isLogin,
    required String imagePath,
    required String buttonText}) {
  @override
  void dispose() {
    phonecontroller.dispose();
    passwordcontroller.dispose();
    confirmcontroller.dispose();
  }

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
      return BlocConsumer<AuthCubit, AuthState>(
        //navigation and error dialog
        listener: (context, state) async {
          if (state is AuthSuccess) {
            await Get.offAll(MainHomePage(),
                transition: gTransition.Transition.fade,
                duration: const Duration(milliseconds: 1000));
            dispose();
          } else if (state is AuthFailure) {
            errorDialog(
              context,
              title: 'Warning!',
              contentType: ContentType.help,
              message: state.errormessage,
            );
          }
        },
        //initial value and loading indicator
        builder: (context, state) {
          if (state is AuthLoading) {
            return Container(
              height: 600,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
              child: const Center(
                child: CircularProgressIndicator(),
              ),
            );
          } else {
            return Container(
              height: 600,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
              child: Column(
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
                  AuthTextField(
                    ispass: false,
                    hintText: 'phone number',
                    isLogin: isLogin,
                    isconfirm: false,
                    controller: phonecontroller,
                  ),
                  const SizedBox(
                    height: 0,
                  ),
                  AuthTextField(
                    ispass: true,
                    hintText: 'password',
                    isLogin: isLogin,
                    isconfirm: false,
                    controller: passwordcontroller,
                  ),
                  isLogin
                      ? Container()
                      : AuthTextField(
                          ispass: true,
                          hintText: 're-confirm your password',
                          isLogin: isLogin,
                          isconfirm: true,
                          controller: confirmcontroller,
                        ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: AuthButton(
                        text: isLogin ? 'Log In' : 'Sign Up',
                        transparent: !isLogin,
                        onPressed: () {
                          //login
                          if (isLogin) {
                            BlocProvider.of<AuthCubit>(context)
                                .logInWithPhoneAndPassword(
                              phone: phonecontroller.text,
                              password: passwordcontroller.text,
                            );
                            phonecontroller.clear();
                            passwordcontroller.clear();
                          } else {
                            if (passwordcontroller.text !=
                                confirmcontroller.text) {
                              errorDialog(context,
                                  title: 'Error',
                                  message: 'password not match',
                                  contentType: ContentType.warning);

                              passwordcontroller.clear();
                              confirmcontroller.clear();
                            } else {
                              BlocProvider.of<AuthCubit>(context)
                                  .signUpWithEmailAndPassword(
                                phone: phonecontroller.text,
                                password: passwordcontroller.text,
                                confirm: confirmcontroller.text,
                                firstName: 'firstName',
                                lastName: 'lastName',
                              );

                              phonecontroller.clear();
                              passwordcontroller.clear();
                              confirmcontroller.clear();
                            }
                          }
                        }),
                  )
                ],
              ),
            );
          }
        },
      );
    },
  );
}
