import '../../routes/routes.dart';
import '../../view/screens/home/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:google_sign_in/google_sign_in.dart';

class AuthController extends GetxController {
  var displayUserName = '';
  var displayPhoto = '';
  FirebaseAuth auth = FirebaseAuth.instance;
  var _googleSignIn = GoogleSignIn();
  var googleAccount = Rx<GoogleSignInAccount?>(null);

  var isSignedIn = false.obs;

  User? get userProfile => auth.currentUser;

  @override
  void onInit() {
    super.onInit();
    displayUserName = userProfile != null ? userProfile!.displayName! : "";
  }

  bool isCheck = false;
  bool isCheckRemember = false;

  bool isVisibility = false;

  void visibility() {
    isVisibility = !isVisibility;
    update();
  }

  void checkBoxRemember() {
    isCheckRemember = !isCheckRemember;
    update();
  }

  void checkBox() {
    isCheck = !isCheck;
    update();
  }

  void signUpUsingFirebaseAuth(
      String name, String email, String password) async {
    try {
      await auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) {
        displayUserName = name;
        auth.currentUser!.updateDisplayName(name);
      });

      isSignedIn = true.obs;

      update();

      Get.offNamed(Routes.navScreen);
      Get.offNamed(Routes.root);
    } on FirebaseAuthException catch (error) {
      String title = error.code.replaceAll(RegExp('-'), ' ').capitalize!;
      String message = '';

      if (error.code == 'weak-password') {
        message = ' Provided Password is too weak.. ';
      } else if (error.code == 'email-already-in-use') {
        message = ' Account Already exists for that email.. ';
      } else {
        message = error.message.toString();
      }

      Get.snackbar(title, message,
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white);
    } catch (error) {
      Get.snackbar('Error!', error.toString(),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white);
    }
  }

  void signInUsingFirebaseAuth(String email, String password) async {
    try {
      await auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) => displayUserName = userProfile!.displayName!);

      isSignedIn = true.obs;

      update();
      Get.offNamed(Routes.navScreen);
      // Get.offNamed(Routes.root);
    } on FirebaseAuthException catch (error) {
      String title = error.code.replaceAll(RegExp('-'), ' ').capitalize!;

      String message = '';
      if (error.code == 'wrong-password') {
        message = ' Invalid Password... PLease try again! ';
      } else if (error.code == 'user-not-found') {
        message =
            ' Account does not exists for that $email.. Create your account by signing up..';
      } else {
        message = error.message.toString();
      }

      Get.snackbar(title, message,
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white);
    } catch (error) {
      Get.snackbar('Error!', error.toString(),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white);
    }
  }

  void signInUserWithGoogle() async {
    try {
      googleAccount.value = await _googleSignIn.signIn();
      displayUserName = googleAccount.value!.displayName!;
      displayPhoto = googleAccount.value!.photoUrl!;
      isSignedIn = true.obs;

      update();
      Get.offNamed(Routes.navScreen);
    } catch (error) {
      Get.snackbar('Error!', error.toString(),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white);
    }
  }

  // void signInUserWithFacebook() async {
  //   try {
  //     facebookAccount.value = await FacebookAuth.instance.login();
  //   } catch (error) {
  //     Get.snackbar('Error!', error.toString(),
  //         snackPosition: SnackPosition.BOTTOM,
  //         backgroundColor: Colors.green,
  //         colorText: Colors.white);
  //   }
  // }

  void resetPassword(String email) async {
    try {
      await auth.sendPasswordResetEmail(email: email);
      Get.back();
    } on FirebaseAuthException catch (error) {
      String title = error.code.replaceAll(RegExp('-'), ' ').capitalize!;
      String message = '';

      if (error.code == 'user-not-found') {
        message =
            ' Account does not exists for that $email.. Create your account by signing up...';
      } else {
        message = error.message.toString();
      }

      Get.snackbar(title, message,
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white);
    } catch (error) {
      Get.snackbar('Error!', error.toString(),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white);
    }
  }

  void signOutFromApp() async {
    try {
      isSignedIn(false);
      await auth.signOut();
      await _googleSignIn.signOut();
      displayUserName = '';
      displayPhoto = '';

      update();
      Get.offNamed(Routes.welcomeScreen);
    } catch (error) {
      isSignedIn(true);
      Get.snackbar('Error!', error.toString(),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white);
    }
  }
}

extension StringExtension on String {
  String capitalizeString() {
    return "${this[0].toUpperCase()}${this.substring(1)}";
  }
}
