import 'package:store/api/api.dart';
import 'package:store/services/stores/get_specific_store_products.dart';
import 'package:store/styles/constants.dart';

class GetCategory {
  String baseUrl = '${Constants.localip}/api/v1/categories';

  Future<List<ProductModel>> getCat(String category) async {
    Map<String, dynamic> data = await Api().get(
      url: '$baseUrl/$category',
    );
    print('==========================$data');

    List path = data['data'];
    List<ProductModel> categoryProducts = [];

    for (var i = 0; i < path.length; i++) {
      categoryProducts.add(
        ProductModel(
          id: path[i]['id'],
          count: path[i]['count'],
          name: path[i]['name'],
          price: path[i]['price'],
          storeName: 'name',
          description: path[i]['description'],
          category: path[i]['category'],
          imageURL: path[i]['imageURL'],
          isFavorite: path[i]['isFavorite'],
        ),
      );
    }

    return categoryProducts;
  }
}
