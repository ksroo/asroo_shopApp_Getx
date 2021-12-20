import 'package:flutter/material.dart';
import 'package:udemy_shop_app/view/widgets/category/category_widget.dart';

// ignore: must_be_immutable
class CategoryScreen extends StatelessWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Column(
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          const Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 15, top: 20),
              child: Text(
                "Category",
                style: TextStyle(
                  color: Colors.black,
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
