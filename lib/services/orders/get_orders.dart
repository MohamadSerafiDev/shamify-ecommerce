import 'package:store/api/api.dart';
import 'package:store/models/order_model.dart';
import 'package:store/services/stores/get_specific_store_products.dart';
import 'package:store/styles/constants.dart';

class GetOrders {
  String baseUrl = '${Constants.localip}/api/v1/get-orders';

  Future<List<OrderModel>> get() async {
    dynamic data = await Api().get(
      url: baseUrl,
    );
    List<OrderModel> orderData = [];
    List<ProductModel> productsData = [];

    for (var i = 0; i < data.length; i++) {
      //set products data from orderItems in api response to model
      for (var j = 0; j < data[i]['orderItems'].length; j++) {
        productsData.add(
          ProductModel(
            id: data[i]['orderItems'][j]['product']['id'],
            count: data[i]['orderItems'][j]['product']['count'],
            name: data[i]['orderItems'][j]['product']['name'],
            price: data[i]['orderItems'][j]['product']['price'],
            storeName: 'store name',
            description: data[i]['orderItems'][j]['product']['description'],
            category: data[i]['orderItems'][j]['product']['category'],
            imageURL: data[i]['orderItems'][j]['product']['imageURL'],
            isFavorite: data[i]['orderItems'][j]['product']['isFavorite'],
          ),
        );
      }

      orderData.add(
        OrderModel(
          id: data[i]['id'],
          totalprice: data[i]['totalPrice'],
          status: data[i]['status'],
          dileveredat: data[i]['createdAt'],
          orderedat: data[i]['updatedAt'],
          products: productsData,
        ),
      );
      // to make productsData clear for every order
      productsData = [];
    }
    // print('=============================$orderData');
    // OrderModel orderData =
    return orderData;
  }
}
