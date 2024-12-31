import 'package:store/api/api.dart';
import 'package:store/services/stores/get_specific_store_products.dart';
import 'package:store/styles/constants.dart';

class GetUserFavorites {
  String baseUrl = '${Constants.localip}/api/v1/get-favorite';

  Future<List<ProductModel>> getFav() async {
    Map<String, dynamic> data = await Api().get(
      url: baseUrl,
    );

    List path = data['data'];
    List<ProductModel> favProducts = [];
    for (var i = 0; i < path.length; i++) {
      favProducts.add(
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
    return favProducts;
  }
}
