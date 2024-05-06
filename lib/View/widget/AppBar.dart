import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? actionsWidget;

  MyAppBar({this.actionsWidget});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Color.fromARGB(255, 65, 3, 116),
      automaticallyImplyLeading: true,
      title: Center(
        child: Container(
          width: 120,
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 144, 8, 255),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "US",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: ClipOval(
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 0, 0, 0),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    width: 35,
                    height: 35,
                    child: Image.asset(
                      "images/24.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      actions: actionsWidget != null ? <Widget>[actionsWidget!] : null,
      iconTheme: IconThemeData(color: Colors.white),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
