import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demoApp/profile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Details extends StatefulWidget {
  User user;
  Details({Key key, @required this.user}) : super(key: key);
  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  TextEditingController name = new TextEditingController();
  TextEditingController mail = new TextEditingController();
  TextEditingController address = new TextEditingController();
  TextEditingController dob = new TextEditingController();
  TextEditingController city = new TextEditingController();
  TextEditingController state = new TextEditingController();
  TextEditingController country = new TextEditingController();
  TextEditingController pin = new TextEditingController();

// Location

//Location

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Stack(children: <Widget>[
        Container(
          height: MediaQuery.of(context).size.height,
          alignment: Alignment.topCenter,
          padding: EdgeInsets.only(top: 60),
          decoration: BoxDecoration(
            gradient:
                LinearGradient(colors: [Color(0xFF396afc), Color(0xFF2948ff)]),
          ),
          child: Text(
            " Add Details",
            style: TextStyle(
              fontSize: 50.0,
              color: Colors.white,
              fontFamily: "LobsterTwo",
            ),
          ),
        ),
        Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: DraggableScrollableSheet(
              maxChildSize: 1.0,
              initialChildSize: 0.7,
              minChildSize: 0.7,
              builder: (BuildContext context, ScrollController controller) {
                return Container(
                  padding: EdgeInsets.only(left: 20.0, right: 20.0),
                  // margin: EdgeInsets.only(top: 150),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(35),
                        topRight: Radius.circular(35),
                      ),
                      color: Colors.white),
                  child: ListView(
                    physics: BouncingScrollPhysics(),
                    controller: controller,
                    children: [
                      SizedBox(
                        height: 30.0,
                      ),
                      textFields(
                          context, "Full name", name, TextInputType.text),
                      SizedBox(
                        height: 30.0,
                      ),
                      textFields(
                          context, "Email Address", mail, TextInputType.text),
                      SizedBox(
                        height: 30.0,
                      ),
                      textFields(
                          context, "Date of Birth", dob, TextInputType.text),
                      SizedBox(
                        height: 20.0,
                      ),
                      textFields(context, "City", city, TextInputType.text),
                      SizedBox(
                        height: 20.0,
                      ),
                      textFields(context, "State", state, TextInputType.text),
                      SizedBox(
                        height: 20.0,
                      ),
                      textFields(
                          context, "Address", address, TextInputType.text),
                      SizedBox(
                        height: 20.0,
                      ),
                      textFields(
                          context, "Country", country, TextInputType.text),
                      SizedBox(
                        height: 20.0,
                      ),
                      textFields(
                          context, "PIN Code", pin, TextInputType.number),
                      SizedBox(
                        height: 30.0,
                      ),
                      SizedBox(
                        height: 30.0,
                      ),
                      GestureDetector(
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: EdgeInsets.only(left: 40.0),
                            child: GestureDetector(
                              onTap: () {
                                FirebaseFirestore.instance
                                    .collection("users")
                                    .doc(widget.user.uid)
                                    .set({
                                  "name": name.text,
                                  "address": address.text,
                                  "pincode": pin.text,
                                  "state": state.text,
                                  "country": country.text,
                                  "mail": mail.text,
                                  "dob": dob.text,
                                  "city": city.text
                                }).whenComplete(() {
                                  Navigator.push(
                                      context,
                                      CupertinoPageRoute(
                                          builder: (context) => Profile(
                                                userId: widget.user.uid,
                                              )));
                                });
                              },
                              child: Container(
                                width: 70.0,
                                height: 70.0,
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
                                          color:
                                              Color.fromRGBO(57, 106, 252, 0.3),
                                          blurRadius: 10.0,
                                          offset: Offset(3, 7.0))
                                    ],
                                    borderRadius: BorderRadius.circular(50.0)),
                                child: Center(
                                  child: Icon(
                                    Icons.arrow_forward_ios,
                                    color: Colors.white,
                                    size: 30.0,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30.0,
                      )
                    ],
                  ),
                );
              }),
        )
      ]),
    ));
  }
}

Widget textFields(BuildContext context, String hint,
    TextEditingController controller, TextInputType type) {
  return Container(
    width: MediaQuery.of(context).size.width - 80,
    decoration: BoxDecoration(),
    child: TextField(
      style: TextStyle(
        fontSize: 20.0,
        fontFamily: "Josefin",
      ),
      keyboardType: type,
      controller: controller,
      decoration: InputDecoration(
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Color(0xFF1165C1), width: 2.0),
          ),
          border: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.grey, width: 2.0),
          ),
          hintStyle: TextStyle(
            fontSize: 20.0,
            fontFamily: "Josefin",
          ),
          hintText: hint),
    ),
  );
}
