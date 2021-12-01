import '../controller/nav_controller.dart';
import 'package:get/get.dart';
import 'package:get/get_instance/get_instance.dart';

class NavBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(NavController());

  }
}
