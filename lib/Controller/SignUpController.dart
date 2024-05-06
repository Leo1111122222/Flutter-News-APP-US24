import 'package:US24/View/screens/Verify.dart';
import 'package:US24/View/widget/ShowDialog.dart';
import 'package:US24/View/widget/ShowErrorSnackbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpController {
  ShowErrorSnackbar S = new ShowErrorSnackbar();
  void signUserUp(Email, Password, ConfirmPassword) async {
    Get.dialog(
      LoadingScreen(),
      barrierDismissible: false,
    );

    try {
      if (Password.text == ConfirmPassword.text && Password.text != '') {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: Email.text, password: Password.text);
        Get.offAll(Verify());
      } else {
        Get.back();
        S.ErrorSnackbar('Passwords don\'t match.', Colors.red);
      }
    } on FirebaseAuthException catch (e) {
      Get.back();
      if (e.code.toString() == 'invalid-email') {
        S.ErrorSnackbar('Enter correct email.', Colors.red);
      } else if (e.code.toString() == 'missing-password') {
        S.ErrorSnackbar('Enter your password.', Colors.red);
      } else if (e.code.toString() == 'email-already-in-use') {
        S.ErrorSnackbar('Your email is already used.', Colors.red);
      }
    }
  }
}
