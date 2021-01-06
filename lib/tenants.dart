import 'package:LoRent/tenantDetails.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_awesome_alert_box/flutter_awesome_alert_box.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:outline_material_icons/outline_material_icons.dart';
import 'package:url_launcher/url_launcher.dart';
// import 'package:url_launcher/url_launcher.dart';

class Tenants extends StatefulWidget {
  Tenants({this.userId});

  final userId;
  @override
  _TenantsState createState() => _TenantsState();
}

class _TenantsState extends State<Tenants> {
  TextEditingController tname = new TextEditingController();
  TextEditingController tmail = new TextEditingController();
  TextEditingController tnum = new TextEditingController();
  TextEditingController tamount = new TextEditingController();
  TextEditingController tadhar = new TextEditingController();
  TextEditingController due = new TextEditingController();
  TextEditingController joined = new TextEditingController();
  TextEditingController tjob = new TextEditingController();
  TextEditingController thtown = new TextEditingController();

  TextEditingController utname = new TextEditingController();
  TextEditingController utmail = new TextEditingController();
  TextEditingController utnum = new TextEditingController();
  TextEditingController utamount = new TextEditingController();
  TextEditingController utadhar = new TextEditingController();
  TextEditingController udue = new TextEditingController();
  TextEditingController ujoined = new TextEditingController();
  TextEditingController utjob = new TextEditingController();
  TextEditingController uthtown = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF5a20c7),
        title: Text("List of Tenants",
            style: TextStyle(
              fontFamily: "Josefin",
              fontSize: 25,
            )),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Color(0xFF5a20c7),
        onPressed: () {
          showModalBottomSheet(
              backgroundColor: Colors.white,
              isScrollControlled: true,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15.0),
                      topRight: Radius.circular(15.0))),
              context: context,
              builder: (context) => Padding(
                    padding: MediaQuery.of(context).viewInsets,
                    child: SingleChildScrollView(
                      child: Container(
                        padding: const EdgeInsets.only(
                            left: 15, right: 15, top: 35, bottom: 15),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(left: 75),
                                  child: Text("Add Tenants",
                                      style: TextStyle(
                                          fontFamily: "LobsterTwo",
                                          fontSize: 31)),
                                ),
                                Spacer(),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.pop(context);
                                    tname.clear();
                                    tmail.clear();
                                    tnum.clear();
                                    tamount.clear();
                                    tadhar.clear();
                                    due.clear();
                                    joined.clear();
                                    thtown.clear();

                                    tjob.clear();
                                  },
                                  child: Icon(
                                    Icons.cancel,
                                    color: Colors.red,
                                    size: 31,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 15),
                            TextField(
                              textCapitalization: TextCapitalization.words,
                              autocorrect: true,
                              controller: tname,
                              decoration: InputDecoration(
                                  labelText: "Name *",
                                  labelStyle: TextStyle(
                                    fontFamily: "Josefin",
                                  )),
                            ),
                            TextField(
                                keyboardType: TextInputType.emailAddress,
                                autofocus: true,
                                controller: tmail,
                                decoration: InputDecoration(
                                    labelText: "Email *",
                                    labelStyle: TextStyle(
                                      fontFamily: "Josefin",
                                    ))),
                            TextField(
                                autofocus: true,
                                controller: tnum,
                                keyboardType: TextInputType.number,
                                maxLength: 10,
                                decoration: InputDecoration(
                                    counterText: "",
                                    labelText: "Mobile number *",
                                    labelStyle: TextStyle(
                                      fontFamily: "Josefin",
                                    ))),
                            TextField(
                              controller: tamount,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                  labelText: "Rent *",
                                  labelStyle: TextStyle(
                                    fontFamily: "Josefin",
                                  )),
                            ),
                            TextField(
                              controller: joined,
                              keyboardType: TextInputType.datetime,
                              decoration: InputDecoration(
                                  labelText: "Joined date(DD/MM/YY) *",
                                  labelStyle: TextStyle(
                                    fontFamily: "Josefin",
                                  )),
                            ),
                            TextField(
                              controller: tadhar,
                              keyboardType: TextInputType.number,
                              maxLength: 12,
                              decoration: InputDecoration(
                                  counterText: "",
                                  labelText: "Aadhar number ",
                                  labelStyle: TextStyle(
                                    fontFamily: "Josefin",
                                  )),
                            ),
                            TextField(
                              controller: due,
                              keyboardType: TextInputType.datetime,
                              decoration: InputDecoration(
                                  labelText: "Due date(DD/MM/Y)",
                                  labelStyle: TextStyle(
                                    fontFamily: "Josefin",
                                  )),
                            ),
                            TextField(
                              controller: thtown,
                              textCapitalization: TextCapitalization.words,
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                  labelText: "Home town",
                                  labelStyle: TextStyle(
                                    fontFamily: "Josefin",
                                  )),
                            ),
                            TextField(
                              textCapitalization: TextCapitalization.words,
                              controller: tjob,
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                  labelText: "Job",
                                  labelStyle: TextStyle(
                                    fontFamily: "Josefin",
                                  )),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Center(
                              child: RaisedButton(
                                onPressed: () async {
                                  List tenants = [];
                                  DocumentSnapshot usersnap =
                                      await FirebaseFirestore.instance
                                          .collection("users")
                                          .doc(widget.userId)
                                          .get();
                                  tenants = usersnap.data()["tenants"];
                                  if (tname.text.isNotEmpty &&
                                      tmail.text.isNotEmpty &&
                                      tnum.text.isNotEmpty &&
                                      tamount.text.isNotEmpty &&
                                      joined.text.isNotEmpty) {
                                    tenants.add({
                                      "name": tname.text,
                                      "mobile": tnum.text,
                                      "email": tmail.text,
                                      "aadhar": tadhar.text,
                                      "dob": tjob.text,
                                      "amount": tamount.text,
                                      "due": due.text,
                                      "djoined": joined.text,
                                      "hometown": thtown.text,
                                      "job": tjob.text
                                    });
                                    FirebaseFirestore.instance
                                        .collection("users")
                                        .doc(widget.userId)
                                        .update({
                                      "tenants": tenants
                                    }).whenComplete(() {
                                      tname.clear();
                                      tmail.clear();
                                      tnum.clear();
                                      tamount.clear();
                                      tadhar.clear();
                                      due.clear();
                                      joined.clear();
                                      thtown.clear();

                                      tjob.clear();
                                    });
                                  }

                                  tname.text.isNotEmpty &&
                                          tmail.text.isNotEmpty &&
                                          tnum.text.isNotEmpty &&
                                          tamount.text.isNotEmpty &&
                                          joined.text.isNotEmpty
                                      ? Fluttertoast.showToast(
                                          msg: "Tenant added Successfully!",
                                          toastLength: Toast.LENGTH_SHORT,
                                          gravity: ToastGravity.CENTER,
                                          backgroundColor: Colors.grey,
                                          textColor: Colors.white,
                                          fontSize: 16.0)
                                      : SizedBox();
                                  if (tname.text.isEmpty ||
                                      tmail.text.isEmpty ||
                                      tnum.text.isEmpty ||
                                      tamount.text.isEmpty ||
                                      joined.text.isEmpty) {
                                    showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            title: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Icon(
                                                  Icons.error,
                                                  color: Colors.red,
                                                ),
                                                SizedBox(width: 11),
                                                Expanded(
                                                    child: Text(
                                                        "Please add all the mandatory fields!")),
                                              ],
                                            ),
                                            titleTextStyle: TextStyle(
                                                color: Colors.black,
                                                fontSize: 25,
                                                fontFamily: "Josefin"),
                                            actions: <Widget>[
                                              RaisedButton(
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                  },
                                                  child: Text(
                                                    "Cancel",
                                                    style:
                                                        TextStyle(fontSize: 20),
                                                  )),
                                              RaisedButton(
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                  },
                                                  child: Text(
                                                    "Add",
                                                    style:
                                                        TextStyle(fontSize: 20),
                                                  )),
                                            ],
                                          );
                                        });
                                  }

                                  if (tname.text.isNotEmpty &&
                                      tmail.text.isNotEmpty &&
                                      tnum.text.isNotEmpty &&
                                      joined.text.isNotEmpty &&
                                      tamount.text.isNotEmpty) {
                                    Navigator.pop(context);
                                  }
                                },
                                child: Text("Add",
                                    style: TextStyle(
                                        fontFamily: "Josefin", fontSize: 21)),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ));
        },
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
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                CupertinoPageRoute(
                                    builder: (context) => TenantDetail(
                                          name: snapshot.data.data()["tenants"]
                                              [index]["name"],
                                          mail: snapshot.data.data()["tenants"]
                                              [index]["email"],
                                          number:
                                              snapshot.data.data()["tenants"]
                                                  [index]["mobile"],
                                          adhar: snapshot.data.data()["tenants"]
                                              [index]["aadhar"],
                                          amount:
                                              snapshot.data.data()["tenants"]
                                                  [index]["amount"],
                                          due: snapshot.data.data()["tenants"]
                                              [index]["due"],
                                          htown: snapshot.data.data()["tenants"]
                                              [index]["hometown"],
                                          job: snapshot.data.data()["tenants"]
                                              [index]["job"],
                                          joined:
                                              snapshot.data.data()["tenants"]
                                                  [index]["djoined"],
                                        )));
                          },
                          child: Container(
                              height: 130,
                              margin: EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 10),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.black12.withOpacity(0.21),
                                        offset: Offset(0, 3),
                                        blurRadius: 7)
                                  ]),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    top: 15, left: 8, right: 10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          snapshot.data.data()["tenants"][index]
                                              ["name"],
                                          style: TextStyle(
                                              fontFamily: "Josefin",
                                              fontSize: 21),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                            snapshot.data.data()["tenants"]
                                                [index]["email"],
                                            style: TextStyle(
                                                fontFamily: "Josefin",
                                                color: Colors.grey,
                                                fontSize: 17)),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                            "\u20B9" +
                                                snapshot.data.data()["tenants"]
                                                    [index]["amount"],
                                            style: TextStyle(
                                                fontFamily: "Josefin",
                                                color: Colors.grey,
                                                fontSize: 17)),
                                        Row(
                                          children: <Widget>[
                                            Text(
                                              "Due Date:",
                                              style: TextStyle(
                                                  fontFamily: "Josefin",
                                                  color: Colors.grey,
                                                  fontSize: 17),
                                            ),
                                            Text(
                                                snapshot.data.data()["tenants"]
                                                    [index]["due"],
                                                style: TextStyle(
                                                    fontFamily: "Josefin",
                                                    color: Colors.grey,
                                                    fontSize: 17)),
                                          ],
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: <Widget>[
                                        Row(
                                          children: <Widget>[
                                            GestureDetector(
                                              onTap: () async {
                                                List ttenants = [];
                                                DocumentSnapshot usersnap =
                                                    await FirebaseFirestore
                                                        .instance
                                                        .collection("users")
                                                        .doc(widget.userId)
                                                        .get();
                                                ttenants =
                                                    usersnap.data()["tenants"];
                                                ttenants.removeAt(index);
                                                FirebaseFirestore.instance
                                                    .collection("users")
                                                    .doc(widget.userId)
                                                    .update(
                                                        {"tenants": ttenants});
                                                Fluttertoast.showToast(
                                                    msg:
                                                        "Tenant Deleted Successfully!",
                                                    toastLength:
                                                        Toast.LENGTH_SHORT,
                                                    gravity:
                                                        ToastGravity.CENTER,
                                                    backgroundColor:
                                                        Colors.grey,
                                                    textColor: Colors.white,
                                                    fontSize: 16.0);
                                              },
                                              child: Icon(
                                                Icons.delete,
                                                color: Colors.red,
                                                size: 35,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 15,
                                            ),
                                            GestureDetector(
                                                onTap: () {
                                                  utname.text = snapshot.data
                                                          .data()["tenants"]
                                                      [index]["name"];
                                                  utmail.text = snapshot.data
                                                          .data()["tenants"]
                                                      [index]["email"];
                                                  utnum.text = snapshot.data
                                                          .data()["tenants"]
                                                      [index]["mobile"];
                                                  utamount.text = snapshot.data
                                                          .data()["tenants"]
                                                      [index]["amount"];
                                                  utadhar.text = snapshot.data
                                                          .data()["tenants"]
                                                      [index]["aadhar"];
                                                  udue.text = snapshot.data
                                                          .data()["tenants"]
                                                      [index]["due"];
                                                  ujoined.text = snapshot.data
                                                          .data()["tenants"]
                                                      [index]["djoined"];
                                                  uthtown.text = snapshot.data
                                                          .data()["tenants"]
                                                      [index]["hometown"];
                                                  utjob.text = snapshot.data
                                                          .data()["tenants"]
                                                      [index]["job"];

                                                  showModalBottomSheet(
                                                      backgroundColor:
                                                          Colors.white,
                                                      isScrollControlled: true,
                                                      shape: RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius.only(
                                                                  topLeft: Radius
                                                                      .circular(
                                                                          15.0),
                                                                  topRight: Radius
                                                                      .circular(
                                                                          15.0))),
                                                      context: context,
                                                      builder: (context) =>
                                                          Padding(
                                                              padding: MediaQuery
                                                                      .of(
                                                                          context)
                                                                  .viewInsets,
                                                              child:
                                                                  SingleChildScrollView(
                                                                      child:
                                                                          Container(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .only(
                                                                        left:
                                                                            15,
                                                                        right:
                                                                            15,
                                                                        top: 25,
                                                                        bottom:
                                                                            15),
                                                                child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .min,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Row(
                                                                        children: <
                                                                            Widget>[
                                                                          Padding(
                                                                            padding:
                                                                                const EdgeInsets.only(left: 75),
                                                                            child:
                                                                                Text("Update", style: TextStyle(fontFamily: "LobsterTwo", fontSize: 31)),
                                                                          ),
                                                                          Spacer(),
                                                                          GestureDetector(
                                                                            onTap:
                                                                                () {
                                                                              Navigator.pop(context);
                                                                              tname.clear();
                                                                              tmail.clear();
                                                                              tnum.clear();
                                                                              tamount.clear();
                                                                              tadhar.clear();
                                                                              due.clear();
                                                                              joined.clear();
                                                                              thtown.clear();

                                                                              tjob.clear();
                                                                            },
                                                                            child:
                                                                                Icon(
                                                                              Icons.cancel,
                                                                              color: Colors.red,
                                                                              size: 31,
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      SizedBox(
                                                                          height:
                                                                              15),
                                                                      TextField(
                                                                        textCapitalization:
                                                                            TextCapitalization.words,
                                                                        controller:
                                                                            utname,
                                                                        decoration: InputDecoration(
                                                                            labelText: "Name *",
                                                                            labelStyle: TextStyle(
                                                                              fontFamily: "Josefin",
                                                                            )),
                                                                      ),
                                                                      TextField(
                                                                          keyboardType: TextInputType
                                                                              .emailAddress,
                                                                          autofocus:
                                                                              true,
                                                                          controller:
                                                                              utmail,
                                                                          decoration: InputDecoration(
                                                                              labelText: "Email *",
                                                                              labelStyle: TextStyle(
                                                                                fontFamily: "Josefin",
                                                                              ))),
                                                                      TextField(
                                                                          autofocus:
                                                                              true,
                                                                          controller:
                                                                              utnum,
                                                                          keyboardType: TextInputType
                                                                              .number,
                                                                          maxLength:
                                                                              10,
                                                                          decoration: InputDecoration(
                                                                              counterText: "",
                                                                              labelText: "Mobile number *",
                                                                              labelStyle: TextStyle(
                                                                                fontFamily: "Josefin",
                                                                              ))),
                                                                      TextField(
                                                                        controller:
                                                                            utamount,
                                                                        keyboardType:
                                                                            TextInputType.number,
                                                                        decoration: InputDecoration(
                                                                            labelText: "Rent *",
                                                                            labelStyle: TextStyle(
                                                                              fontFamily: "Josefin",
                                                                            )),
                                                                      ),
                                                                      TextField(
                                                                        controller:
                                                                            ujoined,
                                                                        keyboardType:
                                                                            TextInputType.datetime,
                                                                        decoration: InputDecoration(
                                                                            labelText: "Joined date(DD/MM/YY) *",
                                                                            labelStyle: TextStyle(
                                                                              fontFamily: "Josefin",
                                                                            )),
                                                                      ),
                                                                      TextField(
                                                                        controller:
                                                                            utadhar,
                                                                        keyboardType:
                                                                            TextInputType.number,
                                                                        maxLength:
                                                                            12,
                                                                        decoration: InputDecoration(
                                                                            counterText: "",
                                                                            labelText: "Aadhar number ",
                                                                            labelStyle: TextStyle(
                                                                              fontFamily: "Josefin",
                                                                            )),
                                                                      ),
                                                                      TextField(
                                                                        controller:
                                                                            udue,
                                                                        keyboardType:
                                                                            TextInputType.datetime,
                                                                        decoration: InputDecoration(
                                                                            labelText: "Due date(DD/MM/YY)",
                                                                            labelStyle: TextStyle(
                                                                              fontFamily: "Josefin",
                                                                            )),
                                                                      ),
                                                                      TextField(
                                                                        textCapitalization:
                                                                            TextCapitalization.words,
                                                                        controller:
                                                                            uthtown,
                                                                        keyboardType:
                                                                            TextInputType.text,
                                                                        decoration: InputDecoration(
                                                                            labelText: "Home town",
                                                                            labelStyle: TextStyle(
                                                                              fontFamily: "Josefin",
                                                                            )),
                                                                      ),
                                                                      TextField(
                                                                        textCapitalization:
                                                                            TextCapitalization.words,
                                                                        controller:
                                                                            utjob,
                                                                        keyboardType:
                                                                            TextInputType.text,
                                                                        decoration: InputDecoration(
                                                                            labelText: "Job",
                                                                            labelStyle: TextStyle(
                                                                              fontFamily: "Josefin",
                                                                            )),
                                                                      ),
                                                                      SizedBox(
                                                                        height:
                                                                            10,
                                                                      ),
                                                                      Center(
                                                                        child:
                                                                            RaisedButton(
                                                                          onPressed:
                                                                              () async {
                                                                            List<dynamic>
                                                                                temp =
                                                                                snapshot.data.data()["tenants"];
                                                                            temp[index]["name"] =
                                                                                utname.text;
                                                                            temp[index]["email"] =
                                                                                utmail.text;
                                                                            temp[index]["mobile"] =
                                                                                utnum.text;
                                                                            temp[index]["amount"] =
                                                                                utamount.text;
                                                                            temp[index]["aadhar"] =
                                                                                utadhar.text;
                                                                            temp[index]["due"] =
                                                                                udue.text;
                                                                            temp[index]["djoined"] =
                                                                                ujoined.text;
                                                                            temp[index]["hometown"] =
                                                                                uthtown.text;
                                                                            temp[index]["job"] =
                                                                                utjob.text;

                                                                            FirebaseFirestore.instance.collection("users").doc(widget.userId).update({
                                                                              "tenants": temp
                                                                            });
                                                                            Navigator.pop(context);
                                                                            print(snapshot.data.data()["tenants"][index]);
                                                                            Fluttertoast.showToast(
                                                                                msg: "Updated Successfully!",
                                                                                toastLength: Toast.LENGTH_SHORT,
                                                                                gravity: ToastGravity.CENTER,
                                                                                backgroundColor: Colors.grey,
                                                                                textColor: Colors.white,
                                                                                fontSize: 16.0);
                                                                          },
                                                                          child:
                                                                              Text(
                                                                            "Update Details",
                                                                            style:
                                                                                TextStyle(fontFamily: "Josefin"),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ]),
                                                              ))));
                                                },
                                                child: Icon(
                                                  OMIcons.edit,
                                                  size: 35,
                                                  color: Color(0xFF5a20c7),
                                                ))
                                          ],
                                        ),
                                        SizedBox(
                                          height: 7,
                                        ),
                                        Text(
                                            snapshot.data.data()["tenants"]
                                                [index]["mobile"],
                                            style: TextStyle(
                                                fontFamily: "Josefin",
                                                color: Colors.grey,
                                                fontSize: 20)),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Flexible(
                                          child: Text("Joined on",
                                              style: TextStyle(
                                                  fontFamily: "Josefin",
                                                  color: Colors.black,
                                                  fontSize: 18)),
                                        ),
                                        Text(
                                            snapshot.data.data()["tenants"]
                                                [index]["djoined"],
                                            style: TextStyle(
                                                fontFamily: "Josefin",
                                                color: Colors.black,
                                                fontSize: 18))
                                      ],
                                    )
                                  ],
                                ),
                              )),
                        );
                      },
                    )
                  : Center(child: CircularProgressIndicator());
            }),
      ),
    );
  }
}
