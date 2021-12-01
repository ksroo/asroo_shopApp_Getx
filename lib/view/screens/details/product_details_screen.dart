import 'package:asroo_shop/logic/controller/product_controller.dart';
import 'package:asroo_shop/model/product_model.dart';
import 'package:asroo_shop/utils/my_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:collection/src/iterable_extensions.dart';

class ProductDetailsScreen extends GetView<ProductController> {
  final ProductModel productModel;
  const ProductDetailsScreen({required this.productModel, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColor.mainColor,
        title: const Text("Product"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 55, top: 40, right: 30),
                  child: Container(
                    height: 312,
                    width: 306,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 3.0,
                            blurRadius: 5.0),
                      ],
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 10, bottom: 20, right: 10),
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                productModel.name,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Container(
                              height: 30,
                              width: 80,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: const Color(0xff685959),
                              ),
                              child: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  "\$ ${productModel.price}",
                                  style: const TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 80, top: 10),
                  child: Stack(
                    alignment: Alignment.topRight,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Image.network(
                          productModel.imageLink,
                          fit: BoxFit.cover,
                          height: 274,
                          width: 261,
                        ),
                      ),
                      Obx(
                        () => IconButton(
                            onPressed: () {
                              controller.manageFavourite(productModel.id);
                            },
                            icon: controller.isFavourite(productModel.id)
                                ? const Icon(
                                    Icons.favorite,
                                    color: Colors.red,
                                  )
                                : const Icon(Icons.favorite_outline)),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildColorChange(
                  color: MyColor.kCOlor1,
                  radius: 10,
                ),
                const SizedBox(
                  width: 10,
                ),
                buildColorChange(
                  color: MyColor.kCOlor2,
                  radius: 10,
                ),
                const SizedBox(
                  width: 10,
                ),
                buildColorChange(
                  color: MyColor.kCOlor3,
                  radius: 10,
                ),
                const SizedBox(
                  width: 10,
                ),
                buildColorChange(
                  color: MyColor.kCOlor4,
                  radius: 10,
                ),
                const SizedBox(
                  width: 10,
                ),
                buildColorChange(
                  color: MyColor.kCOlor5,
                  radius: 10,
                ),
              ],
            ),
            buildDescription(),
            const SizedBox(
              height: 20,
            ),
            buildAddToCart(),
          ],
        ),
      ),
    );
  }

  Widget buildColorChange({
    required double radius,
    required Color color,
  }) {
    return CircleAvatar(
      backgroundColor: color,
      radius: radius,
    );
  }

  Widget buildDescription() {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 50),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Description",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Row(
                children: [
                  Image.asset(
                    "assets/images/rate.png",
                  ),
                  Text(
                    "(${productModel.rating})",
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                    ),
                  )
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            productModel.description,
            style: const TextStyle(
              fontWeight: FontWeight.w400,
            ),
          )
        ],
      ),
    );
  }

  Widget buildAddToCart() {
    return Container(
      height: 120,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        boxShadow: [
          BoxShadow(
              color: Colors.grey.withOpacity(0.4),
              spreadRadius: 3.0,
              blurRadius: 5.0),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 15, left: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 30,
                  width: 70,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(180),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        InkWell(
                          onTap: () {
                            controller.minusePrice(
                              double.parse(productModel.price),
                            );
                          },
                          child: const CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 10,
                            child: Icon(
                              Icons.remove,
                              color: Colors.black,
                              size: 15,
                            ),
                          ),
                        ),
                        Obx(() => Text("${controller.counter}")),
                        InkWell(
                          onTap: () {
                            controller.addPrice(
                              double.parse(productModel.price),
                            );
                          },
                          child: const CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 10,
                            child: Icon(
                              Icons.add,
                              color: Colors.black,
                              size: 15,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const Spacer(),
                Obx(
                  () => Expanded(
                    child: controller.priceSumTotal.isEmpty
                        ? Text("Total : ${productModel.price} USD")
                        : Text("Total : ${controller.priceSumTotal.sum} USD"),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.grey.shade200,
              shape: const StadiumBorder(),
            ),
            onPressed: () {},
            child: const Text(
              "Add to Cart",
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
