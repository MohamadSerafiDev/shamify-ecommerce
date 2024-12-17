import 'package:store/api/api.dart';
import 'package:store/styles/constants.dart';

class GetAllProducts {
  String baseUrl = '${Constants.localip}/api/v1/products';

  Future<List> getProducts() async {
    Map<String, dynamic> data = await Api().get(url: baseUrl);

    List productsData = [];
    for (var element in data['data']) {
      productsData.add(element);
    }
    print(productsData);
    return productsData;
  }
}

// class ProductsData {
//   String ingredients;
//   String type;
//   String imagesource;
//   int id;
//   int price;
//   String name;
//   int count;

//   ProductsData({
//     required this.name,
//     required this.ingredients,
//     required this.type,
//     required this.imagesource,
//     required this.id,
//     required this.price,
//     required this.count,
//   });
//   factory ProductsData.fromJson(Map<String, dynamic> data) {
    
//     for (var element in data['data']) {
      
//     }
//     List temp = [];
//     List path = data['forecast']['forecastday'][0]['hour'];
//     //get weather for every hour..!
//     for (var i = 0; i < 24; i++) {
//       temp.add({
//         'time': path[i]['time'],
//         'temp': path[i]['temp_c'],
//         'is_day': path[i]['is_day'],
//         'condition': path[i]['condition']['text'],
//         'conditionCode': path[i]['condition']['code']
//       });
//     }
    

//     return ProductsData(
//         name: '',
//         ingredients: '',
//         type: '',
//         imagesource: '',
//         id: null,
//         price: null,
//         count: null);
//   }
// }
