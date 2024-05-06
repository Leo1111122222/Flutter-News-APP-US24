import 'package:US24/View/widget/ShowErrorSnackbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:US24/View/screens/Verify.dart';
import 'package:US24/View/widget/ShowDialog.dart';

class SignInController {
  ShowErrorSnackbar S = new ShowErrorSnackbar();
  void signUserIn(Email, Password) async {
    Get.dialog(
      LoadingScreen(),
      barrierDismissible: false,
    );

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: Email.text, password: Password.text);
      Get.offAll(Verify());
    } on FirebaseAuthException catch (e) {
      Get.back();
      if (e.code.toString() == 'invalid-email') {
        S.ErrorSnackbar('This email is incorrect.', Colors.red);
      } else if (e.code.toString() == 'invalid-credential') {
        S.ErrorSnackbar('The password is incorrect.', Colors.red);
      }
    }
  }
}
