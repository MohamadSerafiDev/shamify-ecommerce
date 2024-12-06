import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/cubits/profile_image/profile_image_cubit.dart';
import 'package:store/styles/assets.dart';
import 'package:store/styles/constants.dart';

class ProfileImage extends StatelessWidget {
  const ProfileImage({
    super.key,
  });
//s
  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        splashColor: Colors.transparent,
        onTap: () {
          BlocProvider.of<ProfileImageCubit>(context)
              .updateImage(AppImages.search);
        },
        child: Container(
          height: 100,
          width: 100,
          decoration: BoxDecoration(
            color: Constants.darkinsidecolor,
            borderRadius: BorderRadius.circular(50),
            image: DecorationImage(
                image: AssetImage(
                  BlocProvider.of<ProfileImageCubit>(context).imagePath,
                ),
                fit: BoxFit.cover),
          ),
        ),
      ),
    );
  }
}
