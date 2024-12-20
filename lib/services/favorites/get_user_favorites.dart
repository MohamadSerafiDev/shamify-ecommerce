import 'package:store/api/api.dart';
import 'package:store/styles/constants.dart';

class GetUserFavorites {
  String baseUrl = '${Constants.localip}/api/v1/get-favorite';

  Future<List> getFav() async {
    Map<String, dynamic> data = await Api().get(
      url: baseUrl,
    );

    List favData = [];
    for (var element in data['data']) {
      favData.add(element);
    }
    print(favData);
    return favData;
  }
}
