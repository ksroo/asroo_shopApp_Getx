import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../logic/controllers/product_controller.dart';
import '../../../routes/routes.dart';
import '../../../utils/theme.dart';


class CategoryWidget extends StatelessWidget {
  CategoryWidget({Key? key}) : super(key: key);


  final productController = Get.find<ProductController>();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
             
            },
            child: Container(
              height: 150,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: NetworkImage(
                    "https://images.unsplash.com/photo-1542291026-7eec264c27ff?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80",

                  
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 20, bottom: 10),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    "category",
                    style: const TextStyle(
                      backgroundColor: Colors.black26,
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          );
        },
        separatorBuilder: (context, index) {
          return const SizedBox(
            height: 20,
          );
        },
        itemCount: 4,
        // itemCount: productController
        //     .categoryTest(controller.getCatehoryList[0])
        //     .length,
      ),
    );
  }
}
