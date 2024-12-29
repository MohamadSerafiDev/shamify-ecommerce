import 'package:store/api/api.dart';
import 'package:store/styles/constants.dart';

class GetCheckout {
  String baseUrl = '${Constants.localip}/api/v1/get-invoice';

  Future<dynamic> getInvoice({required dynamic dataBody}) async {
    dynamic data = await Api().post(
      url: baseUrl,
      body: dataBody,
      withToken: true,
    );
    // for (var element in data['cart']['items']) {
    //   print(element['quantity']);
    // }
    // print(data['cart']['items'][0]['quantity']);
    // print(data['items'][0]['item']);
    print(data);
    return data;
  }
}
