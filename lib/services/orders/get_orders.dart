import 'package:store/api/api.dart';
import 'package:store/models/order_model.dart';
import 'package:store/styles/constants.dart';

class GetOrders {
  String baseUrl = '${Constants.localip}/api/v1/get-orders';

  Future<List<OrderModel>> get() async {
    dynamic data = await Api().get(
      url: baseUrl,
    );
    List<OrderModel> orderData = [];

    for (var i = 0; i < data.length; i++) {
      orderData.add(
        OrderModel(
          id: data[i]['id'],
          totalprice: data[i]['totalPrice'],
          status: data[i]['status'],
          dileveredat: data[i]['createdAt'],
          orderedat: data[i]['updatedAt'],
          products: data[i]['orderItems'],
        ),
      );
    }
    // print('=============================$orderData');
    // OrderModel orderData =
    return orderData;
  }
}
