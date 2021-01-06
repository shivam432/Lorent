import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:outline_material_icons/outline_material_icons.dart';
import 'signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  String userId;
  Profile({Key key, @required this.userId}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

int currentPage = 0;

class _ProfileState extends State<Profile> {
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
                        colors: [Color(0xFF5a20c7), Color(0xFF5a20c7)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Text(
                          "Welcome to Lo Rent\nOwners App",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: "Poiret",
                              fontWeight: FontWeight.bold,
                              fontSize: 22),
                        ),
                      ),
                      Spacer(),
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
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontFamily: "Poiret"),
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
                  .doc(widget.userId)
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
                            color: Color(0xFF5a20c7),
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
                              fontFamily: "Josefin",
                              fontSize: 17,
                              color: Colors.black87),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Icon(
                              OMIcons.calendarToday,
                              color: Color(0xFF5a20c7),
                              size: 15,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(snapshot.data.data()["dob"],
                                style: TextStyle(
                                    fontFamily: "Quicksand",
                                    fontSize: 15,
                                    color: Colors.black87)),
                          ],
                        ),
                        SizedBox(
                          height: 10,
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
