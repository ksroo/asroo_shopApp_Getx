import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../logic/controllers/setting_controller.dart';
import '../widgets/settings/language_widget.dart';
import '../widgets/text_utils.dart';
import '../../logic/controllers/auth_controller.dart';
import '../../logic/controllers/theme_controller.dart';
import '../../utils/theme.dart';
import '../widgets/settings/icon_widget.dart';
import '../widgets/settings/profile_image.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SettingsScreen extends StatelessWidget {
  SettingsScreen({Key? key}) : super(key: key);

  final controller = Get.find<AuthController>();
  final settingsController = Get.put(SettingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          ProfileImage(),
          const SizedBox(
            height: 10,
          ),
          Divider(
            color: Get.isDarkMode ? Colors.white : Colors.grey,
            thickness: 2,
          ),
          const SizedBox(
            height: 20,
          ),
          TextUtils(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            text: "GENERAL",
            color: Get.isDarkMode ? pinkClr : mainColor,
            underLine: TextDecoration.none,
          ),
          const SizedBox(
            height: 20,
          ),
          Obx(
            () => Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconWidget(
                  color: darkSettings,
                  icon: Icons.dark_mode,
                  text: "Dark Mode",
                  onTap: () {
                    null;
                  },
                ),
                Switch(
                  activeTrackColor: Get.isDarkMode ? pinkClr : mainColor,
                  activeColor: Get.isDarkMode ? pinkClr : mainColor,
                  value: settingsController.swithchValue.value,
                  onChanged: (value) {
                    ThemeController().changesTheme();
                    settingsController.swithchValue.value = value;
                  },
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          LanguageWidget(),
          const SizedBox(
            height: 20,
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
