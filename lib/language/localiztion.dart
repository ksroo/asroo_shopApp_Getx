import 'package:get/get.dart';
import 'package:udemy_shop_app/language/ar.dart';
import 'package:udemy_shop_app/language/en.dart';
import 'package:udemy_shop_app/language/fr.dart';
import 'package:udemy_shop_app/utils/my_string.dart';

class Localization extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        english: en,
        arabic: ar,
        france: fr,
      }; 
}
