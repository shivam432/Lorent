import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_share_me/flutter_share_me.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:outline_material_icons/outline_material_icons.dart';
import 'package:url_launcher/url_launcher.dart';

class Remind extends StatefulWidget {
  final userId;
  Remind({this.userId});

  @override
  _RemindState createState() => _RemindState();
}

class _RemindState extends State<Remind> {
  String dropdownValue = "Select Reminder Type";
  String key = "Select Reminder Type";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF5a20c7),
          title: Text("Reminder",
              style: TextStyle(
                fontFamily: "Josefin",
                fontSize: 25,
              )),
          centerTitle: true,
        ),
        body: Container(
            height: MediaQuery.of(context).size.height,
            child: StreamBuilder<DocumentSnapshot>(
                stream: FirebaseFirestore.instance
                    .collection("users")
                    .doc(widget.userId)
                    .snapshots(),
                builder: (context, snapshot) {
                  return snapshot.hasData
                      ? ListView.builder(
                          itemCount: snapshot.data.data()["tenants"].length,
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                                height: 140,
                                margin: EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 10),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(
                                          color:
                                              Colors.black12.withOpacity(0.21),
                                          offset: Offset(0, 3),
                                          blurRadius: 7)
                                    ]),
                                child: Padding(
                                    padding: const EdgeInsets.only(
                                        top: 15, left: 8, right: 10),
                                    child: Column(
                                      children: <Widget>[
                                        Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: <Widget>[
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: <Widget>[
                                                  Text(
                                                    snapshot.data
                                                            .data()["tenants"]
                                                        [index]["name"],
                                                    style: TextStyle(
                                                        fontFamily: "Josefin",
                                                        fontSize: 21),
                                                  ),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  Text(
                                                      snapshot.data
                                                              .data()["tenants"]
                                                          [index]["djoined"],
                                                      style: TextStyle(
                                                          fontFamily: "Josefin",
                                                          color: Colors.grey,
                                                          fontSize: 17)),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  Text(
                                                      "\u20B9" +
                                                          snapshot.data.data()[
                                                                  "tenants"]
                                                              [index]["amount"],
                                                      style: TextStyle(
                                                          fontFamily: "Josefin",
                                                          color: Colors.grey,
                                                          fontSize: 17)),
                                                ],
                                              ),
                                              Column(children: <Widget>[
                                                Text(
                                                    snapshot.data
                                                            .data()["tenants"]
                                                        [index]["mobile"],
                                                    style: TextStyle(
                                                        fontFamily: "Josefin",
                                                        color: Colors.grey,
                                                        fontSize: 20)),
                                                DropdownButton<String>(
                                                  value: dropdownValue,
                                                  hint: new Text("Select"),
                                                  icon: Icon(
                                                      Icons.arrow_downward),
                                                  iconSize: 24,
                                                  elevation: 16,
                                                  style: TextStyle(
                                                      color: Color(0xFF5a20c7)),
                                                  underline: Container(
                                                    height: 2,
                                                    color: Color(0xFF5a20c7),
                                                  ),
                                                  onChanged: (String newValue) {
                                                    print(newValue);
                                                    setState(() {
                                                      dropdownValue = newValue;
                                                      key = newValue;
                                                    });
                                                  },
                                                  items: <String>[
                                                    "Select Reminder Type",
                                                    "Gentle Reminder",
                                                    'Reminder - 1',
                                                    'Reminder - 2',
                                                    'Final Reminder',
                                                    'Please pay by Today',
                                                    'Please pay by Tomorrow',
                                                    'Rent is paid'
                                                  ].map<
                                                          DropdownMenuItem<
                                                              String>>(
                                                      (String value) {
                                                    return DropdownMenuItem<
                                                        String>(
                                                      value: value,
                                                      child: Text(value),
                                                    );
                                                  }).toList(),
                                                ),
                                              ])
                                            ]),
                                        Row(
                                          children: [
                                            RaisedButton(
                                              onPressed: () {
                                                Map<String, String> msg = {
                                                  "Select Reminder Type": "",
                                                  "Gentle Reminder": "Dear " +
                                                      snapshot.data
                                                              .data()["tenants"]
                                                          [index]["name"] +
                                                      "," +
                                                      " Your rent of amount " +
                                                      "\u20B9" +
                                                      snapshot.data
                                                              .data()["tenants"]
                                                          [index]["amount"] +
                                                      " is due for this month. Kindly pay it before " +
                                                      snapshot.data
                                                              .data()["tenants"]
                                                          [index]["due"] +
                                                      "\n" +
                                                      "Thank you " +
                                                      "-- " +
                                                      snapshot.data
                                                          .data()["name"],
                                                  "Reminder - 1": "Dear " +
                                                      snapshot.data
                                                              .data()["tenants"]
                                                          [index]["name"] +
                                                      ",\n" +
                                                      "Reminding you again, " +
                                                      "Your rent of amount " +
                                                      "\u20B9" +
                                                      snapshot.data
                                                              .data()["tenants"]
                                                          [index]["amount"] +
                                                      " is due for this month. Kindly pay it before " +
                                                      snapshot.data
                                                              .data()["tenants"]
                                                          [index]["due"] +
                                                      ".\n" +
                                                      "Thank you " +
                                                      "-- " +
                                                      snapshot.data
                                                          .data()["name"],
                                                  "Reminder - 2": "Dear " +
                                                      snapshot.data
                                                              .data()["tenants"]
                                                          [index]["name"] +
                                                      ",\n" +
                                                      "Reminding you once more," +
                                                      " Your rent of amount " +
                                                      "\u20b9" +
                                                      snapshot.data
                                                              .data()["tenants"]
                                                          [index]["amount"] +
                                                      " is due for this month. Kindly pay it before " +
                                                      snapshot.data
                                                              .data()["tenants"]
                                                          [index]["due"] +
                                                      ".\n" +
                                                      "Thank you" +
                                                      "-- " +
                                                      snapshot.data
                                                          .data()["name"],
                                                  "Final Reminder": "Dear " +
                                                      snapshot.data
                                                              .data()["tenants"]
                                                          [index]["name"] +
                                                      ",\n" +
                                                      "This is the final reminder. "
                                                          " Your rent of amount " +
                                                      "\u20b9" +
                                                      snapshot.data
                                                              .data()["tenants"]
                                                          [index]["amount"] +
                                                      " is due for this month. Kindly pay it before " +
                                                      snapshot.data
                                                              .data()["tenants"]
                                                          [index]["due"] +
                                                      ".\n" +
                                                      "Thank you" +
                                                      "-- " +
                                                      snapshot.data
                                                          .data()["name"],
                                                  "Please pay by Today":
                                                      "Dear " +
                                                          snapshot.data.data()[
                                                                  "tenants"]
                                                              [index]["name"] +
                                                          ",\n" +
                                                          "This is the final reminder."
                                                              " Your rent of amount " +
                                                          "\u20b9" +
                                                          snapshot.data.data()[
                                                                      "tenants"]
                                                                  [index]
                                                              ["amount"] +
                                                          " is due for this month. Kindly pay it today as " +
                                                          snapshot.data.data()[
                                                                  "tenants"]
                                                              [index]["due"] +
                                                          ".\n" +
                                                          "Thank you" +
                                                          "-- " +
                                                          snapshot.data
                                                              .data()["name"],
                                                  "Please pay by Tomorrow":
                                                      "Dear " +
                                                          snapshot.data.data()[
                                                                  "tenants"]
                                                              [index]["name"] +
                                                          ",\n" +
                                                          "This is the final reminder. "
                                                              "Your rent of amount " +
                                                          "\u20b9" +
                                                          snapshot.data.data()[
                                                                      "tenants"]
                                                                  [index]
                                                              ["amount"] +
                                                          " is due for this month. Kindly pay it tomorrow as " +
                                                          snapshot.data.data()[
                                                                  "tenants"]
                                                              [index]["due"] +
                                                          ".\n" +
                                                          "Thank you" +
                                                          "-- " +
                                                          snapshot.data
                                                              .data()["name"],
                                                  "Rent is paid": "Dear " +
                                                      snapshot.data
                                                              .data()["tenants"]
                                                          [index]["name"] +
                                                      ",\n" +
                                                      " Your rent of amount " +
                                                      "\u20b9" +
                                                      snapshot.data
                                                              .data()["tenants"]
                                                          [index]["amount"] +
                                                      " is paid. " +
                                                      "\n" +
                                                      "Thank you" +
                                                      "-- " +
                                                      snapshot.data
                                                          .data()["name"],
                                                };

                                                print(msg[key]);
                                                if (key ==
                                                    "Select Reminder Type") {
                                                  Fluttertoast.showToast(
                                                      msg:
                                                          "Please select any  Reminder type",
                                                      toastLength:
                                                          Toast.LENGTH_SHORT,
                                                      gravity:
                                                          ToastGravity.CENTER,
                                                      backgroundColor:
                                                          Colors.grey,
                                                      textColor: Colors.white,
                                                      fontSize: 16.0);
                                                } else {
                                                  launch("http://wa.me/91" +
                                                      snapshot.data
                                                              .data()["tenants"]
                                                          [index]["mobile"] +
                                                      "?text=" +
                                                      msg[key]);
                                                }
                                              },
                                              child: Column(
                                                children: <Widget>[
                                                  Text(
                                                    "Send message ",
                                                    style: TextStyle(
                                                        color:
                                                            Color(0xFF5a20c7)),
                                                  ),
                                                  Text(
                                                    "Via Whatsapp",
                                                    style: TextStyle(
                                                        color:
                                                            Color(0xFF5a20c7)),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Spacer(),
                                            RaisedButton(
                                              onPressed: () {
                                                Map<String, String> msg = {
                                                  "Select Reminder Type": "",
                                                  "Gentle Reminder": "Dear " +
                                                      snapshot.data
                                                              .data()["tenants"]
                                                          [index]["name"] +
                                                      "," +
                                                      " Your rent of amount " +
                                                      "\u20B9" +
                                                      snapshot.data
                                                              .data()["tenants"]
                                                          [index]["amount"] +
                                                      " is due for this month. Kindly pay it before " +
                                                      snapshot.data
                                                              .data()["tenants"]
                                                          [index]["due"] +
                                                      "\n" +
                                                      "Thank you " +
                                                      "-- " +
                                                      snapshot.data
                                                          .data()["name"],
                                                  "Reminder - 1": "Dear " +
                                                      snapshot.data
                                                              .data()["tenants"]
                                                          [index]["name"] +
                                                      ",\n" +
                                                      "Reminding you again, " +
                                                      "Your rent of amount " +
                                                      "\u20B9" +
                                                      snapshot.data
                                                              .data()["tenants"]
                                                          [index]["amount"] +
                                                      " is due for this month. Kindly pay it before " +
                                                      snapshot.data
                                                              .data()["tenants"]
                                                          [index]["due"] +
                                                      ".\n" +
                                                      "Thank you " +
                                                      "-- " +
                                                      snapshot.data
                                                          .data()["name"],
                                                  "Reminder - 2": "Dear " +
                                                      snapshot.data
                                                              .data()["tenants"]
                                                          [index]["name"] +
                                                      ",\n" +
                                                      "Reminding you once more," +
                                                      " Your rent of amount " +
                                                      "\u20b9" +
                                                      snapshot.data
                                                              .data()["tenants"]
                                                          [index]["amount"] +
                                                      " is due for this month. Kindly pay it before " +
                                                      snapshot.data
                                                              .data()["tenants"]
                                                          [index]["due"] +
                                                      ".\n" +
                                                      "Thank you" +
                                                      "-- " +
                                                      snapshot.data
                                                          .data()["name"],
                                                  "Final Reminder": "Dear " +
                                                      snapshot.data
                                                              .data()["tenants"]
                                                          [index]["name"] +
                                                      ",\n" +
                                                      "This is the final reminder. "
                                                          " Your rent of amount " +
                                                      "\u20b9" +
                                                      snapshot.data
                                                              .data()["tenants"]
                                                          [index]["amount"] +
                                                      " is due for this month. Kindly pay it before " +
                                                      snapshot.data
                                                              .data()["tenants"]
                                                          [index]["due"] +
                                                      ".\n" +
                                                      "Thank you" +
                                                      "-- " +
                                                      snapshot.data
                                                          .data()["name"],
                                                  "Please pay by Today":
                                                      "Dear " +
                                                          snapshot.data.data()[
                                                                  "tenants"]
                                                              [index]["name"] +
                                                          "," +
                                                          "This is the final reminder."
                                                              " Your rent of amount " +
                                                          "\u20b9" +
                                                          snapshot.data.data()[
                                                                      "tenants"]
                                                                  [index]
                                                              ["amount"] +
                                                          " is due for this month. Kindly pay it today as " +
                                                          snapshot.data.data()[
                                                                  "tenants"]
                                                              [index]["due"] +
                                                          ".\n" +
                                                          "Thank you" +
                                                          "-- " +
                                                          snapshot.data
                                                              .data()["name"],
                                                  "Please pay by Tomorrow":
                                                      "Dear " +
                                                          snapshot.data.data()[
                                                                  "tenants"]
                                                              [index]["name"] +
                                                          "," +
                                                          "This is the final reminder. "
                                                              "Your rent of amount " +
                                                          "\u20b9" +
                                                          snapshot.data.data()[
                                                                      "tenants"]
                                                                  [index]
                                                              ["amount"] +
                                                          " is due for this month. Kindly pay it tomorrow as " +
                                                          snapshot.data.data()[
                                                                  "tenants"]
                                                              [index]["due"] +
                                                          ".\n" +
                                                          "Thank you" +
                                                          "-- " +
                                                          snapshot.data
                                                              .data()["name"],
                                                  "Rent is paid": "Dear " +
                                                      snapshot.data
                                                              .data()["tenants"]
                                                          [index]["name"] +
                                                      ",\n" +
                                                      " Your rent of amount " +
                                                      "\u20b9" +
                                                      snapshot.data
                                                              .data()["tenants"]
                                                          [index]["amount"] +
                                                      " is paid. " +
                                                      "\n" +
                                                      "Thank you" +
                                                      "-- " +
                                                      snapshot.data
                                                          .data()["name"],
                                                };

                                                print(msg[key]);
                                                if (key ==
                                                    "Select Reminder Type") {
                                                  Fluttertoast.showToast(
                                                      msg:
                                                          "Please select any  Reminder type",
                                                      toastLength:
                                                          Toast.LENGTH_SHORT,
                                                      gravity:
                                                          ToastGravity.CENTER,
                                                      backgroundColor:
                                                          Colors.grey,
                                                      textColor: Colors.white,
                                                      fontSize: 16.0);
                                                } else {
                                                  FlutterShareMe()
                                                      .shareToSystem(
                                                          msg: msg[key]);
                                                }
                                              },
                                              child: Row(
                                                children: <Widget>[
                                                  Text(
                                                    "Send text message",
                                                    style: TextStyle(
                                                        color:
                                                            Color(0xFF5a20c7)),
                                                  ),
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ],
                                    )));
                          })
                      : Center(child: CircularProgressIndicator());
                })));
  }
}
