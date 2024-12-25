// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:store/styles/text_styles.dart';

class NameAndDesc extends StatelessWidget {
  const NameAndDesc({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 20,
        ),
        Text(
          'name',
          textAlign: TextAlign.start,
          style: TextStyles.textStyle22,
        ),
        SizedBox(
          height: 9,
        ),
        Text(
          'nice cart to you',
          textAlign: TextAlign.start,
          style: TextStyles.textStyle14,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
