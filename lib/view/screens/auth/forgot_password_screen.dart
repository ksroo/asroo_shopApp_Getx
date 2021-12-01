import '../../../logic/controller/auth_controller.dart';
import '../../../main.dart';
import '../../../utils/my_color.dart';
import '../../widgets/auth/auth_button.dart';
import '../../widgets/auth/auth_text_from_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotPasswordScreen extends StatelessWidget {
  ForgotPasswordScreen({Key? key}) : super(key: key);
  final formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  final authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Forgot Password",
          style: TextStyle(
            color: MyColor.mainColor,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerRight,
                    child: IconButton(
                      icon: const Icon(
                        Icons.close_rounded,
                        color: Colors.white,
                      ),
                      onPressed: () => Get.back(),
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  const Text(
                    'If you want to recover your account, then please provide your email ID below..',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 50),
                  Image.asset(
                    "assets/images/forgetpass copy.png",
                    width: 350.0,
                  ),
                  const SizedBox(height: 50),
                  AuthTextFromField(
                    text: "Email",
                    icon: Image.asset(
                      "assets/images/email.png",
                    ),
                    controller: emailController,
                    validator: (value) {
                      bool _isEmailValid =
                          RegExp(regExpression).hasMatch(value!);
                      if (!_isEmailValid) {
                        return 'Invalid email.';
                      }
                      return null;
                    },
                    obscureText: false,
                    suffixIcon: const Text(""),
                  ),
                  const SizedBox(height: 50),
                  GetBuilder<AuthController>(
                    builder: (_) {
                      return AuthButton(
                        text: "SEND",
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            authController
                                .resetPassword(emailController.text.trim());
                          }
                        },
                      );
                    },
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
