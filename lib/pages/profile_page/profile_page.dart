// ignore_for_file: missing_required_param, use_build_context_synchronously

import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:store/api/api.dart';
import 'package:store/cubits/profile_image/profile_image_cubit.dart';
import 'package:store/cubits/token/token_manage_cubit.dart';
import 'package:store/pages/auth_page/auth_page.dart';
import 'package:store/pages/favorites_page/favorites_page.dart';
import 'package:store/pages/profile_page/widgets/first_and_last_name_and_address_edit.dart';
import 'package:store/pages/profile_page/widgets/profile_image.dart';
import 'package:store/pages/profile_page/widgets/profile_settings.dart';
import 'package:store/shared_preferences/token_manage.dart';
import 'package:store/styles/assets.dart';
import 'package:store/styles/constants.dart';
import 'package:store/styles/text_styles.dart';
import 'package:store/styles/themes.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ThemeSwitchingArea(
      child: Scaffold(
        body: ListView(
          children: [
            Column(
              children: [
                const SizedBox(
                  height: 30,
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
                  height: 220,
                  width: 350,
                  decoration: BoxDecoration(
                    color: Theme.of(context).cardColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: FirstAndLastNameAndAddressEdit(),
                ),
                const SizedBox(
                  height: 26,
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
                const SizedBox(
                  height: 8,
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
                const SizedBox(
                  height: 8,
                ),
                ThemeSwitcher(
                  builder: (context) {
                    return ProfileSettings(
                      text: 'Theme',
                      onTap: () {},
                      end: ThemeSwitcher(builder: (context) {
                        return InkWell(
                          onTap: () {
                            var brightness =
                                ThemeModelInheritedNotifier.of(context)
                                    .theme
                                    .brightness;
                            ThemeSwitcher.of(context).changeTheme(
                                theme: brightness == Brightness.light
                                    ? Themes().dark
                                    : Themes().light,
                                isReversed: brightness == Brightness.light
                                    ? true
                                    : false);
                          },
                          child: Icon(
                            ThemeModelInheritedNotifier.of(context)
                                        .theme
                                        .brightness ==
                                    Brightness.light
                                ? Icons.light_mode_rounded
                                : Icons.dark_mode_rounded,
                            color: Colors.grey,
                          ),
                        );
                      }),
                    );
                  },
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
            ),
          ],
        ),
      ),
    );
  }
}
