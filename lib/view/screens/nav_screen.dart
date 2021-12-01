import 'package:asroo_shop/logic/controller/product_controller.dart';

import '../../logic/controller/auth_controller.dart';
import '../../logic/controller/nav_controller.dart';
import '../../utils/my_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class NavScreen extends StatelessWidget {
  NavScreen({Key? key}) : super(key: key);
  final controller = Get.put(NavController());
  final authController = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        appBar: AppBar(
          leading: Container(),
          actions: [
            IconButton(
              onPressed: () {
                authController.signOutFromApp();
              },
              icon: Image.asset("assets/images/shop.png"),
            )
          ],
          elevation: 0,
          backgroundColor: MyColor.mainColor,
          centerTitle: true,
          title: Text(controller.title[controller.currentIndex.value]),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: controller.currentIndex.value,
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(
                activeIcon: Icon(
                  Icons.home,
                  color: MyColor.mainColor,
                ),
                icon: Icon(
                  Icons.home,
                  color: Colors.black,
                ),
                label: ""),
            BottomNavigationBarItem(
                activeIcon: Icon(
                  Icons.category,
                  color: MyColor.mainColor,
                ),
                icon: Icon(
                  Icons.category,
                  color: Colors.black,
                ),
                label: ""),
            BottomNavigationBarItem(
                activeIcon: Icon(
                  Icons.favorite,
                  color: MyColor.mainColor,
                ),
                icon: Icon(
                  Icons.favorite,
                  color: Colors.black,
                ),
                label: ""),
            BottomNavigationBarItem(
                activeIcon: Icon(
                  Icons.settings,
                  color: MyColor.mainColor,
                ),
                icon: Icon(
                  Icons.settings,
                  color: Colors.black,
                ),
                label: ""),
          ],
          onTap: (index) {
            controller.currentIndex.value = index;
          },
        ),
        body: IndexedStack(
          index: controller.currentIndex.value,

          // ignore: invalid_use_of_protected_member
          children: controller.tabs.value,
        ),
      );
    });
  }
}
