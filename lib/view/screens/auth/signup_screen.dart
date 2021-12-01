import '../../../logic/controller/auth_controller.dart';
import '../../../main.dart';
import '../../../routes/routes.dart';
import '../../../utils/my_color.dart';
import '../home/home_screen.dart';
import '../../widgets/auth/auth_button.dart';
import '../../widgets/auth/auth_text_from_field.dart';
import '../../widgets/auth/check_widget.dart';
import '../../widgets/container_under.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatelessWidget {
  final formKey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  final authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height / 1.3,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.only(left: 25, right: 25, top: 40),
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      Row(
                        children: const [
                          Text(
                            "SIGN",
                            style: TextStyle(
                              color: MyColor.mainColor,
                              fontSize: 28,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(
                            width: 3,
                          ),
                          Text(
                            "UP",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 28,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      AuthTextFromField(
                        text: "User Name",
                        icon: Image.asset(
                          "assets/images/user.png",
                        ),
                        controller: nameController,
                        validator: (value) {
                          if (value.toString().length <= 2) {
                            return 'Enter valid name';
                          }
                          return null;
                        },
                        obscureText: false,
                        suffixIcon: const Text(""),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
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
                            return 'Invalid email';
                          }
                          return null;
                        },
                        obscureText: false,
                        suffixIcon: const Text(""),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      GetBuilder<AuthController>(
                        builder: (_) {
                          return AuthTextFromField(
                            text: "Password",
                            icon: Image.asset(
                              "assets/images/lock.png",
                            ),
                            controller: passwordController,
                            validator: (value) {
                              if (value.toString().length < 6) {
                                return 'Password should be longer or equal to 6 characters';
                              }
                              return null;
                            },
                            obscureText:
                                authController.isVisibility ? false : true,
                            suffixIcon: IconButton(
                              onPressed: () {
                                authController.visibility();
                              },
                              icon: authController.isVisibility
                                  ? const Icon(
                                      Icons.visibility,
                                      color: Colors.black,
                                    )
                                  : const Icon(
                                      Icons.visibility_off,
                                      color: Colors.black,
                                    ),
                            ),
                          );
                        },
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      CheckWidget(),
                      const SizedBox(
                        height: 50,
                      ),
                      GetBuilder<AuthController>(
                        builder: (_) {
                          return AuthButton(
                            text: "SIGN UP",
                            onPressed: () {
                              if (authController.isCheck == false) {
                                Get.snackbar("Check Box",
                                    "Please, Accept terms & conditions",
                                    snackPosition: SnackPosition.BOTTOM,
                                    backgroundColor: Colors.green,
                                    colorText: Colors.white);
                              } else if (formKey.currentState!.validate()) {
                                String name = nameController.text.trim();
                                String email = emailController.text.trim();
                                String password = passwordController.text;
                                authController.signUpUsingFirebaseAuth(
                                    name, email, password);

                                authController.isCheck = true;
                              }
                            },
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
            ContainerUnder(
              text: "Already have an Account? ",
              textTypt: "Log in",
              onPressed: () {
                Get.toNamed(Routes.loginScreen);
              },
            ),
          ],
        ),
      ),
    );
  }
}
