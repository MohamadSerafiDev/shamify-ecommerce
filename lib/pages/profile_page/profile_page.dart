// ignore_for_file: missing_required_param

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:store/api/api.dart';
import 'package:store/cubits/profile_image/profile_image_cubit.dart';
import 'package:store/cubits/token/token_manage_cubit.dart';
import 'package:store/pages/auth_page/auth_page.dart';
import 'package:store/pages/favorites_page/favorites_page.dart';
import 'package:store/pages/profile_page/widgets/first_and_last_name_and_address_edit.dart';
import 'package:store/pages/profile_page/widgets/profile_image.dart';
import 'package:store/pages/profile_page/widgets/profile_settings.dart';
import 'package:store/shared_preferences/session_manage.dart';
import 'package:store/shared_preferences/token_manage.dart';
import 'package:store/styles/constants.dart';
import 'package:store/styles/text_styles.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 60,
        ),
        BlocBuilder<ProfileImageCubit, ProfileImageState>(
          builder: (context, state) {
            return const ProfileImage();
          },
        ),
        const SizedBox(
          height: 32,
        ),
        Container(
          height: 110,
          width: 350,
          decoration: BoxDecoration(
            color: Constants.darkinsidecolor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: const FirstAndLastNameAndAddressEdit(),
        ),
        const SizedBox(
          height: 26,
        ),
        ProfileSettings(
          text: 'Favourites',
          onTap: () {
            Get.to(const FavoritesPage());
          },
        ),
        const SizedBox(
          height: 8,
        ),
        ProfileSettings(
          text: 'Language',
          onTap: () {},
        ),
        const SizedBox(
          height: 8,
        ),
        ProfileSettings(
          text: 'Theme',
          onTap: () {},
        ),
        const SizedBox(
          height: 25,
        ),
        TextButton(
          onPressed: () async {
            print(await TokenManage().getToken());
            await Api().post(
              url: '${Constants.localip}/api/v1/logout',
              withToken: true,
            );
            BlocProvider.of<TokenManageCubit>(context).removedToken();
            Get.offAll(const AuthPage());
          },
          child: Text(
            "Sign Out",
            style: TextStyles.textStyle22.copyWith(
              color: Colors.red,
            ),
          ),
        )
      ],
    );
  }
}
