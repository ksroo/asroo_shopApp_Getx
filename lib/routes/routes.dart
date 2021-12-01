import 'package:asroo_shop/logic/controller/auth_controller.dart';
import 'package:asroo_shop/view/screens/details/product_details_screen.dart';
import 'package:asroo_shop/view/screens/root.dart';

import '../logic/bindings/main_binding.dart';
import '../logic/bindings/nav_binding.dart';
import '../logic/bindings/product_binding.dart';
import '../view/screens/auth/forgot_password_screen.dart';
import '../view/screens/auth/login_screen.dart';
import '../view/screens/auth/signup_screen.dart';
import '../view/screens/home/home_screen.dart';
import '../view/screens/nav_screen.dart';
import '../view/screens/welcome_screen.dart';
import 'package:get/route_manager.dart';

class AppRoutes {
  static const mainScreen = Routes.welcomeScreen;

  static final routes = [
    // GetPage(
    //   name: Routes.root,
    //   page: () => Root(),
    //   binding: AuthBindings(),
    // ),
    GetPage(
      name: Routes.welcomeScreen,
      page: () => const WelocmeScreen(),
    ),
    GetPage(
        name: Routes.signUpScreen,
        page: () => SignUpScreen(),
        binding: AuthBindings()),
    GetPage(
      name: Routes.navScreen,
      page: () => NavScreen(),
      bindings: [
        NavBinding(),
        ProductBinding(),
      ],
    ),
    GetPage(
      name: Routes.loginScreen,
      page: () => LoginScreen(),
      binding: AuthBindings(),
    ),
    GetPage(
      name: Routes.forgotPasswordScreen,
      page: () => ForgotPasswordScreen(),
      binding: AuthBindings(),
    ),
    // GetPage(
    //   name: Routes.homeScreen,
    //   page: () => HomeScreen(),
    //   binding: AuthBindings(),
    // ),
    // GetPage(
    //   name: Routes.productDetailsScreen,
    //   page: () =>  ProductDetailsScreen(),
    // ),
  ];
}

class Routes {
  static const root = '/root';
  static const welcomeScreen = '/welcomeScreen';
  static const signUpScreen = '/signUpScreen';
  static const navScreen = '/navScreen';
  static const loginScreen = '/loginScreen';
  static const forgotPasswordScreen = '/forgotPasswordScreen';
  static const productDetailsScreen = '/productDetailsScreen';
  // static const homeScreen = '/homeScreen';
}
