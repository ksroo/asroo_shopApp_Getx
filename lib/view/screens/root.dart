// import 'package:asroo_shop/logic/controller/auth_controller.dart';
// import 'package:asroo_shop/view/screens/home/home_screen.dart';
// import 'package:asroo_shop/view/screens/nav_screen.dart';
// import 'package:asroo_shop/view/screens/welcome_screen.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get_state_manager/get_state_manager.dart';

// class Root extends StatelessWidget {
//   const Root({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: GetBuilder<AuthController>(
//         builder: (controller) {
//           return SafeArea(
//             child:
//                 FirebaseAuth.instance.currentUser != null ||
//                         controller.isSignedIn == true
//                     ? WelocmeScreen()
//                     : NavScreen(),
//           );
//         },
//       ),
//     );
//   }
// }
