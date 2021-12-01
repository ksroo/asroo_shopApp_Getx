import 'package:get_storage/get_storage.dart';

import '../../model/product_model.dart';
import '../../services/product_services.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class ProductController extends GetxController {
  var productList = <ProductModel>[].obs;
  var isLoading = true.obs;
  var favouriteList = <ProductModel>[].obs;
  RxInt counter = 1.obs;
  List<double> priceSumTotal = <double>[].obs;

  var storage = GetStorage();

  @override
  void onInit() {
    super.onInit();
    getProducts();
  }

  void getProducts() async {
    var products = await ProductServices.getProducts();

    try {
      isLoading(true);
      // ignore: unnecessary_null_comparison
      if (products.isNotEmpty) {
        productList.addAll(products);
      }
    } finally {
      isLoading(false);
    }
  }

  void manageFavourite(int produtId) {
    final existingIndex =
        favouriteList.indexWhere((element) => element.id == produtId);

    if (existingIndex >= 0) {
      favouriteList.removeAt(existingIndex);
      storage.remove("isFavourite");
    } else {
      favouriteList
          .add(productList.firstWhere((element) => element.id == produtId));
      storage.write("isFavourite", isFavourite(produtId));
    }
  }

  bool isFavourite(int id) {
    return favouriteList.any((element) => element.id == id);
  }

  void addPrice(double price) {
    if (counter.value == 1) {
      priceSumTotal.add(price + price);
      counter.value++;
    } else {
      priceSumTotal.add(price);
      counter.value++;
    }
  }

  void minusePrice(double price) {
    if (counter.value <= 1) {
      counter.value == 0;
      priceSumTotal.remove(price);
    } else {
      if (counter.value == 1) {
        priceSumTotal.removeLast();
      } else {
        counter.value--;
        priceSumTotal.remove(price);
      }
    }
  }
}
