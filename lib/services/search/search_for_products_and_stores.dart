import 'package:flutter/material.dart';
import 'package:store/api/api.dart';
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

    dynamic productsResult = [];
    for (var element in data['The Products']) {
      productsResult.add(element);
    }

    return SearchModel(products: productsResult, stores: storesResult);
  }
}

class SearchModel {
  SearchModel({required this.products, required this.stores});
  final dynamic products;
  final dynamic stores;
}
