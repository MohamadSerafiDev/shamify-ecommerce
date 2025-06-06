import 'package:flutter/material.dart';
import 'package:store/styles/assets.dart';
import 'package:store/styles/text_styles.dart';

class TextRow extends StatelessWidget {
  const TextRow({
    super.key,
    required this.start,
    required this.onPressed,
  });
  final String start;

  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 24,
        bottom: 16,
      ),
      child: Row(
        children: [
          Text(
            start,
            style: TextStyles.textStyle22,
          ),
          const Spacer(),
          TextButton(
            onPressed: onPressed,
            child: const Text("See All", style: TextStyles.textStyle18),
          ),
          Image.asset(
            AppIcons.right,
            width: 9,
            color: Colors.white,
          )
        ],
      ),
    );
  }
}
