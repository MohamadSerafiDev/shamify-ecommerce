import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store/pages/profile_page/widgets/user_info_row.dart';
import 'package:store/services/user/update_user_info.dart';

class FirstAndLastNameAndAddressEdit extends StatelessWidget {
  FirstAndLastNameAndAddressEdit({
    super.key,
  });
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 220,
        width: 350,
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: FutureBuilder(
          future: UpdateUserInfo().updateUser(body: null),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              firstNameController.text = '${snapshot.data?.firstName}';
              lastNameController.text = '${snapshot.data?.lastName}';
              addressController.text = '${snapshot.data?.location}';
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    UserInfoRow(
                      firstNameController: firstNameController,
                      title: 'First name',
                    ),
                    UserInfoRow(
                        firstNameController: lastNameController,
                        title: 'Last name'),
                    UserInfoRow(
                        firstNameController: addressController,
                        title: 'Address'),
                    ElevatedButton(
                      onPressed: () async {
                        await UpdateUserInfo().updateUser(
                          body: jsonEncode(
                            {
                              'firstName': firstNameController.text,
                              'lastName': lastNameController.text,
                              'location': addressController.text
                            },
                          ),
                        );
                        Get.snackbar(
                          'success',
                          'user information updated',
                        );
                      },
                      child: const Text("Save changes"),
                    )
                  ],
                ),
              );
            } else {
              return Container();
            }
          },
        ));
  }
}
