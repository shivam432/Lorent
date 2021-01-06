import 'package:cloud_firestore/cloud_firestore.dart';
import 'bottomnav.dart';
import 'userFunction.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'authFunc.dart';
import 'userDetails.dart';

class Sign extends StatefulWidget {
  String tag;
  Sign({Key key, @required this.tag}) : super(key: key);
  @override
  _SignState createState() => _SignState();
}

TextEditingController mob = new TextEditingController();
TextEditingController code1 = new TextEditingController();
TextEditingController code2 = new TextEditingController();
TextEditingController code3 = new TextEditingController();
TextEditingController code4 = new TextEditingController();
TextEditingController code5 = new TextEditingController();
TextEditingController code6 = new TextEditingController();

class _SignState extends State<Sign> {
  Widget otpF(BuildContext context, TextEditingController controller,
      FocusNode currentNode, FocusNode nextNode) {
    return Container(
      height: 50.0,
      width: 30,
      decoration: BoxDecoration(
          border:
              Border(bottom: BorderSide(color: Color(0xFF5a20c7), width: 2.0))),
      child: Center(
        child: TextField(
          focusNode: currentNode,
          onChanged: (value) {
            if (controller.text.length == 0) {
              setState(() {});
            } else if (currentNode != f6) {
              FocusScope.of(context).requestFocus(nextNode);
            }
          },
          maxLength: 1,
          keyboardType: TextInputType.number,
          style: TextStyle(fontSize: 30.0, fontFamily: "Quicksand"),
          controller: controller,
          decoration:
              InputDecoration(counterText: "", border: InputBorder.none),
        ),
      ),
    );
  }

