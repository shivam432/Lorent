import 'dart:async';
import 'package:LoRent/sign.dart';

import 'signup.dart';
import 'authFunc.dart';
import 'bottomnav.dart';
import 'userDetails.dart';
import 'userFunction.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  startTime() async {
    var duration = Duration(seconds: 2);
    return Timer(duration, checkUser);
  }

  void checkUser() {
    User user = FirebaseAuth.instance.currentUser;
    print(user);
    if (user != null) {
      uid = user.uid;
      // print(uid);
      Navigator.pushAndRemoveUntil(context,
          CupertinoPageRoute(builder: (context) => Bottom()), (route) => false);
    } else {
      Navigator.pushAndRemoveUntil(context,
          CupertinoPageRoute(builder: (context) => Home()), (route) => false);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    startTime();
    // userF();await Fi
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            height: MediaQuery.of(context).size.height,
            child: Image.asset(
              "assets/2.png",
              fit: BoxFit.cover,
            )));
  }
}
