// ignore_for_file: missing_required_param, use_build_context_synchronously

import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:store/cubits/profile_image/profile_image_cubit.dart';
import 'package:store/pages/favorites_page/favorites_page.dart';
import 'package:store/pages/profile_page/widgets/first_and_last_name_and_address_edit.dart';
import 'package:store/pages/profile_page/widgets/logout_button.dart';
import 'package:store/pages/profile_page/widgets/profile_image.dart';
import 'package:store/pages/profile_page/widgets/profile_settings.dart';
import 'package:store/pages/profile_page/widgets/theme_switcher_button.dart';
import 'package:store/styles/assets.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ThemeSwitchingArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: ListView(
            children: [
              Column(
                children: [
                  const Gap(
                    30,
                  ),
                  BlocBuilder<ProfileImageCubit, ProfileImageState>(
                    builder: (context, state) {
                      return const ProfileImage();
                    },
                  ),
                  const Gap(
                    32,
                  ),
                  FirstAndLastNameAndAddressEdit(),
                  const Gap(
                    26,
                  ),
                  ProfileSettings(
                    text: 'Favourites',
                    onTap: () {
                      Get.to(() => const FavoritesPage());
                    },
                    end: Image.asset(
                      AppIcons.right,
                      width: 11,
                      color: Colors.grey,
                    ),
                  ),
                  const Gap(
                    8,
                  ),
                  ProfileSettings(
                    text: 'Language',
                    onTap: () {},
                    end: Image.asset(
                      AppIcons.right,
                      width: 11,
                      color: Colors.grey,
                    ),
                  ),
                  const Gap(
                    8,
                  ),
                  const ThemeSwitcherButton(),
                  const Gap(
                    25,
                  ),
                  const LogoutButton()
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
