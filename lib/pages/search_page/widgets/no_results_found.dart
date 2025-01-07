import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:store/styles/assets.dart';
import 'package:store/styles/text_styles.dart';

class NoResultsFound extends StatelessWidget {
  const NoResultsFound({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Image.asset(
            AppImages.search,
            width: 200,
          ),
        ),
        const Gap(
          20,
        ),
        const Text(
          'No thing found',
          style: TextStyles.textStyle22,
        ),
      ],
    );
  }
}
