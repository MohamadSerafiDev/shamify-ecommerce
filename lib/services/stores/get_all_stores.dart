import 'package:store/api/api.dart';
import 'package:store/styles/constants.dart';

class GetAllStores {
  String baseUrl = '${Constants.localip}/api/v1/stores';
  // dynamic storesData;

  Future<dynamic> getStores() async {
    Map<String, dynamic> data = await Api().get(
      url: baseUrl,
    );

    dynamic storesData = [];
    for (var element in data['data']) {
      storesData.add(element);
    }

    return storesData;
  }
}
