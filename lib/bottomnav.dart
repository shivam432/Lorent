import 'package:LoRent/caution.dart';

import 'remind.dart';
import 'tenants.dart';
import 'userFunction.dart';
import 'profile.dart';
import 'package:flutter/material.dart';
import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import 'package:outline_material_icons/outline_material_icons.dart';

class Bottom extends StatefulWidget {
  @override
  _BottomState createState() => _BottomState();
}

List<Widget> screen = [
  Profile(userId: uid),
  Tenants(
    userId: uid,
  ),
  Alert(userId: uid)
];

class _BottomState extends State<Bottom> {
  int currentPage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screen[currentPage],
      bottomNavigationBar: FancyBottomNavigation(
        circleColor: Color(0xFF5a20c7),
        inactiveIconColor: Color(0xFF5a20c7),
        tabs: [
          TabData(iconData: OMIcons.home, title: "Home"),
          TabData(iconData: OMIcons.people, title: "Tenants"),
          TabData(iconData: OMIcons.bubbleChart, title: "Remind"),
        ],
        onTabChangedListener: (position) {
          setState(() {
            currentPage = position;
          });
        },
      ),
    );
  }
}
