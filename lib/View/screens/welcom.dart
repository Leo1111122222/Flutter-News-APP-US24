import 'package:US24/Controller/Auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WelcomeController extends GetxController {
  final _isAnimated = false.obs;

  bool get isAnimated => _isAnimated.value;

  @override
  void onInit() {
    super.onInit();
    Future.delayed(Duration(milliseconds: 700), () {
      _isAnimated.value = true;
    });
    Future.delayed(Duration(milliseconds: 2000), () {
      Get.off(Auth());
    });
  }
}

class Welcome extends StatelessWidget {
  final WelcomeController welcomeController = Get.put(WelcomeController());

  @override
  Widget build(BuildContext context) {
    final double _height = MediaQuery.of(context).size.height;
    final double _width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Obx(() => AnimatedContainer(
              duration: Duration(milliseconds: 2000),
              curve: Curves.fastLinearToSlowEaseIn,
              width: welcomeController.isAnimated ? _width : 0,
              height: _height,
              color: Color.fromARGB(255, 143, 7, 255))),
          Center(
            child: Text(
              'US 24',
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 30,
                  color: Colors.white,
                  fontStyle: FontStyle.italic),
            ),
          ),
        ],
      ),
    );
  }
}
