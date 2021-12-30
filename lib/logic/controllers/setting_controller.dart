import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../l10n/l10n.dart';
import '../../utils/my_string.dart';

class SettingController extends GetxController {
  var swithchValue = false.obs;
  var storage = GetStorage();
  var langLocal = ene;

  String capitalize(String profileName) {
    return profileName.split(" ").map((str) => str.capitalize).join(" ");
  }
  //Language Logic

  @override
  void onInit() async {
    super.onInit();
    langLocal = await getLanguage;
  }

  void saveLanguage(String lang) async {
    await storage.write("laltla", lang);
  }

  Future<String> get getLanguage async {
    return await storage.read("laltla");
  }

  void changeLanguage(String typeLang) async {
    saveLanguage(typeLang);
    if (langLocal == typeLang) {
      return;
    }
    if (typeLang == frf) {
      langLocal = frf;
      saveLanguage(frf);
    } else if (typeLang == ara) {
      langLocal = ara;
      saveLanguage(ara);
    } else {
      langLocal = ene;
      saveLanguage(ene);
    }
    update();
  }

  // void changesss(String code) {
  //   Get.updateLocale(Locale(code));
  // }
  // Locale? mainLocal;
  // void changeLanguage(Locale locale) {
  //   if (!L10n.all.contains(locale)) {
  //     return;
  //   }

  //   mainLocal = locale;

  //   update();
  // }

  // void clearLocale() {
  //   mainLocal = null;
  //   update();
  // }
}
