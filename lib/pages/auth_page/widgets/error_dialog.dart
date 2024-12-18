// ignore_for_file: use_build_context_synchronously, library_prefixes

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:store/styles/constants.dart';

Future<dynamic> errorDialog(BuildContext context,
    {required String title,
    required String message,
    required ContentType contentType}) {
  return showDialog(
    barrierDismissible: false,
    context: context,
    builder: (context) {
      Future.delayed(const Duration(seconds: 2), () {
        Navigator.of(context).pop();
      });
      return Center(
        child: AwesomeSnackbarContent(
          color: Constants.buttoncolor,
          title: title,
          message: message,
          contentType: contentType,
        ),
      );
    },
  );
}
