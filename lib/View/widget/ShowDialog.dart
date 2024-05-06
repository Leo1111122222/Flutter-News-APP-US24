import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoadingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        color: Colors.white,
      ),
    );
  }
}

void showLoadingDialog() {
  Get.dialog(
    LoadingScreen(),
  );
}

void hideLoadingDialog() {
  Get.back();
}
