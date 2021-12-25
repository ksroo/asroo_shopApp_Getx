import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'ar.dart';
import 'en.dart';
import 'fr.dart';
import '../utils/my_string.dart';

class LocalizationApp extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        ene: en,
        ara: ar,
        frf: fr,
      };
}
