import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:udemy_shop_app/logic/controllers/auth_controller.dart';
import 'package:udemy_shop_app/logic/controllers/payment_controller.dart';
import 'package:udemy_shop_app/logic/controllers/setting_controller.dart';
import 'package:udemy_shop_app/routes/routes.dart';
import 'package:udemy_shop_app/utils/theme.dart';

import '../text_utils.dart';

class DeliveryContainer extends StatefulWidget {
  const DeliveryContainer({
    Key? key,
  }) : super(key: key);

  @override
  State<DeliveryContainer> createState() => _DeliveryContainerState();
}

class _DeliveryContainerState extends State<DeliveryContainer> {
  final TextEditingController phoneController = TextEditingController();
  int radioContinerIndex = 1;
  bool changeColor = false;
  final controller = Get.find<AuthController>();
  final payMentController = Get.find<PayMentController>();
  @override
  void dispose() {
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildRadioContiner(
            address: "Egypt,sohag medanelshoban el moslmean",
            name: "asroo shop",
            phone: "51-887-9932",
            title: "Asroo Shop",
            value: 1,
            color: changeColor ? Colors.white : Colors.grey.shade300,
            icon: Container(),
            onChanged: (int? value) {
              setState(() {
                radioContinerIndex = value!;
                changeColor = !changeColor;
              });
            }),
        const SizedBox(
          height: 10,
        ),
        Obx(
          () {
            return buildRadioContiner(
              address: payMentController.address.value,
              // address: payMentController.isLocation.value
              //     ? "Your Address"
              //     : payMentController.address.value,
              name: controller.displayUserName.value,
              // phone: "93-123-7651",
              phone: payMentController.phoneNumber.value,
              title: "Delivery",
              value: 2,
              color: changeColor ? Colors.grey.shade300 : Colors.white,
              icon: InkWell(
                onTap: () {
                  Get.defaultDialog(
                    title: "Enter Your Phone Number",
                    titleStyle: const TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    backgroundColor: Colors.white,
                    radius: 10,
                    textCancel: " Cancel ",
                    cancelTextColor: Colors.black,
                    textConfirm: " Save ",
                    confirmTextColor: Colors.black,
                    onCancel: () {
                      Get.toNamed(Routes.payMentScreen);
                    },
                    onConfirm: () {
                      Get.back();
                      payMentController.phoneNumber.value =
                          phoneController.text;
                    },
                    buttonColor: Get.isDarkMode ? pinkClr : mainColor,
                    content: Padding(
                      padding: const EdgeInsets.all(15),
                      child: TextField(
                        controller: phoneController,
                        maxLength: 11,
                        cursorColor: Colors.black,
                        keyboardType: TextInputType.phone,
                        onChanged: (searchName) {},
                        onSubmitted: (value) {
                          phoneController.text = value;
                        },
                        decoration: InputDecoration(
                          fillColor: Get.isDarkMode
                              ? pinkClr.withOpacity(0.1)
                              : mainColor.withOpacity(0.2),
                          focusColor: Colors.red,
                          prefixIcon: Icon(
                            Icons.phone,
                            color: Get.isDarkMode ? pinkClr : mainColor,
                          ),
                          suffixIcon: IconButton(
                            onPressed: () {
                              phoneController.clear();
                            },
                            icon: const Icon(
                              Icons.close,
                              color: Colors.black,
                            ),
                          ),
                          hintText: "Enter Your Phone Number",
                          hintStyle: const TextStyle(
                            color: Colors.black54,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                          filled: true,
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                  );
                },
                child: Icon(
                  Icons.contact_phone,
                  color: Get.isDarkMode ? pinkClr : mainColor,
                  size: 20,
                ),
              ),
              onChanged: (int? value) {
                setState(() {
                  radioContinerIndex = value!;
                  changeColor = !changeColor;
                });
                payMentController.updatePosition();
              },
            );
          },
        ),
      ],
    );
  }

  Widget buildRadioContiner({
    required String name,
    required String address,
    required String title,
    required String phone,
    required int value,
    required Function onChanged,
    required Color color,
    required Widget icon,
  }) {
    return Container(
      height: 120,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: color,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 3.0,
            blurRadius: 5.0,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Radio(
            value: value,
            groupValue: radioContinerIndex,
            fillColor: MaterialStateColor.resolveWith((states) => Colors.red),
            onChanged: (int? value) {
              onChanged(value);
            },
          ),
          const SizedBox(
            width: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextUtils(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  text: title,
                  color: Colors.black,
                  underLine: TextDecoration.none,
                ),
                const SizedBox(
                  height: 5,
                ),
                TextUtils(
                  fontSize: 15,
                  fontWeight: FontWeight.normal,
                  text: name,
                  color: Colors.black,
                  underLine: TextDecoration.none,
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    const Text('🇪🇬 +02 '),
                    TextUtils(
                      fontSize: 15,
                      fontWeight: FontWeight.normal,
                      text: phone,
                      color: Colors.black,
                      underLine: TextDecoration.none,
                    ),
                    const SizedBox(
                      width: 120,
                    ),
                    SizedBox(
                      child: icon,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                TextUtils(
                  fontSize: 15,
                  fontWeight: FontWeight.normal,
                  text: address,
                  color: Colors.black,
                  underLine: TextDecoration.none,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
