import 'package:flutter/material.dart';
import 'package:store/styles/text_styles.dart';

class NameAndDesc extends StatelessWidget {
  const NameAndDesc({
    super.key,
    required this.name,
    required this.desc,
  });
  final String name;
  final String desc;

  @override
  Widget build(BuildContext context) {
    return Column(
      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 20,
        ),
        Text(
          name,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.start,
          style: TextStyles.textStyle22,
        ),
        const SizedBox(
          height: 9,
        ),
        Text(
          desc,
          textAlign: TextAlign.start,
          style: TextStyles.textStyle14,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
