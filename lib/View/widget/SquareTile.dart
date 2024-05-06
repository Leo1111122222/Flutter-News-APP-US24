import 'package:flutter/material.dart';

class SquarTile extends StatelessWidget {
  final String imagePath;

  final Function()? o_p;
  //final VoidCallback onPressed;

  SquarTile({
    // required this.onPressed,
    required this.imagePath,
    required this.o_p,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: GestureDetector(
        onTap: o_p,
        child: Container(
          width: 70,
          height: 70,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.white),
              borderRadius: BorderRadius.circular(16),
              color: Color.fromARGB(255, 255, 255, 255)),
          child: Image.asset(
            imagePath,
          ),
        ),
      ),
    );
  }
}
