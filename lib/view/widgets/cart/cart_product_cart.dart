import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:udemy_shop_app/logic/controllers/cart_controller.dart';
import 'package:udemy_shop_app/models/product_models.dart';
import 'package:udemy_shop_app/utils/theme.dart';

class CartProductCard extends StatelessWidget {
  final ProductModels productModel;
  final int quantity;
  final int index;

  CartProductCard({
    required this.productModel,
    required this.quantity,
    required this.index,
    Key? key,
  }) : super(key: key);
  final controller = Get.find<CartController>();
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20),
      height: 130,
      width: 100,
      decoration: BoxDecoration(
        color: Get.isDarkMode
            ? pinkClr.withOpacity(0.7)
            : mainColor.withOpacity(0.4),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 120,
            width: 100,
            margin: const EdgeInsets.only(left: 15),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                image: NetworkImage(productModel.image),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Expanded(
            flex: 15,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  productModel.title,
                  style: TextStyle(
                    overflow: TextOverflow.ellipsis,
                    color: Get.isDarkMode ? Colors.white : Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "\$${controller.productSubTotal[index].toStringAsFixed(2)}",
                  style: TextStyle(
                    color: Get.isDarkMode ? Colors.white : Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          const Spacer(
            flex: 1,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      controller.removeProductFromCart(productModel);
                    },
                    icon: Icon(
                      Icons.remove_circle,
                      color: Get.isDarkMode ? Colors.white : Colors.black,
                    ),
                  ),
                  Text(
                    "$quantity",
                    style: const TextStyle(
                      overflow: TextOverflow.ellipsis,
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      controller.addProductToCart(productModel);
                    },
                    icon: Icon(
                      Icons.add_circle,
                      color: Get.isDarkMode ? Colors.white : Colors.black,
                    ),
                  ),
                ],
              ),
              IconButton(
                onPressed: () {
                  controller.removeOneItems(productModel);
                },
                icon: Icon(
                  Icons.delete,
                  color: Get.isDarkMode ? Colors.black : Colors.red,
                  size: 20,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
