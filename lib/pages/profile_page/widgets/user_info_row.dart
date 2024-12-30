import 'package:flutter/material.dart';
import 'package:store/styles/text_styles.dart';

class UserInfoRow extends StatelessWidget {
  const UserInfoRow({
    super.key,
    required this.firstNameController,
    required this.title,
  });

  final TextEditingController firstNameController;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          '$title : ',
          style: TextStyles.textStyle18,
        ),
        Flexible(
          child: TextFormField(
              controller: firstNameController,
              // initialValue: '${snapshot.data?.firstName}',
              style: const TextStyle(color: Colors.grey),
              decoration: const InputDecoration(
                border: InputBorder.none,
              )),
        )
      ],
    );
  }
}