  bool foundUser = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: <Widget>[
              Positioned(
                left: -120,
                top: -100,
                child: Image.asset(
                  "assets/bg1.png",
                  color: Color(0xFF5a20c7),
                  scale: 2,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 100),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.only(left: 30.0),
                      child: Column(
                        children: <Widget>[
                          Text(
                            "Welcome",
                            style: TextStyle(
                                fontSize: 50.0,
                                fontFamily: "LobsterTwo",
                                color: Colors.white),
                          ),
                          Text(
                            "to LoRent",
                            style: TextStyle(
                                fontSize: 40.0,
                                fontFamily: "LobsterTwo",
                                color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: SizedBox(
                          // height: 100,
                          ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width - 80,
                      decoration: BoxDecoration(
                          // border: Border(
                          //     bottom: BorderSide(
                          //         color: Color(0xFF1165C1), width: 2.0))
                          ),
                      child: TextField(
                        maxLength: 10,
                        keyboardType: TextInputType.number,
                        // textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20.0,
                          fontFamily: "Josefin",
                        ),
                        controller: mob,
                        decoration: InputDecoration(
                          counterText: "",
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: Color(0xFF5a20c7), width: 2.0),
                          ),
                          border: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.grey, width: 2.0),
                          ),
                          hintStyle: TextStyle(
                            fontSize: 20.0,
                            fontFamily: "Josefin",
                          ),
                          // border: InputBorder.none,
                          hintText: "Mobile Number",
                          suffixIcon: Icon(
                            Icons.phone,
                            color: Color(0xFF5a20c7),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 70,
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 35.0),
                        child: GestureDetector(
                          onTap: () async {
                            code1.clear();
                            code2.clear();
                            code3.clear();
                            code4.clear();
                            code5.clear();
                            code6.clear();
                            FirebaseAuth.instance.verifyPhoneNumber(
                              codeAutoRetrievalTimeout: (a) {
                                print(a);
                              },
                              timeout: Duration(seconds: 60),
                              phoneNumber: ("+91" + mob.text),
                              verificationCompleted:
                                  (PhoneAuthCredential authCredential) =>
                                      verificationCompleted(
                                          context, authCredential),
                              verificationFailed:
                                  (FirebaseAuthException exception) =>
                                      verificationFailed(exception),
                              codeSent: (String verificationId,
                                  [int forceResendingToken]) {
                                showModalBottomSheet(
                                    backgroundColor: Colors.white,
                                    isScrollControlled: true,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(15.0),
                                            topRight: Radius.circular(15.0))),
                                    context: context,
                                    builder: (BuildContext contex) {
                                      return StatefulBuilder(builder:
                                          (BuildContext context,
                                              StateSetter setState) {
                                        return Padding(
                                          padding:
                                              MediaQuery.of(context).viewInsets,
                                          child: Container(
                                            height: 300,
                                            padding: EdgeInsets.only(
                                                right: 20.0,
                                                left: 20.0,
                                                top: 30.0),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  children: <Widget>[
                                                    Text(
                                                      "Enter OTP",
                                                      style: TextStyle(
                                                          fontSize: 30.0,
                                                          fontFamily:
                                                              "Josefin"),
                                                    ),
                                                    Spacer(),
                                                    Image.asset(
                                                      "assets/app_icon.png",
                                                      width: 70.0,
                                                    )
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 50.0,
                                                ),
                                                Align(
                                                    alignment: Alignment.center,
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        otpF(context, code1, f1,
                                                            f2),
                                                        SizedBox(
                                                          width: 10.0,
                                                        ),
                                                        otpF(context, code2, f2,
                                                            f3),
                                                        SizedBox(
                                                          width: 10.0,
                                                        ),
                                                        otpF(context, code3, f3,
                                                            f4),
                                                        SizedBox(
                                                          width: 10.0,
                                                        ),
                                                        otpF(context, code4, f4,
                                                            f5),
                                                        SizedBox(
                                                          width: 10.0,
                                                        ),
                                                        otpF(context, code5, f5,
                                                            f6),
                                                        SizedBox(
                                                          width: 10.0,
                                                        ),
                                                        otpF(context, code6, f6,
                                                            f1),
                                                      ],
                                                    )),
                                                Expanded(
                                                  child: SizedBox(
                                                      // height: 30.0,
                                                      ),
                                                ),
                                                GestureDetector(
                                                  onTap: () async {
                                                    mob.clear();
                                                    AuthCredential credential =
                                                        PhoneAuthProvider
                                                            .credential(
                                                                verificationId:
                                                                    verificationId,
                                                                smsCode: (code1
                                                                        .text +
                                                                    code2.text +
                                                                    code3.text +
                                                                    code4.text +
                                                                    code5.text +
                                                                    code6
                                                                        .text));
                                                    UserCredential user =
                                                        await FirebaseAuth
                                                            .instance
                                                            .signInWithCredential(
                                                                credential);

                                                    DocumentSnapshot snap =
                                                        await FirebaseFirestore
                                                            .instance
                                                            .collection("users")
                                                            .doc(user.user.uid)
                                                            .get();
                                                    if (snap.data() == null) {
                                                      uid = user.user.uid;
                                                      print(user.user.uid);
                                                      Navigator
                                                          .pushAndRemoveUntil(
                                                              context,
                                                              CupertinoPageRoute(
                                                                  builder:
                                                                      (context) =>
                                                                          Details(
                                                                            user:
                                                                                user.user,
                                                                          )),
                                                              (route) => false);
                                                    } else {
                                                      uid = user.user.uid;
                                                      Navigator.pushAndRemoveUntil(
                                                          context,
                                                          CupertinoPageRoute(
                                                              builder:
                                                                  (context) =>
                                                                      Bottom()),
                                                          (route) => false);
                                                    }
                                                  },
                                                  child: Container(
                                                    width: 70.0,
                                                    height: 70.0,
                                                    decoration: BoxDecoration(
                                                        // color: Color(0xFF1165C1),
                                                        gradient: LinearGradient(
                                                            colors: [
                                                              Color(0xFF5a20c7),
                                                              Color(0xFF5a20c7)
                                                            ],
                                                            begin: Alignment
                                                                .topLeft,
                                                            end: Alignment
                                                                .bottomRight),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                    50.0)),
                                                    child: Center(
                                                      child: Icon(
                                                        Icons.arrow_forward_ios,
                                                        color: Colors.white,
                                                        size: 30.0,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 20.0,
                                                )
                                              ],
                                            ),
                                          ),
                                        );
                                      });
                                    });
                              },
                            );
                          },
                          child: Hero(
                            tag: widget.tag,
                            child: Container(
                              width: 70.0,
                              height: 70.0,
                              decoration: BoxDecoration(
                                  // color: Color(0xFF1165C1),
                                  gradient: LinearGradient(
                                      colors: [
                                        Color(0xFF5a20c7),
                                        Color(0xFF5a20c7)
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
                      height: 70.0,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

final f1 = FocusNode();
final f2 = FocusNode();
final f3 = FocusNode();
final f4 = FocusNode();
final f5 = FocusNode();
final f6 = FocusNode();
