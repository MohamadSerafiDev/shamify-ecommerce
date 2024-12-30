import 'package:flutter/material.dart';
import 'package:store/styles/text_styles.dart';

class TabRow extends StatelessWidget {
  const TabRow({
    super.key,
    required this.text,
    required this.icon,
  });
  final String text;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          color: Colors.white,
        ),
        Text(
          '  $text',
          style: TextStyles.textStyle18,
        ),
      ],
    );
  }
}
