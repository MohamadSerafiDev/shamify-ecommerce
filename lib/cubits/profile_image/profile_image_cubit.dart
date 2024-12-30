import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';
import 'package:store/shared_preferences/profile_image_save.dart';

part 'profile_image_state.dart';

class ProfileImageCubit extends Cubit<ProfileImageState> {
  ProfileImageCubit() : super(ProfileImageInitial());
  final ImagePicker picker = ImagePicker();

  String imagePath = '';

  Future<void> checkImage() async {
    String? path = await ProfileImageSave().getPath();
    if (path != null) {
      imagePath = path;
      emit(ProfileImageUpdated());
    }
  }

  Future pickImageFromGallery() async {
    XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      imagePath = image.path;
      await ProfileImageSave().savePath(imagePath);
      emit(ProfileImageUpdated());
    }
  }
}
