import 'package:store/api/api.dart';
import 'package:store/models/search_model.dart';
import 'package:store/services/stores/get_specific_store_products.dart';
import 'package:store/styles/constants.dart';

class SearchForProductsAndStores {
  String baseUrl = '${Constants.localip}/api/v1/search';

  Future<SearchModel> search({required String query}) async {
    dynamic data = await Api().get(
      url: '$baseUrl/$query',
    );

    dynamic storesResult = [];
    for (var element in data['The Stores']) {
      storesResult.add(element);
    }

    List path = data['The Products'];
    List<ProductModel> productsResult = [];
    for (var i = 0; i < path.length; i++) {
      productsResult.add(
        ProductModel(
          id: path[i]['id'],
          count: path[i]['count'],
          name: path[i]['name'],
          price: path[i]['price'],
          storeName: 'store name',
          description: path[i]['description'],
          category: path[i]['category'],
          imageURL: path[i]['imageURL'],
          isFavorite: path[i]['isFavorite'],
        ),
      );
    }

    return SearchModel(products: productsResult, stores: storesResult);
  }
}
