import 'package:demoApp/userDetails.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

void verificationCompleted(
    BuildContext context, AuthCredential authCredential) async {
  UserCredential result =
      await FirebaseAuth.instance.signInWithCredential(authCredential);

  User user = result.user;

  if (user != null) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => Details(
                  user: user,
                )));
  } else {
    print("Error");
  }
}

void verificationFailed(FirebaseAuthException exception) {
  print(exception);
}

void codeSent(String verificationId, [int forceResendingToken]) {}
