import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demoApp/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  String userId;
  Profile({Key key, @required this.userId}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: 200,
                  padding: EdgeInsets.only(top: 40.0, right: 30.0),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Color(0xFF396afc), Color(0xFF2948ff)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              FirebaseAuth.instance.signOut();
                              Navigator.pushAndRemoveUntil(
                                  context,
                                  CupertinoPageRoute(
                                      builder: (context) => Home()),
                                  (route) => false);
                            },
                            child: Icon(
                              Icons.power_settings_new,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            "Log out",
                            style: TextStyle(
                                color: Colors.white60, fontFamily: "Quicksand"),
                          )
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection("users")
                  .doc(userId)
                  .snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<DocumentSnapshot> snapshot) {
                if (snapshot.hasData) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 140, left: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(50),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black12.withOpacity(0.08),
                                    offset: Offset(0, 3),
                                    blurRadius: 7,
                                    spreadRadius: 3)
                              ]),
                          child: Icon(
                            Icons.perm_identity,
                            size: 50,
                            color: Color(0xFF2948ff),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          snapshot.data.data()["name"],
                          style: TextStyle(fontFamily: "Josefin", fontSize: 23),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          snapshot.data.data()["mail"],
                          style: TextStyle(
                              fontFamily: "Quicksand",
                              fontSize: 13,
                              color: Colors.black87),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.calendar_today,
                              color: Color(0xFF2948ff),
                              size: 15,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(snapshot.data.data()["dob"],
                                style: TextStyle(
                                    fontFamily: "Quicksand",
                                    fontSize: 15,
                                    color: Colors.black87))
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.location_on,
                              color: Color(0xFF2948ff),
                              size: 20.0,
                            ),
                            SizedBox(
                              width: 5.0,
                            ),
                            Text(
                              "${snapshot.data.data()["address"]}\n${snapshot.data.data()["city"]},\n${snapshot.data.data()["state"]},  ${snapshot.data.data()["pincode"]}",
                              style: TextStyle(
                                  fontFamily: "Josefin", fontSize: 12),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  );
                } else {
                  return SizedBox();
                }
              })
        ],
      ),
    );
  }
}
