import 'package:flutter/material.dart';
import 'package:store/styles/text_styles.dart';

class FirstAndLastNameAndAddressEdit extends StatelessWidget {
  const FirstAndLastNameAndAddressEdit({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 7),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Name: ',
            style: TextStyles.textStyle18,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'phone: ',
                style: TextStyles.textStyle14.copyWith(
                  color: Colors.grey,
                ),
              ),
              TextButton(onPressed: () {}, child: const Text("Edit"))
            ],
          ),
          Text(
            'Address: ',
            style: TextStyles.textStyle14.copyWith(
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
