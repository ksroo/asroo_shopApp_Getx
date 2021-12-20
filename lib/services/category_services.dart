import 'package:http/http.dart' as http;

import 'package:udemy_shop_app/models/product_models.dart';
import '../utils/my_string.dart';

class CategoryServices {
  static Future<List<ProductModels>> getCategory(String nameCategory) async {
    var response =
        await http.get(Uri.parse('$baseUrl/products/category/$nameCategory'));

    if (response.statusCode == 200) {
      var jsonData = response.body;
      return productModelsFromJson(jsonData);
    } else {
      return throw Exception("Failed to load product");
    }
  }
}
