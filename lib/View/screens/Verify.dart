import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:US24/Controller/Auth.dart';
import 'package:US24/View/widget/MyButtonWithOutAnimation.dart';
import 'package:US24/View/widget/ShowErrorSnackbar.dart';

class Verify extends StatefulWidget {
  const Verify({Key? key}) : super(key: key);

  @override
  State<Verify> createState() => _Verify();
}

class _Verify extends State<Verify> {
  ShowErrorSnackbar S = new ShowErrorSnackbar();
  bool isEmailVerified = false;
  bool canResendEmail = false;
  Timer? timer;
  @override
  void initState() {
    super.initState();
    isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;
    if (!isEmailVerified) {
      sendVerificationEmail();
      timer = Timer.periodic(
        Duration(seconds: 3),
        (_) => CheckEmailVerified(),
      );
    }
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  Future CheckEmailVerified() async {
    await FirebaseAuth.instance.currentUser!.reload();
    setState(() {
      isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;
    });
    if (isEmailVerified) {
      timer?.cancel();
    }
  }

  Future sendVerificationEmail() async {
    try {
      final user = FirebaseAuth.instance.currentUser!;
      await user.sendEmailVerification();
      setState(() => canResendEmail = false);
      await Future.delayed(Duration(seconds: 5));
      setState(() => canResendEmail = true);
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) => isEmailVerified
      ? Auth()
      : Scaffold(
          backgroundColor: Color.fromARGB(255, 213, 161, 255),
          appBar: AppBar(
            backgroundColor: Color.fromARGB(255, 109, 0, 172),
            title: Text(
              'Verify Email',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
          body: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'A verification email has been send to your email.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                MyB(
                    color: Color.fromARGB(255, 109, 0, 172),
                    text: 'Resent Email',
                    onPressed: () {
                      if (canResendEmail) {
                        sendVerificationEmail();
                      }
                    }),
                /*  MyB(
                    color: const Color.fromARGB(255, 65, 65, 65),
                    text: 'Cancel',
                    onPressed: () {
                      FirebaseAuth.instance.signOut();
                    }),*/
              ],
            ),
          ),
        );
}
