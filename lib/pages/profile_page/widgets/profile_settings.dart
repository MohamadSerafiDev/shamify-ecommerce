import 'package:flutter/material.dart';
import 'package:store/styles/assets.dart';
import 'package:store/styles/constants.dart';
import 'package:store/styles/text_styles.dart';

class ProfileSettings extends StatelessWidget {
  const ProfileSettings({
    super.key,
    required this.text,
    required this.onTap,
  });
  final String text;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      onTap: () {},
      child: Container(
        height: 60,
        width: 350,
        decoration: BoxDecoration(
          color: Constants.darkinsidecolor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(17),
          child: Row(
            children: [
              Text(text, style: TextStyles.textStyle18),
              // ignore: prefer_const_constructors
              Spacer(),
              Image.asset(AppIcons.right, width: 11, color: Colors.white),
            ],
          ),
        ),
      ),
    );
  }
}
