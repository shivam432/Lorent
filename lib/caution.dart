import 'package:LoRent/remind.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Alert extends StatefulWidget {
  final userId;
  Alert({this.userId});
  @override
  _AlertState createState() => _AlertState();
}

class _AlertState extends State<Alert> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xFF5a20c7),
        title: Text("Alert",
            style: TextStyle(
              fontFamily: "Josefin",
              fontSize: 25,
            )),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.only(top: 80, left: 10, right: 5),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Icon(
                  Icons.error,
                  color: Colors.red,
                ),
                SizedBox(width: 11),
                Expanded(
                    child: Text(
                  "Select the Reminder Type you want to notify your Tenant and select whatsApp or Text Message.\n\n" +
                      "The App automatically identifies the number and sends the Message.\n\n" +
                      "Note - Do not close the WhatsApp when the App sends a message.\n\n" +
                      "!! Lo Rent is not responsible if there's a mistake created by user while notifying Tenants. !! ",
                  style: TextStyle(
                      color: Colors.black, fontSize: 19, fontFamily: "Josefin"),
                )),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          CupertinoPageRoute(
                              builder: (BuildContext context) => Remind(
                                    userId: widget.userId,
                                  )));
                    },
                    child: Text(
                      "Proceed",
                      style: TextStyle(fontSize: 20),
                    )),
              ],
            )
          ],
        ),
      ),
    );
  }
}
