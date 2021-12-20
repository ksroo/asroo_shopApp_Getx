import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

import 'package:udemy_shop_app/models/product_models.dart';
import 'package:udemy_shop_app/services/all_category_services.dart';
import 'package:udemy_shop_app/services/category_services.dart';

class CategoryController extends GetxController {
  var getCatehoryList = <String>[].obs;
  var catehoryList = <ProductModels>[].obs;
  var currentIndex = 0.obs;
  var isLoading = true.obs;

  

  @override
  void onInit() {
    super.onInit();

    getAllCategory();
  }

  void getAllCategory() async {
    var allCategory = await AllCatgeoryServices.getAllCategory();

    try {
      isLoading(true);
      if (allCategory.isNotEmpty) {
        getCatehoryList.addAll(allCategory);
      }
    } finally {
      isLoading(false);
    }
  }

  void getCategory(String categoryName) async {
    var category = await CategoryServices.getCategory(categoryName);

    try {
      isLoading(true);
      if (category.isNotEmpty) {
        catehoryList.addAll(category);
        
      }
    } finally {
      isLoading(false);
    }
  }

  // List<ProductModels> findByCategory(String categoryName){
  //   catehoryList.value = category
  //           .where((element) =>
  //               element.category!.contains(categoryName.toLowerCase()))
  //           .toList();
  // }
}
