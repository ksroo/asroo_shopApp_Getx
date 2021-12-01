import 'package:flutter/material.dart';

class AuthTextFromField extends StatelessWidget {
  final String text;
  final Widget icon;
  final TextEditingController controller;
  final Function validator;
  final bool obscureText;
  final Widget suffixIcon;

  const AuthTextFromField({
    required this.text,
    required this.icon,
    required this.controller,
    required this.validator,
    required this.obscureText,
    required this.suffixIcon,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,

      decoration: InputDecoration(
        fillColor: Colors.grey.shade200,
        focusColor: Colors.red,
        prefixIcon: icon,
        suffixIcon: suffixIcon,
        disabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(10),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(10),
        ),
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(10),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(10),
        ),
        hintText: text,
        hintStyle: const TextStyle(
          color: Colors.black45,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
        filled: true,
      ),
      cursorColor: Colors.black,
      keyboardType: TextInputType.text,
      //autofillHints: autofillHints,
      validator: (value) => validator(value),
    );
  }
}
