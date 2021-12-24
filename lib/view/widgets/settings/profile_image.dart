import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:udemy_shop_app/logic/controllers/setting_controller.dart';
import '../../../logic/controllers/auth_controller.dart';
import '../text_utils.dart';

class ProfileImage extends StatelessWidget {
  ProfileImage({Key? key}) : super(key: key);

  final controller = Get.find<AuthController>();
  final settingController = Get.find<SettingController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Obx(
          () => Row(
            children: [
              Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: NetworkImage(controller.displayUserPhoto.value),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              // controller.displayUserPhoto.value == ''
              //     ? controller.imagePath.value == 'null'
              //         ? Container(
              //             height: 100,
              //             width: 100,
              //             decoration: const BoxDecoration(
              //               color: Colors.black,
              //               shape: BoxShape.circle,
              //               image: DecorationImage(
              //                 image:
              //                     AssetImage("assets/images/empty_proile.png"),
              //                 fit: BoxFit.cover,
              //               ),
              //             ),
              //           )
              //         : Container(
              //             height: 100,
              //             width: 100,
              //             decoration: BoxDecoration(
              //               color: Colors.black,
              //               shape: BoxShape.circle,
              //               image: DecorationImage(
              //                 image: FileImage(
              //                   File(controller.imagePath.value),
              //                 ),
              //                 fit: BoxFit.cover,
              //               ),
              //             ),
              //           )
              //     :
              const SizedBox(
                width: 15,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextUtils(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    text: settingController
                        .capitalize(controller.displayUserName.value),
                    color: Get.isDarkMode ? Colors.white : Colors.black,
                    underLine: TextDecoration.none,
                  ),
                  TextUtils(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    text: controller.displayEmail.value,
                    color: Get.isDarkMode ? Colors.white : Colors.black,
                    underLine: TextDecoration.none,
                  ),
                ],
              ),
            ],
          ),
        ),
        // Row(
        //   children: [
        //     IconButton(
        //       onPressed: () {
        //         controller.getImage(ImageSource.camera);
        //       },
        //       icon: Icon(
        //         Icons.camera_alt_outlined,
        //         color: Get.isDarkMode ? Colors.white : Colors.black,
        //       ),
        //     ),
        //     IconButton(
        //       onPressed: () {
        //         controller.getImage(ImageSource.gallery);
        //       },
        //       icon: Icon(
        //         Icons.image_outlined,
        //         color: Get.isDarkMode ? Colors.white : Colors.black,
        //       ),
        //     ),
        //   ],
        // ),
      ],
    );
  }
}
