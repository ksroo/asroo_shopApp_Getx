import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get_storage/get_storage.dart';
import '../../models/product_models.dart';
import '../../services/category_services.dart';
import '../../services/product_services.dart';

class ProductController extends GetxController {
  var productList = <ProductModels>[].obs;
  var favouritesList = <ProductModels>[].obs;
  var isLoading = true.obs;
  var stoarge = GetStorage();
  var imageList = <ProductModels>[].obs;

  //search
  var searchList = <ProductModels>[].obs;
  TextEditingController searchTextController = TextEditingController();

  @override
  void onInit() {
    super.onInit();

    List? storedShoppings = stoarge.read<List>('isFavouritesList');

    if (storedShoppings != null) {
      favouritesList =
          storedShoppings.map((e) => ProductModels.fromJson(e)).toList().obs;
    }
    getProducts();
    getCategoryes();
  }

  void getProducts() async {
    var products = await ProductServices.getProduct();

    try {
      isLoading(true);
      if (products.isNotEmpty) {
        productList.addAll(products);
      }
    } finally {
      isLoading(false);
    }
  }

  // Logic for Favourites Screen

  void manageFavourites(int productId) async {
    var existingIndex =
        favouritesList.indexWhere((element) => element.id == productId);

    if (existingIndex >= 0) {
      favouritesList.removeAt(existingIndex);
      await stoarge.remove("isFavouritesList");
    } else {
      favouritesList
          .add(productList.firstWhere((element) => element.id == productId));

      await stoarge.write("isFavouritesList", favouritesList);
    }
  }

  bool isFavourites(int productId) {
    return favouritesList.any((element) => element.id == productId);
  }

//Search Bar Logic

  void addSearchToList(String searchName) {
    searchName = searchName.toLowerCase();

    searchList.value = productList.where((search) {
      var searchTitle = search.title.toLowerCase();
      var searchPrice = search.price.toString().toLowerCase();

      return searchTitle.contains(searchName) ||
          searchPrice.toString().contains(searchName);
    }).toList();

    update();
  }

  void clearSearch() {
    searchTextController.clear();
    addSearchToList("");
  }

  //Category Lis Featch data

  
  var categoryNameList = <String>[].obs;
  var categoryList = <ProductModels>[].obs;

  var showGridView = false.obs;
  var showCategoryNames = false.obs;

  void getCategoryes() async {
    var categoryName = await CategoryServices.getCategory();

    try {
      showCategoryNames(true);
      if (categoryName.isNotEmpty) {
        categoryNameList.addAll(categoryName);
      }
    } finally {
      showCategoryNames(false);
    }
  }

  loadCategory(String categoryName) async {
    showGridView(true);
    categoryList.value = await AllCategoryServices.getALLCategory(categoryName);

    showGridView(false);
  }

  getCategoryIndex(index) async {
    var categoryAllName = await loadCategory(categoryNameList[index]);

    if (categoryAllName != null) {
      categoryList.value = categoryAllName;
    }
  }
}
