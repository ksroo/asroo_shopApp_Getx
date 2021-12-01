import '../../../logic/controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RememberCheck extends StatelessWidget {
  RememberCheck({Key? key}) : super(key: key);

  final controller = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
        builder: (_) => Row(
              children: [
                InkWell(
                  onTap: () {
                    controller.checkBoxRemember();
                  },
                  child: Container(
                    height: 35,
                    width: 35,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: controller.isCheckRemember
                        ? Image.asset('assets/images/check.png')
                        : Container(),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                const Text(
                  "Remember me",
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ],
            ));
  }
}
