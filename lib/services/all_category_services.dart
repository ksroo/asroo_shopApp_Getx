import 'package:udemy_shop_app/models/all_category_model.dart';
import 'package:udemy_shop_app/utils/my_string.dart';
import 'package:http/http.dart' as http;

class AllCatgeoryServices {
  static Future<List<String>> getAllCategory() async {
    var response = await http.get(Uri.parse('$baseUrl/products/categories'));

    if (response.statusCode == 200) {
      var jsonData = response.body;
      return getAllCategoryModelFromJson(jsonData);
    } else {
      return throw Exception("Failed to load product");
    }
  }
}
