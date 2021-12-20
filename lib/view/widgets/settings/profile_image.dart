import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:udemy_shop_app/logic/controllers/auth_controller.dart';
import 'package:udemy_shop_app/view/widgets/text_utils.dart';

class ProfileImage extends StatelessWidget {
  ProfileImage({Key? key}) : super(key: key);

  final controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Row(
          children: [
            // CircleAvatar(
            //   backgroundImage: NetworkImage(controller.displayUserPhoto),
            //   radius: 40,
            // ),
            const SizedBox(
              width: 10,
            ),
            TextUtils(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              text: controller.displayUserName,
              color: Colors.black,
              underLine: TextDecoration.none,
            ),
          ],
        ),
      ],
    );
  }
}
