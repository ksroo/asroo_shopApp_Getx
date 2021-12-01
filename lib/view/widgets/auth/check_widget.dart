import '../../../logic/controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckWidget extends StatelessWidget {
  CheckWidget({Key? key}) : super(key: key);

  final controller = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
        builder: (_) => Row(
              children: [
                InkWell(
                  onTap: () {
                    controller.checkBox();
                  },
                  child: Container(
                    height: 35,
                    width: 35,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: controller.isCheck
                        ? Image.asset('assets/images/check.png')
                        : Container(),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Row(
                  children: const [
                    Text(
                      "I accept ",
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      "terms & conditions",
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ],
            ));
  }
}
