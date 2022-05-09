import 'package:flutter/material.dart';
class AppBarConst extends StatelessWidget {
  @override
    const AppBarConst({
    Key? key,
  }) : super(key: key);

  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0.0,
        backgroundColor:Color(0xFF212332),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications_none),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.person),
            onPressed: () {},
          )
        ],
    );
  }
}