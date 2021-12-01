import '../model/product_model.dart';
import 'package:http/http.dart' as http;

class ProductServices {
  static Future<List<ProductModel>> getProducts() async {
    var response = await http.get(Uri.parse(
        "https://makeup-api.herokuapp.com/api/v1/products.json?brand=maybelline"));

    if (response.statusCode == 200) {
      var jsonData = response.body;
      return productModelFromJson(jsonData);
    } else {
      return throw Exception('Failed to load courses');
    }
  }
}
