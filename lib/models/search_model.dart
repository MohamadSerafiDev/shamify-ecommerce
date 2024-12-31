import 'package:store/pages/product_page/product_page.dart';
import 'package:store/services/stores/get_specific_store_products.dart';

class SearchModel {
  SearchModel({
    required this.products,
    required this.stores,
  });
  final List<ProductModel> products;
  final List stores;
}
