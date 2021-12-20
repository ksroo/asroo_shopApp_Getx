import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:udemy_shop_app/logic/controllers/cart_controller.dart';
import 'package:udemy_shop_app/logic/controllers/category_controller.dart';
import 'package:udemy_shop_app/logic/controllers/product_controller.dart';

import 'package:udemy_shop_app/models/product_models.dart';
import 'package:udemy_shop_app/utils/theme.dart';
import 'package:udemy_shop_app/view/screens/products_details_screen.dart';
import 'package:udemy_shop_app/view/widgets/text_utils.dart';

class CategoryDetailsScreen extends StatelessWidget {
  CategoryDetailsScreen({Key? key}) : super(key: key);

  final controller = Get.find<CategoryController>();
  final cartController = Get.find<CartController>();
  final productController = Get.find<ProductController>();

  @override
  Widget build(BuildContext context) {
    controller.getCategory("jewelery");
    return Scaffold(
      appBar: AppBar(),
      body: GridView.builder(
        itemCount: 5,
        // itemCount: productController
        //     .categoryTest(
        //         controller.getCatehoryList.forEach((element) { }))
        //     .toList()
        //     .length,
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          childAspectRatio: 0.8,
          mainAxisSpacing: 9.0,
          crossAxisSpacing: 6.0,
          maxCrossAxisExtent: 200,
        ),
        itemBuilder: (context, index) {
          return buildCardItems(
            image: productController
                .categoryTest(controller.getCatehoryList[index])[index]
                .image,
            price: productController
                .categoryTest(controller.getCatehoryList[index])[index]
                .price,
            rate: productController
                .categoryTest(controller.getCatehoryList[index])[index]
                .rating
                .rate,
            productId: productController
                .categoryTest(controller.getCatehoryList[index])[index]
                .id,
            productModels: productController
                .categoryTest(controller.getCatehoryList[index])[index],
            onTap: () {
              Get.to(
                () => ProductsDetailsScreen(
                  productModel: controller.catehoryList[index],
                ),
              );
            },
          );
        },
      ),
    );
  }

  Widget buildCardItems({
    required String image,
    required double price,
    required double rate,
    required int productId,
    required Function() onTap,
    required ProductModels productModels,
  }) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: InkWell(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 3.0,
                blurRadius: 5.0,
              ),
            ],
          ),
          child: Column(
            children: [
              Obx(
                () => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        productController.manageFavourites(productId);
                      },
                      icon: productController.isFavourites(productId)
                          ? const Icon(
                              Icons.favorite,
                              color: Colors.red,
                            )
                          : const Icon(
                              Icons.favorite_outline,
                              color: Colors.black,
                            ),
                    ),
                    IconButton(
                      onPressed: () {
                        cartController.addProductToCart(productModels);
                      },
                      icon: const Icon(
                        Icons.shopping_cart,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                height: 140,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Image.network(
                  image,
                  fit: BoxFit.fitHeight,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "\$ $price",
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Container(
                      height: 20,
                      width: 45,
                      decoration: BoxDecoration(
                        color: mainColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 3, right: 2),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextUtils(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                              text: "$rate",
                              color: Colors.white,
                              underLine: TextDecoration.none,
                            ),
                            const Icon(
                              Icons.star,
                              size: 13,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
