// ignore_for_file: missing_required_param, use_build_context_synchronously

import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:store/pages/profile_page/widgets/profile_settings.dart';
import 'package:store/styles/themes.dart';

class ThemeSwitcherButton extends StatelessWidget {
  const ThemeSwitcherButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ThemeSwitcher(
      builder: (context) {
        return ProfileSettings(
          text: 'Theme',
          onTap: () {},
          end: ThemeSwitcher(builder: (context) {
            return InkWell(
              onTap: () {
                var brightness =
                    ThemeModelInheritedNotifier.of(context).theme.brightness;
                ThemeSwitcher.of(context).changeTheme(
                    theme: brightness == Brightness.light
                        ? Themes().dark
                        : Themes().light,
                    isReversed: brightness == Brightness.light ? true : false);
              },
              child: Icon(
                ThemeModelInheritedNotifier.of(context).theme.brightness ==
                        Brightness.light
                    ? Icons.light_mode_rounded
                    : Icons.dark_mode_rounded,
                color: Colors.grey,
              ),
            );
          }),
        );
      },
    );
  }
}
