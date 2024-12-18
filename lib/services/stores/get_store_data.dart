import 'package:store/api/api.dart';
import 'package:store/styles/constants.dart';

class GetStoreData {
  String baseUrl = '${Constants.localip}/api/v1/stores';

  Future<Map> getData({required int id}) async {
    Map<String, dynamic> data = await Api().get(
      url: '$baseUrl/$id',
    );

    Map storeData = data['data'];

    print(storeData);
    return storeData;
  }
}
