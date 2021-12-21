import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../logic/controllers/product_controller.dart';
import '../../utils/theme.dart';
import '../widgets/category/category_widget.dart';

class CategoryScreen extends StatelessWidget {
  CategoryScreen({Key? key}) : super(key: key);

  final controller = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Column(
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 15, top: 20),
              child: Text(
                "Category",
                style: TextStyle(
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                  fontSize: 30,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          CategoryWidget(),
        ],
      ),
    );
  }
}
