
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';

part 'profile_image_state.dart';

class ProfileImageCubit extends Cubit<ProfileImageState> {
  ProfileImageCubit() : super(ProfileImageInitial());
  final ImagePicker picker = ImagePicker();

  String imagePath = '';

  Future pickImageFromGallery() async {
    XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      imagePath = image.path;
      emit(ProfileImageUpdated());
    }
  }

  void updateImage(String path) {
    imagePath = path;
    emit(ProfileImageUpdated());
  }
}
