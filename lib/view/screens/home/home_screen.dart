import 'package:asroo_shop/logic/controller/product_controller.dart';
import 'package:get/get.dart';

import '../../../utils/my_color.dart';
import '../../widgets/home/card_items.dart';
import '../../widgets/home/search_text_form.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 220,
          decoration: const BoxDecoration(
            color: MyColor.mainColor,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "Find Your",
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "INSPIRATION",
                  style: TextStyle(color: Colors.white, fontSize: 28),
                ),
                SizedBox(
                  height: 40,
                ),
                SearchFormText(),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        const Padding(
          padding: EdgeInsets.only(left: 10),
          child: Align(
            alignment: Alignment.topLeft,
            child: Text(
              "Categories",
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        CardItems(),
      ],
    );
  }
}
