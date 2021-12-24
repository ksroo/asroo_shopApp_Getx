import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:udemy_shop_app/logic/controllers/setting_controller.dart';
import '../../../logic/controllers/auth_controller.dart';
import '../text_utils.dart';

class TextImage extends StatelessWidget {
  TextImage({Key? key}) : super(key: key);

  final controller = Get.find<AuthController>();
  final settingController = Get.find<SettingController>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: Row(
        children: [
          Obx(
            () => controller.imagePath.value == 'null'
                ? Container(
                    height: 100,
                    width: 100,
                    decoration: const BoxDecoration(
                      color: Colors.black,
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage("assets/images/empty_proile.png"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  )
                : Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: FileImage(
                          File(controller.imagePath.value),
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
          ),
          const SizedBox(
            height: 10,
          ),
          Obx(
            () => Text(
              controller.imagePath.value == ''
                  ? ''
                  : controller.imageSize.value,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
            onPressed: () {
              controller.getImage(ImageSource.gallery);
            },
            child: const Text('Gallery'),
          ),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
            onPressed: () {
              controller.getImage(ImageSource.camera);
            },
            child: const Text('Camera'),
          ),
        ],
      ),
    );
  }
}
