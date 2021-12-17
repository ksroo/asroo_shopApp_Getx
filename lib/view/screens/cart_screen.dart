import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:udemy_shop_app/logic/controllers/cart_controller.dart';
import 'package:udemy_shop_app/utils/theme.dart';
import 'package:udemy_shop_app/view/widgets/cart/cart_product_cart.dart';
import 'package:udemy_shop_app/view/widgets/cart/cart_total.dart';
import 'package:udemy_shop_app/view/widgets/cart/empty_cart.dart';

class CartScreen extends StatelessWidget {
  CartScreen({Key? key}) : super(key: key);

  final controller = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Cart Items"),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Get.isDarkMode ? darkGreyClr : mainColor,
          actions: [
            IconButton(
              onPressed: () {
                controller.clearAllItems();
              },
              icon: const Icon(Icons.backspace),
            ),
          ],
        ),
        backgroundColor: context.theme.backgroundColor,
        body: Obx(() {
          if (controller.productsMap.isEmpty) {
            return const EmptyCart();
          } else {
            return SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: 600,
                    child: ListView.separated(
                      itemCount: controller.productsMap.length,
                      itemBuilder: (context, index) {
                        return CartProductCard(
                         
                          index: index,
                          productModel:
                              controller.productsMap.keys.toList()[index],
                          quantity:
                              controller.productsMap.values.toList()[index],
                        );
                      },
                      separatorBuilder: (context, index) => const SizedBox(
                        height: 20,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 30),
                    child: CartTotal(),
                  ),
                ],
              ),
            );
          }
        }),
      ),
    );
  }
}
