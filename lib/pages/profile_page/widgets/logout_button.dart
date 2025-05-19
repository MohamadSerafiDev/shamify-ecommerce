// ignore_for_file: missing_required_param, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:store/api/api.dart';
import 'package:store/cubits/token/token_manage_cubit.dart';
import 'package:store/pages/auth_page/auth_page.dart';
import 'package:store/shared_preferences/profile_image_save.dart';
import 'package:store/shared_preferences/token_manage.dart';
import 'package:store/styles/constants.dart';
import 'package:store/styles/text_styles.dart';

class LogoutButton extends StatelessWidget {
  const LogoutButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () async {
        print(await TokenManage().getToken());
        await Api().post(
          url: '${Constants.localip}/api/v1/logout',
          withToken: true,
        );
        await ProfileImageSave().removePath();
        BlocProvider.of<TokenManageCubit>(context).removedToken();
        Get.offAll(const AuthPage());
      },
      child: Text(
        "Sign Out",
        style: TextStyles.textStyle22.copyWith(
          color: Colors.red,
        ),
      ),
    );
  }
}
