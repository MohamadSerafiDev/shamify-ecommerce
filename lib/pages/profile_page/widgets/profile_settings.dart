import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:store/styles/assets.dart';
import 'package:store/styles/text_styles.dart';

class ProfileSettings extends StatelessWidget {
  const ProfileSettings({
    super.key,
    required this.text,
    required this.onTap,
    required this.end,
  });
  final String text;
  final void Function() onTap;
  final dynamic end;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      onTap: onTap,
      child: Container(
        height: 60,
        width: 350,
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(17),
          child: Row(
            children: [
              Text(text, style: TextStyles.textStyle18),
              // ignore: prefer_const_constructors
              Spacer(),

              end
            ],
          ),
        ),
      ),
    );
  }
}
