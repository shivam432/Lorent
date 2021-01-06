import 'package:LoRent/bottomnav.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_truecaller/flutter_truecaller.dart';

class Details extends StatefulWidget {
  User user;

  Details({Key key, @required this.user}) : super(key: key);
  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  String phone = "";
  TextEditingController name = new TextEditingController();
  TextEditingController number = new TextEditingController();
  TextEditingController mail = new TextEditingController();
  TextEditingController dob = new TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder<TruecallerProfile>(
            stream: FlutterTruecaller.trueProfile,
            builder: (context, snapshot) {
              phone = snapshot.data.phoneNumber;
              setState(() {
                number.text = phone;
              });
              return Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: Stack(children: <Widget>[
                  Container(
                    height: MediaQuery.of(context).size.height,
                    alignment: Alignment.topCenter,
                    padding: EdgeInsets.only(top: 60),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [Color(0xFF5a20c7), Color(0xFF5a20c7)]),
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
                        builder: (BuildContext context,
                            ScrollController controller) {
                          return Container(
                            padding: EdgeInsets.only(left: 20.0, right: 20.0),
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
                                    TextCapitalization.words,
                                    context,
                                    "Full name",
                                    name,
                                    TextInputType.text,
                                    null,
                                    null),
                                SizedBox(
                                  height: 30.0,
                                ),
                                textFields(
                                    TextCapitalization.none,
                                    context,
                                    "Email Address",
                                    mail,
                                    TextInputType.emailAddress,
                                    null,
                                    null),
                                SizedBox(
                                  height: 30.0,
                                ),
                                textFields(
                                    TextCapitalization.none,
                                    context,
                                    "DD/MM/YY",
                                    dob,
                                    TextInputType.datetime,
                                    null,
                                    null),
                                SizedBox(
                                  height: 20.0,
                                ),
                                textFields(
                                    TextCapitalization.none,
                                    context,
                                    "Mobile Number",
                                    number,
                                    TextInputType.number,
                                    10,
                                    ""),
                                SizedBox(
                                  height: 30.0,
                                ),
                                GestureDetector(
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Padding(
                                      padding: EdgeInsets.only(left: 40.0),
                                      child: GestureDetector(
                                        onTap: () async {
                                          FirebaseFirestore.instance
                                              .collection("users")
                                              .doc(widget.user.uid)
                                              .set({
                                            "name": name.text,
                                            "number": number.text,
                                            "mail": mail.text,
                                            "dob": dob.text,
                                            "tenants": [],
                                          }).whenComplete(() {
                                            Navigator.pushAndRemoveUntil(
                                                context,
                                                CupertinoPageRoute(
                                                    builder: (context) =>
                                                        Bottom()),
                                                (route) => false);
                                          });
                                        },
                                        child: Container(
                                          width: 70.0,
                                          height: 70.0,
                                          decoration: BoxDecoration(
                                              gradient: LinearGradient(
                                                  colors: [
                                                    Color(0xFF5a20c7),
                                                    Color(0xFF5a20c7)
                                                  ],
                                                  begin: Alignment.topLeft,
                                                  end: Alignment.bottomRight),
                                              boxShadow: [
                                                BoxShadow(
                                                    color: Color.fromRGBO(
                                                        57, 106, 252, 0.3),
                                                    blurRadius: 10.0,
                                                    offset: Offset(3, 7.0))
                                              ],
                                              borderRadius:
                                                  BorderRadius.circular(50.0)),
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
              );
            }));
  }

  Widget textFields(
      TextCapitalization capital,
      BuildContext context,
      String hint,
      TextEditingController controller,
      TextInputType type,
      int maxlength,
      String counterText) {
    return Container(
      width: MediaQuery.of(context).size.width - 80,
      decoration: BoxDecoration(),
      child: TextField(
        style: TextStyle(
          fontSize: 20.0,
          fontFamily: "Josefin",
        ),
        keyboardType: type,
        textCapitalization: capital,
        maxLength: maxlength,
        controller: controller,
        decoration: InputDecoration(
            counterText: counterText,
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
}
