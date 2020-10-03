import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demoApp/sign.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'login.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // padding: EdgeInsets.only(top: 100.0),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: <Widget>[
            Positioned(
              left: -120,
              top: -70,
              child: Image.asset(
                "assets/bg1.png",
                scale: 2,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 120),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.only(left: 40.0),
                    child: Column(
                      children: <Widget>[
                        Text(
                          "Hello",
                          style: TextStyle(
                              fontSize: 70.0,
                              fontFamily: "LobsterTwo",
                              color: Colors.white),
                        ),
                        Text(
                          "Login to Continue",
                          style: TextStyle(
                              fontSize: 18.0,
                              fontFamily: "Poiret",
                              color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  Expanded(child: SizedBox()),
                  SizedBox(
                    height: 100.0,
                  ),
                  Column(
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              CupertinoPageRoute(
                                  builder: (context) => Login(
                                        tag: "login",
                                      )));
                        },
                        child: Hero(
                          tag: "login",
                          child: Container(
                            width: MediaQuery.of(context).size.width - 80,
                            height: 60,
                            decoration: BoxDecoration(
                                // color: Color(0xFF1165C1),
                                gradient: LinearGradient(
                                    colors: [
                                      Color(0xFF396afc),
                                      Color(0xFF2948ff)
                                    ],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight),
                                boxShadow: [
                                  BoxShadow(
                                      color: Color.fromRGBO(57, 106, 252, 0.4),
                                      blurRadius: 10.0,
                                      offset: Offset(0, 7.0))
                                ],
                                borderRadius: BorderRadius.circular(10.0)),
                            child: Material(
                              color: Colors.transparent,
                              child: Center(
                                child: Text(
                                  "Log In",
                                  style: TextStyle(
                                      fontFamily: "Poiret",
                                      color: Colors.white,
                                      fontSize: 18.0),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              CupertinoPageRoute(
                                  builder: (context) => Sign(
                                        tag: "signup",
                                      )));
                        },
                        child: Hero(
                          tag: "signup",
                          child: Container(
                            width: MediaQuery.of(context).size.width - 80,
                            height: 60,
                            decoration: BoxDecoration(
                                // border: Border.all(color: Color(0xFF70A1D7), width: 1.0),
                                gradient: LinearGradient(
                                    colors: [Colors.white, Colors.white],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight),
                                boxShadow: [
                                  BoxShadow(
                                      color: Color.fromRGBO(57, 106, 252, 0.3),
                                      blurRadius: 7.0,
                                      offset: Offset(0, 7.0))
                                ],
                                borderRadius: BorderRadius.circular(10.0)),
                            child: Material(
                              color: Colors.transparent,
                              child: Center(
                                child: Text(
                                  "Sign Up",
                                  style: TextStyle(
                                      fontFamily: "Poiret",
                                      color: Colors.black,
                                      fontSize: 18.0),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 60.0,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
