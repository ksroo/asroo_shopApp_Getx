import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:udemy_shop_app/logic/controllers/auth_controller.dart';
import 'package:udemy_shop_app/logic/controllers/theme_controller.dart';
import 'package:udemy_shop_app/utils/theme.dart';
import 'package:udemy_shop_app/view/widgets/settings/icon_widget.dart';
import 'package:udemy_shop_app/view/widgets/settings/profile_image.dart';

class SettingsScreen extends StatelessWidget {
  SettingsScreen({Key? key}) : super(key: key);

  final controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          ProfileImage(),
          IconWidget(
            color: darkSettings,
            icon: Icons.dark_mode,
            text: "Dark Mode",
            onTap: () {
              ThemeController().changesTheme();
            },
          ),
          GetBuilder<AuthController>(
            builder: (_) {
              return IconWidget(
                color: logOutSettings,
                icon: Icons.logout,
                text: "Logout",
                onTap: () {
                  Get.defaultDialog(
                    title: "Logout From App",
                    titleStyle: const TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    middleText: 'Are you sure you need to logout',
                    middleTextStyle: const TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    backgroundColor: Colors.grey,
                    radius: 10,
                    textCancel: " No ",
                    cancelTextColor: Colors.white,
                    textConfirm: " YES ",
                    confirmTextColor: Colors.white,
                    onCancel: () {
                      Get.back();
                    },
                    onConfirm: () {
                      controller.signOutFromApp();
                    },
                    buttonColor: Get.isDarkMode ? pinkClr : mainColor,
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
