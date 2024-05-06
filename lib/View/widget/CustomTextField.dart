import 'package:flutter/material.dart';
import 'dart:ui';

class CustomTextField extends StatelessWidget {
  final IconData icon;
  final String hintText;
  final bool isPassword;
  final bool isEmail;
  final TextEditingController? controller;

  CustomTextField({
    required this.icon,
    required this.hintText,
    required this.isPassword,
    required this.isEmail,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaY: 15,
            sigmaX: 15,
          ),
          child: Container(
            height: 50,
            width: 300,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(.05),
              borderRadius: BorderRadius.circular(15),
            ),
            child: TextField(
              controller: controller,
              style: TextStyle(color: Colors.white.withOpacity(.8)),
              cursorColor: Colors.white,
              obscureText: isPassword,
              keyboardType:
                  isEmail ? TextInputType.emailAddress : TextInputType.text,
              decoration: InputDecoration(
                prefixIcon: Icon(
                  icon,
                  color: Colors.white.withOpacity(.7),
                ),
                border: InputBorder.none,
                hintMaxLines: 1,
                hintText: hintText,
                hintStyle: TextStyle(
                    fontSize: 14, color: Colors.white.withOpacity(.5)),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
