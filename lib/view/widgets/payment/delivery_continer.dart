import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:udemy_shop_app/logic/controllers/payment_controller.dart';

import '../text_utils.dart';

class DeliveryContainer extends StatefulWidget {
  const DeliveryContainer({
    Key? key,
  }) : super(key: key);

  @override
  State<DeliveryContainer> createState() => _DeliveryContainerState();
}

class _DeliveryContainerState extends State<DeliveryContainer> {
  int radioContinerIndex = 1;
  bool changeColor = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildRadioContiner(
            address: "Egypt,sohag medanelshoban el moslmean",
            name: "asroo store",
            phone: "51-887-9932",
            title: "Asroo Shop",
            value: 1,
            color: changeColor ? Colors.white : Colors.grey.shade300,
            onChanged: (int? value) {
              setState(() {
                radioContinerIndex = value!;
                changeColor = !changeColor;
              });
              debugPrint("prin1");
            }),
        const SizedBox(
          height: 10,
        ),
        buildRadioContiner(
            address: "Egypt,sohag medanelshoban el moslmean",
            name: "walid mahmoud",
            phone: "93-123-7651",
            title: "Delivery",
            value: 2,
            color: changeColor ? Colors.grey.shade300 : Colors.white,
            onChanged: (int? value) {
              setState(() {
                radioContinerIndex = value!;
                changeColor = !changeColor;
              });
              debugPrint("prin2");
            }),
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
                TextUtils(
                  fontSize: 15,
                  fontWeight: FontWeight.normal,
                  text: phone,
                  color: Colors.black,
                  underLine: TextDecoration.none,
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
