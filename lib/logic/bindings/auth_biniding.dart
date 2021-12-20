import 'package:get/instance_manager.dart';
import 'package:udemy_shop_app/logic/controllers/setting_controller.dart';
import '../controllers/auth_controller.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(AuthController());
    Get.put(SettingController());
  }
}
