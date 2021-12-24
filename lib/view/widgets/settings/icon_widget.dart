import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../utils/theme.dart';
import '../text_utils.dart';

class IconWidget extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String text;
  final Function onTap;
  const IconWidget({
    required this.icon,
    required this.color,
    required this.text,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          onTap();
        },
        splashColor: color.withOpacity(0.4),
        borderRadius: BorderRadius.circular(12),
        customBorder: const StadiumBorder(),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: color,
              ),
              child: Icon(
                icon,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            TextUtils(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              text: text,
              color: Get.isDarkMode ? Colors.white : Colors.black,
              underLine: TextDecoration.none,
            ),
          ],
        ),
      ),
    );
  }
}
