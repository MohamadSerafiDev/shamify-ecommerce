import 'package:store/api/api.dart';
import 'package:store/styles/constants.dart';

class GetSpecificStoreProducts {
  String baseUrl = '${Constants.localip}/api/v1/stores';

  Future<List<ProductModel>> getStoreWithProducts({required int id}) async {
    Map<String, dynamic> data = await Api().get(
      url: '$baseUrl/$id?withProducts=true',
    );
    List path = data['data']['products'];
    List<ProductModel> storeProducts = [];
    for (var i = 0; i < data['data']['products'].length; i++) {
      storeProducts.add(ProductModel(
        id: path[i]['id'],
        count: path[i]['count'],
        name: path[i]['name'],
        price: path[i]['price'],
        storeName: data['data']['name'],
        description: path[i]['description'],
        category: path[i]['category'],
        imageURL: path[i]['imageURL'],
        isFavorite: path[i]['isFavorite'],
      ));
    }

    print(storeProducts.length);
    return storeProducts;
  }
}

class ProductModel {
  ProductModel({
    required this.id,
    required this.name,
    required this.count,
    required this.price,
    required this.storeName,
    required this.description,
    required this.category,
    required this.imageURL,
    required this.isFavorite,
  });

  final int id;
  final num price;
  final num count;
  final bool isFavorite;
  final String name;
  final String storeName;
  final String description;
  final String category;
  final String imageURL;
}
