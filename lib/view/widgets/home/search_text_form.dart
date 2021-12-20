import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:udemy_shop_app/logic/controllers/product_controller.dart';

class SearchFormText extends StatefulWidget {
  SearchFormText({Key? key}) : super(key: key);

  @override
  State<SearchFormText> createState() => _SearchFormTextState();
}

class _SearchFormTextState extends State<SearchFormText> {
  final controller = Get.find<ProductController>();

  final FocusNode textFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductController>(
      builder: (_) {
        return TextField(
          style: const TextStyle(color: Colors.black, fontSize: 16),
          controller: controller.searchcontroller,
          cursorColor: Colors.black,
          focusNode: textFocusNode,
          minLines: 1,
          keyboardType: TextInputType.text,
          onChanged: (value) {
            controller.addSearchToList(value);
          },
          decoration: InputDecoration(
            border: InputBorder.none,
            fillColor: Colors.white,
            focusColor: Colors.red,
            suffixIcon: controller.searchcontroller.text.isNotEmpty
                ? IconButton(
                    onPressed: () {
                      controller.clearSearch();
                    },
                    icon: const Icon(
                      Icons.close,
                      color: Colors.black,
                    ),
                  )
                : null,
            prefixIcon: const Icon(
              Icons.search,
              color: Colors.grey,
            ),
            hintText: "Search with name & price",
            hintStyle: const TextStyle(
              color: Colors.black45,
              fontSize: 16,
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
        );
      },
    );
  }
}
