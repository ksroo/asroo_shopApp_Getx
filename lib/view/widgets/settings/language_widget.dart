// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../l10n/l10n.dart';
import '../../../logic/controllers/setting_controller.dart';
import '../../../utils/my_string.dart';
import '../../../utils/theme.dart';
import 'icon_widget.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LanguageWidget extends StatelessWidget {
  LanguageWidget({Key? key}) : super(key: key);

  final controller = Get.find<SettingController>();
  String langValue = english;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SettingController>(
      builder: (_) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconWidget(
              text: AppLocalizations.of(context)!.language,
              // text: !L10n.all.contains(Locale(controller.langLocal))
              //     ? "language".tr
              //     : AppLocalizations.of(context)!.language,
              // text: "Language".tr,

              color: languageSettings,
              icon: Icons.language,
              onTap: () {},
            ),
            Container(
              width: 120,
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                    color: Get.isDarkMode ? Colors.white : Colors.black,
                    width: 2),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  iconSize: 25,
                  icon: Icon(
                    Icons.arrow_drop_down,
                    color: Get.isDarkMode ? Colors.white : Colors.black,
                  ),
                  items: [
                    DropdownMenuItem(
                      child: Text(
                        english,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      // ignore: prefer_if_null_operators
                      value: controller.langLocal == null ? english : ene,
                    ),
                    DropdownMenuItem(
                      child: Text(
                        arabic,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      value: ara,
                    ),
                    DropdownMenuItem(
                      child: Text(
                        france,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      value: frf,
                    ),
                  ],
                  // ignore: prefer_if_null_operators
                  value: controller.langLocal == null
                      ? langValue
                      : controller.langLocal,
                  onChanged: (value) {
                    controller.changeLanguage(value!);
                    Get.updateLocale(Locale(value));
                  },
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
