import 'package:US24/Controller/SignInController.dart';
import 'package:US24/Controller/SignUpInGoogle.dart';
import 'package:US24/View/screens/S_up.dart';
import 'package:US24/View/widget/CustomButton.dart';
import 'package:US24/View/widget/SquareTile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../widget/CustomTextField.dart';

class S_in extends StatefulWidget {
  @override
  _S_inState createState() => _S_inState();
}

class _S_inState extends State<S_in> with TickerProviderStateMixin {
  late AnimationController controller1;
  late AnimationController controller2;
  late Animation<double> animation1;
  late Animation<double> animation2;
  late Animation<double> animation3;
  late Animation<double> animation4;
  final Email = TextEditingController();
  final Password = TextEditingController();
  SignInController S = new SignInController();
  Future waitForS() async {
    await Future.delayed(Duration(seconds: 1));
    Get.off(S_Up());
  }

  Future x() async {
    controller1 = AnimationController(
      vsync: this,
      duration: Duration(seconds: 5),
    );
    animation1 = Tween<double>(begin: .1, end: .15).animate(
      CurvedAnimation(
        parent: controller1,
        curve: Curves.easeInOut,
      ),
    )
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          controller1.reverse();
        } else if (status == AnimationStatus.dismissed) {
          controller1.forward();
        }
      });
    animation2 = Tween<double>(begin: .02, end: .04).animate(
      CurvedAnimation(
        parent: controller1,
        curve: Curves.easeInOut,
      ),
    )..addListener(() {
        setState(() {});
      });

    controller2 = AnimationController(
      vsync: this,
      duration: Duration(seconds: 5),
    );
    animation3 = Tween<double>(begin: .41, end: .38).animate(CurvedAnimation(
      parent: controller2,
      curve: Curves.easeInOut,
    ))
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          controller2.reverse();
        } else if (status == AnimationStatus.dismissed) {
          controller2.forward();
        }
      });
    animation4 = Tween<double>(begin: 170, end: 190).animate(
      CurvedAnimation(
        parent: controller2,
        curve: Curves.easeInOut,
      ),
    )..addListener(() {
        setState(() {});
      });

    Timer(Duration(milliseconds: 2500), () {
      controller1.forward();
    });

    controller2.forward();
  }

  @override
  void initState() {
    super.initState();
    x();
  }

  @override
  void dispose() {
    controller1.dispose();
    controller2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 32, 25, 40),
      body: SingleChildScrollView(
        child: SizedBox(
          height: size.height,
          child: Stack(
            children: [
              Positioned(
                top: size.height * (animation2.value + .58),
                left: size.width * .21,
                child: CustomPaint(
                  painter: MyPainter(50),
                ),
              ),
              Positioned(
                top: size.height * .98,
                left: size.width * .1,
                child: CustomPaint(
                  painter: MyPainter(animation4.value - 30),
                ),
              ),
              Positioned(
                top: size.height * .5,
                left: size.width * (animation2.value + .8),
                child: CustomPaint(
                  painter: MyPainter(30),
                ),
              ),
              Positioned(
                top: size.height * animation3.value,
                left: size.width * (animation1.value + .1),
                child: CustomPaint(
                  painter: MyPainter(60),
                ),
              ),
              Positioned(
                top: size.height * .1,
                left: size.width * .8,
                child: CustomPaint(
                  painter: MyPainter(animation4.value),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'US 24',
                    style: TextStyle(
                      color: Colors.white.withOpacity(.7),
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1,
                      wordSpacing: 4,
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  CustomTextField(
                    icon: Icons.email_outlined,
                    hintText: 'Email...',
                    isPassword: false,
                    isEmail: true,
                    controller: Email,
                  ),
                  CustomTextField(
                    icon: Icons.lock_outline,
                    hintText: 'Password...',
                    isPassword: true,
                    isEmail: false,
                    controller: Password,
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomButton(
                        string: 'SIGN IN',
                        width: 150,
                        voidCallback: () {
                          S.signUserIn(Email, Password);
                        },
                      ),
                      SizedBox(width: 10),
                      CustomButton(
                        string: 'Forgotten password!',
                        width: 150,
                        voidCallback: () {
                          HapticFeedback.lightImpact();
                          Fluttertoast.showToast(
                              msg: 'Forgotten password button pressed');
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 30),
                  SingleChildScrollView(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SquarTile(
                          imagePath: 'images/G.png',
                          o_p: () => SignUpInGoogle().sg(),
                        ),
                        SizedBox(width: 30),
                        SquarTile(
                          imagePath: 'images/A.png',
                          o_p: () {},
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Not a member? ',
                            style: TextStyle(color: Colors.white),
                          ),
                          InkWell(
                            onTap: () {
                              waitForS();
                            },
                            child: Text(
                              'Register now',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: const Color.fromARGB(255, 208, 33, 243),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MyPainter extends CustomPainter {
  final double radius;

  MyPainter(this.radius);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..shader = LinearGradient(colors: [
        Color.fromARGB(255, 213, 161, 255),
        Color.fromARGB(255, 109, 0, 172)
      ], begin: Alignment.topLeft, end: Alignment.bottomRight)
          .createShader(Rect.fromCircle(
        center: Offset(0, 0),
        radius: radius,
      ));

    canvas.drawCircle(Offset.zero, radius, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class MyBehavior extends ScrollBehavior {
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}
