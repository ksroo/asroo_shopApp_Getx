import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:udemy_shop_app/utils/my_string.dart';

class SettingController extends GetxController {
  var swithchValue = false.obs;
  var storage = GetStorage();
  var langLocal = english;

  String capitalize(String profileName) {
    return profileName.split(" ").map((str) => str.capitalize).join(" ");
  }
  //Language Logic

  @override
  void onInit() async {
    super.onInit();
    langLocal = await getLanguage;
    Get.updateLocale(Locale(langLocal));
    update();
  }

  void saveLanguage(String lang) async {
    await storage.write("lanr", lang);
  }

  Future<String> get getLanguage async {
    return await storage.read("lanr");
  }

  void changeLanguage(String typeLang) async {
    saveLanguage(typeLang);
    if (langLocal == typeLang) {
      return;
    }
    if (typeLang == france) {
      langLocal = france;
      saveLanguage(france);
    } else if (typeLang == arabic) {
      langLocal = arabic;
      saveLanguage(arabic);
    } else {
      langLocal = english;
      saveLanguage(english);
    }
    update();
  }
}
