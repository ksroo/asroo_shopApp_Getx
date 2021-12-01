import '../../utils/my_color.dart';
import 'package:flutter/material.dart';

class ContainerUnder extends StatelessWidget {
  final String text;
  final String textTypt;
  final Function onPressed;

  const ContainerUnder(
      {required this.text,
      required this.onPressed,
      required this.textTypt,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100,
      decoration: const BoxDecoration(
        color: MyColor.mainColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextButton(
            onPressed: () {
              onPressed();
            },
            child: Text(
              textTypt,
              style: const TextStyle(
                color: Colors.white,
                decoration: TextDecoration.underline,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        ],
      ),
    );
  }
}
