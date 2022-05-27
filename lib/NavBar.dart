import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_application/pages/Alarms_page.dart';
import 'package:flutter_application/pages/History_page.dart';
import 'package:flutter_application/pages/Home_page.dart';
import 'package:flutter_application/pages/Settings_page.dart';
import 'package:flutter_application/services/variables.dart';

class NavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
      padding: EdgeInsets.zero,
      children: [
        UserAccountsDrawerHeader(
          accountName: Text('IoT Solution'),
          accountEmail: Text('@hcmut.edu.vn'),
          currentAccountPicture: CircleAvatar(
            child: ClipOval(
              child: Image.asset(
                'assets/images/hcmut_logo.png',
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              ),
            ),
          ),
          decoration: BoxDecoration(
            color: Colors.blue,
            image: DecorationImage(
              image: AssetImage('assets/images/mountain.jpg'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        ListTile(
          leading: Icon(Icons.home),
          title: Text('Home'),
          onTap: () => selectedItem(context, 0),
        ),
        ListTile(
          leading: Icon(Icons.history),
          title: Text('History'),
          onTap: () => selectedItem(context, 1),
        ),
        Divider(),
        ListTile(
          leading: Icon(Icons.notification_add),
          title: Text('Alarms'),
          onTap: () => selectedItem(context, 2),
        ),
        ListTile(
          leading: Icon(Icons.settings),
          title: Text('Settings'),
          onTap: () => selectedItem(context, 3),
        ),
        Divider(),
        ListTile(
          leading: Icon(Icons.exit_to_app),
          title: Text('Exit'),
          onTap: () => null,
        ),
      ],
    ));
  }

  void selectedItem(BuildContext context, int index) {
    switch (index) {
      case 0:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => MyHomePage(),
        ));
        break;
      case 1:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => History(),
        ));
        break;
      case 2:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => Alarms(),
        ));       
        break;
      case 3:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => Settings(),
        ));
        break;
    }
  }
}
