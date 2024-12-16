import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/cubits/profile_image/profile_image_cubit.dart';
import 'package:store/styles/constants.dart';

class ProfileImage extends StatelessWidget {
  const ProfileImage({
    super.key,
  });
//s
  @override
  Widget build(BuildContext context) {
    return Center(
      child: BlocBuilder<ProfileImageCubit, ProfileImageState>(
        builder: (context, state) {
          return Stack(
            children: [
              Container(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                height: 120,
                width: 120,
                decoration: BoxDecoration(
                  color: Constants.darkinsidecolor,
                  borderRadius: BorderRadius.circular(60),
                ),
                child:
                    BlocProvider.of<ProfileImageCubit>(context).imagePath == ''
                        ? const Icon(
                            Icons.image,
                            size: 50,
                            color: Colors.white,
                          )
                        : Image.file(
                            File(BlocProvider.of<ProfileImageCubit>(context)
                                .imagePath),
                            fit: BoxFit.cover,
                          ),
              ),
              Positioned(
                bottom: 3,
                right: 3,
                child: InkWell(
                  onTap: () => BlocProvider.of<ProfileImageCubit>(context)
                      .pickImageFromGallery(),
                  child: Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      color: Constants.buttoncolor,
                      borderRadius: BorderRadius.circular(60),
                    ),
                    child: const Icon(Icons.edit),
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
