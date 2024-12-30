import 'package:store/api/api.dart';
import 'package:store/models/user_model.dart';
import 'package:store/styles/constants.dart';

class UpdateUserInfo {
  String baseUrl = '${Constants.localip}/api/v1/user-update';
  // dynamic storesData;

  Future<UserModel> updateUser({required dynamic body}) async {
    Map<String, dynamic> data = await Api().post(
      url: baseUrl,
      body: body,
      withToken: true,
    );

    return UserModel(
        firstName: data['data']['firstName'],
        lastName: data['data']['lastName'],
        location: data['data']['location']);
  }
}
