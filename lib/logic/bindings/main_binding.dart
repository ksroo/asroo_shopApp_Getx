import 'package:get/instance_manager.dart';
import 'package:udemy_shop_app/logic/controllers/main_controller.dart';

class MainBininding extends Bindings {
  @override
  void dependencies() {
    Get.put(MainController());
  }
}
