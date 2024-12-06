import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'profile_image_state.dart';

class ProfileImageCubit extends Cubit<ProfileImageState> {
  ProfileImageCubit() : super(ProfileImageInitial());

  String imagePath = "assets/images/user.JPG";
  void updateImage(String path) {
    imagePath = path;
    emit(ProfileImageUpdated());
  }
}
