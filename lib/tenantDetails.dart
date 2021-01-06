import 'package:flutter/material.dart';

class TenantDetail extends StatelessWidget {
  TenantDetail(
      {this.name,
      this.number,
      this.mail,
      this.amount,
      this.due,
      this.joined,
      this.adhar,
      this.htown,
      this.job});
  final name;
  final mail;
  final number;
  final amount;
  final adhar;
  final due;
  final joined;
  final htown;
  final job;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xFF5a20c7),
        title: Text("Tenant Details",
            style: TextStyle(
              fontFamily: "Josefin",
              fontSize: 25,
            )),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(
              top: 50,
              left: 10,
              right: 10,
            ),
            height: 520,
            width: 410,
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
                left: 15,
                top: 21,
                right: 10,
              ),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Text("Full Name :",
                          style: TextStyle(
                            fontFamily: "Josefin",
                            fontSize: 23,
                          )),
                      Spacer(),
                      Text(name,
                          style: TextStyle(
                              fontFamily: "Josefin",
                              fontSize: 19,
                              color: Colors.grey))
                    ],
                  ),
                  Divider(
                    thickness: 0.7,
                    color: Colors.grey,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: <Widget>[
                      Text("Email :",
                          style: TextStyle(
                            fontFamily: "Josefin",
                            fontSize: 23,
                          )),
                      Spacer(),
                      Text(mail,
                          style: TextStyle(
                              fontFamily: "Josefin",
                              fontSize: 19,
                              color: Colors.grey))
                    ],
                  ),
                  Divider(
                    thickness: 0.7,
                    color: Colors.grey,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: <Widget>[
                      Text("Mobile Number :",
                          style: TextStyle(
                            fontFamily: "Josefin",
                            fontSize: 23,
                          )),
                      Spacer(),
                      Text(number,
                          style: TextStyle(
                              fontFamily: "Josefin",
                              fontSize: 19,
                              color: Colors.grey))
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Divider(
                    thickness: 0.7,
                    color: Colors.grey,
                  ),
                  Row(
                    children: <Widget>[
                      Text("Rent :",
                          style: TextStyle(
                            fontFamily: "Josefin",
                            fontSize: 23,
                          )),
                      Spacer(),
                      Text("\u20b9" + amount,
                          style: TextStyle(
                              fontFamily: "Josefin",
                              fontSize: 19,
                              color: Colors.grey))
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Divider(
                    thickness: 0.7,
                    color: Colors.grey,
                  ),
                  Row(
                    children: <Widget>[
                      Text("Aadhar Number :",
                          style: TextStyle(
                            fontFamily: "Josefin",
                            fontSize: 23,
                          )),
                      Spacer(),
                      Text(adhar,
                          style: TextStyle(
                              fontFamily: "Josefin",
                              fontSize: 19,
                              color: Colors.grey))
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Divider(
                    thickness: 0.7,
                    color: Colors.grey,
                  ),
                  Row(
                    children: <Widget>[
                      Text("Due Date :",
                          style: TextStyle(
                            fontFamily: "Josefin",
                            fontSize: 23,
                          )),
                      Spacer(),
                      Text(mail,
                          style: TextStyle(
                              fontFamily: "Josefin",
                              fontSize: 19,
                              color: Colors.grey))
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Divider(
                    thickness: 0.7,
                    color: Colors.grey,
                  ),
                  Row(
                    children: <Widget>[
                      Text("Date Joined :",
                          style: TextStyle(
                            fontFamily: "Josefin",
                            fontSize: 23,
                          )),
                      Spacer(),
                      Text(joined,
                          style: TextStyle(
                              fontFamily: "Josefin",
                              fontSize: 19,
                              color: Colors.grey))
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Divider(
                    thickness: 0.7,
                    color: Colors.grey,
                  ),
                  Row(
                    children: <Widget>[
                      Text("Home Town :",
                          style: TextStyle(
                            fontFamily: "Josefin",
                            fontSize: 23,
                          )),
                      Spacer(),
                      Text(htown,
                          style: TextStyle(
                              fontFamily: "Josefin",
                              fontSize: 19,
                              color: Colors.grey))
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Divider(
                    thickness: 0.7,
                    color: Colors.grey,
                  ),
                  Row(
                    children: <Widget>[
                      Text("Job :",
                          style: TextStyle(
                            fontFamily: "Josefin",
                            fontSize: 23,
                          )),
                      Spacer(),
                      Text(job,
                          style: TextStyle(
                              fontFamily: "Josefin",
                              fontSize: 19,
                              color: Colors.grey))
                    ],
                  ),
                  SizedBox(
                    height: 21,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      height: 50,
                      width: 180,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                                color: Color(0xFF5a20c7).withOpacity(0.7),
                                offset: Offset(0, 3),
                                blurRadius: 7)
                          ]),
                      child: Center(
                          child: Text("Go back to the list",
                              style: TextStyle(
                                  fontFamily: "Josefin",
                                  fontSize: 18,
                                  color: Color(0xFF5a20c7)))),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
