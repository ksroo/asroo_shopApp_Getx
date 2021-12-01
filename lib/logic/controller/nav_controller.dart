import '../../view/screens/category/category_screen.dart';
import '../../view/screens/favorite/favorite_screen.dart';
import '../../view/screens/home/home_screen.dart';
import '../../view/screens/settings/settings_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavController extends GetxController {
  RxInt currentIndex = 0.obs;

  final tabs = [
    HomeScreen(),
    const CategoryScreen(),
     FavoriteScreen(),
    const SettingesScreen(),
  ].obs;

  final title = [
    "Asroo Shop",
    "Categories",
    "Favourites",
    "Settings",
  ].obs;
}
