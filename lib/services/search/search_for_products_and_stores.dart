import 'package:store/api/api.dart';
import 'package:store/styles/constants.dart';

class SearchForProductsAndStores {
  String baseUrl = '${Constants.localip}/api/v1/search';
  dynamic storesData;

  Future<dynamic> search({required String query}) async {
    Map<String, dynamic> data = await Api().post(
      url: '$baseUrl/$query',
      body: null,
      withToken: true,
    );

    dynamic searchResult = [];
    for (var element in data['data']) {
      searchResult.add(element);
    }

    return searchResult;
  }
}
