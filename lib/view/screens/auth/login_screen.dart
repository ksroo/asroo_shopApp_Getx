import '../../../logic/controller/auth_controller.dart';
import '../../../main.dart';
import '../../../routes/routes.dart';
import '../../../utils/my_color.dart';
import '../../widgets/auth/auth_button.dart';
import '../../widgets/auth/auth_text_from_field.dart';
import '../../widgets/auth/check_widget.dart';
import '../../widgets/auth/remember_check.dart';
import '../../widgets/container_under.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  final formKey = GlobalKey<FormState>();

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
                            "LOG",
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
                            "IN",
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
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {
                            Get.toNamed(Routes.forgotPasswordScreen);
                          },
                          child: const Text(
                            "Forgot Password?",
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      RememberCheck(),
                      const SizedBox(
                        height: 30,
                      ),
                      GetBuilder<AuthController>(
                        builder: (_) {
                          return AuthButton(
                            text: "LOG IN",
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                String email = emailController.text.trim();
                                String password = passwordController.text;
                                authController.signInUsingFirebaseAuth(
                                    email, password);
                              }
                            },
                          );
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        "OR",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () {},
                            child: CircleAvatar(
                              backgroundColor: Colors.white,
                              child: Image.asset("assets/images/facebook.png"),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          InkWell(
                            onTap: () {
                              authController.signInUserWithGoogle();
                            },
                            child: CircleAvatar(
                              backgroundColor: Colors.white,
                              child: Image.asset("assets/images/google.png"),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            ContainerUnder(
              text: "Don't have an Account? ",
              textTypt: "Sign up",
              onPressed: () {
                Get.toNamed(Routes.signUpScreen);
              },
            ),
          ],
        ),
      ),
    );
  }
}
