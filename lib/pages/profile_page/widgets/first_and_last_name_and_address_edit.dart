import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:store/services/user/update_user_info.dart';
import 'package:store/styles/text_styles.dart';

class FirstAndLastNameAndAddressEdit extends StatelessWidget {
  const FirstAndLastNameAndAddressEdit({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: UpdateUserInfo().updateUser(body: null),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Text(
                      'First name: ',
                      style: TextStyles.textStyle18,
                    ),
                    Text('${snapshot.data?.firstName}',
                        style: const TextStyle(color: Colors.grey))
                  ],
                ),
                Row(
                  children: [
                    const Text('Last name: ', style: TextStyles.textStyle18),
                    Text('${snapshot.data?.lastName}',
                        style: const TextStyle(color: Colors.grey)),
                    const Spacer(),
                    TextButton(
                      onPressed: () {
                        UpdateUserInfo().updateUser(body: {
                          'firstName': 'mohamad',
                          'lastName': 'serafi'
                        });
                      },
                      child: const Text("Edit"),
                    )
                  ],
                ),
                Row(
                  children: [
                    Text(
                      'Address: ',
                      style: TextStyles.textStyle18.copyWith(),
                    ),
                    Text(
                      '${snapshot.data?.location}',
                      style: const TextStyle(color: Colors.grey),
                    )
                  ],
                ),
              ],
            ),
          );
        } else {
          return Container();
        }
      },
    );
  }
}
