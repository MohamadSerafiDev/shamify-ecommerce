import 'package:store/api/api.dart';
import 'package:store/styles/constants.dart';

class GetSpecificStoreProducts {
  String baseUrl = '${Constants.localip}/api/v1/stores';

  Future<List> getStoreWithProducts({required int id}) async {
    Map<String, dynamic> data = await Api().get(
      url: '$baseUrl/$id?withProducts=true',
    );

    List storeProducts = [];
    for (var element in data['data']['products']) {
      storeProducts.add(element);
    }
    print(storeProducts);
    return storeProducts;
  }
}
