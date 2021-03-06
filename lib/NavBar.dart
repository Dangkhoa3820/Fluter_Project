import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_application/pages/Alarms_page.dart';
import 'package:flutter_application/pages/History_page.dart';
import 'package:flutter_application/pages/Home_page.dart';
import 'package:flutter_application/pages/Login_page.dart';
import 'package:flutter_application/pages/Settings_page.dart';
import 'package:flutter_application/services/variables.dart';

class NavBar extends StatefulWidget {
  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
      padding: EdgeInsets.zero,
      children: [
        UserAccountsDrawerHeader(
          accountName: Text('Admin'),
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
        Divider(),
        ListTile(
          leading: Icon(Icons.exit_to_app),
          title: Text('Exit'),
          onTap: () => selectedItem(context, 3),
        ),
      ],
    ));
  }

  void selectedItem(BuildContext context, int index) {
    switch (index) {
      case 0:
        if (Login == true) {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => MyHomePage(),
          ));
        } else {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => LoginPage(),
          ));
        }
        break;
      case 1:
        if (Login == true) {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => History(),
          ));
        } else {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => LoginPage(),
          ));
        }
        break;
      case 2:
        if (Login == true) {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => Alarms(),
          ));
        }
        else{
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => LoginPage(),
          ));
        }
        break;
      case 3:
        setState(() {
          Login = false;
        });
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => LoginPage(),
        ));
        break;
    }
  }
}
