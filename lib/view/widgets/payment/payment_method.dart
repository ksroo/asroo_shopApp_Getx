import 'package:flutter/material.dart';
import 'package:udemy_shop_app/utils/theme.dart';
import 'package:udemy_shop_app/view/widgets/text_utils.dart';

class PayMentMethod extends StatefulWidget {
  const PayMentMethod({Key? key}) : super(key: key);

  @override
  _PayMentMethodState createState() => _PayMentMethodState();
}

class _PayMentMethodState extends State<PayMentMethod> {
  int radioPayMentIndex = 1;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15),
      child: Column(
        children: [
          buildRadioPayment(
            name: "Paypal",
            imgae: 'assets/images/paypal.png',
            scale: 0.7,
            value: 1,
            onChanged: (int? value) {
              setState(() {
                radioPayMentIndex = value!;
              });
              debugPrint("print1");
            },
          ),
          const SizedBox(
            height: 15,
          ),
          buildRadioPayment(
            name: "Google Pay",
            imgae: "assets/images/google.png",
            scale: 0.8,
            value: 2,
            onChanged: (int? value) {
              setState(() {
                radioPayMentIndex = value!;
              });
              debugPrint("print2");
            },
          ),
          const SizedBox(
            height: 15,
          ),
          buildRadioPayment(
            name: "Credit Card",
            imgae: "assets/images/credit.png",
            scale: 0.7,
            value: 3,
            onChanged: (int? value) {
              setState(() {
                radioPayMentIndex = value!;
              });
              debugPrint("print3");
            },
          ),
        ],
      ),
    );
  }

  Widget buildRadioPayment({
    required String name,
    required String imgae,
    required double scale,
    required int value,
    required Function onChanged,
  }) {
    return Container(
      height: 50,
      width: double.infinity,
      color: Colors.grey[300],
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                imgae,
                scale: scale,
              ),
              const SizedBox(
                width: 10,
              ),
              TextUtils(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                text: name,
                color: Colors.black,
                underLine: TextDecoration.none,
              ),
            ],
          ),
          Radio(
            value: value,
            groupValue: radioPayMentIndex,
            fillColor: MaterialStateColor.resolveWith((states) => mainColor),
            onChanged: (int? value) {
              onChanged(value);
            },
          ),
        ],
      ),
    );
  }
}
