import 'package:flutter/material.dart';

class MyB extends StatelessWidget {
  final Color color;
  final String text;
  final VoidCallback onPressed;

  MyB({
    required this.color,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        width: 300,
        height: 50,
        child: Material(
          elevation: 5,
          color: color,
          borderRadius: BorderRadius.circular(16),
          child: MaterialButton(
            onPressed: onPressed,
            height: 60,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                text,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
