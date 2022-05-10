import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_application/server/mqtt.dart';
import '../NavBar.dart';
import '../server/variables.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool pressAttention = false;
  @override
  void initState() {
    super.initState();
    pressAttention;
  }

  @override
  Widget build(BuildContext context) {
    //mqttConnect();
    return Scaffold(
      drawer: NavBar(),
      appBar: AppBar(
        title: Text('Dashboard'),
        elevation: 0.0,
        backgroundColor: Color(0xFF212332),
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
      ),
      body:
          // Light
          Column(children: [
        Expanded(
          flex: 3,
          child: Container(
            height: 100,
            margin: EdgeInsets.all(8),
            padding: EdgeInsets.zero,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Color.fromARGB(255, 87, 91, 122).withOpacity(0.15),
            ),
            child: Container(
              height: 80,
              width: 400,
              margin: EdgeInsets.all(8),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: Color.fromARGB(255, 175, 164, 66).withOpacity(0.5),
                    width: 2,
                  )),
            ),
          ),
        ),
        // Auto/Man
        Expanded(
          flex: 6,
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  height: 400,
                  width: 400,
                  margin: EdgeInsets.all(0.5),
                  padding: EdgeInsets.zero,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color.fromARGB(255, 87, 91, 122).withOpacity(0.15),
                  ),
                  //--------------------------------------------------------------------------------------------------
                  //Auto
                  child: Container(
                    height: 300,
                    width: 400,
                    margin: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: Color.fromARGB(255, 81, 201, 181)
                              .withOpacity(0.5),
                          width: 2,
                        )),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              'AUTO',
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Color.fromARGB(255, 238, 235, 235)),
                            ),
                            Switch(
                              value: Auto,
                              onChanged: (value) {
                                setState(() {
                                  Auto = value;
                                  Man = !value;
                                  if (Auto == true) {
                                    mqttSubscribe(topic: 'auto');
                                  }
                                });
                              },
                              activeTrackColor: Color.fromRGBO(201, 96, 10, 1),
                              activeColor: Color.fromARGB(255, 243, 245, 243),
                            ),
                          ],
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 15.0),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                ElevatedButton(
                                  child: Text(
                                    'Start',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  onPressed: () {
                                    mqttSubscribe(topic: 'start');
                                  },
                                  style: ElevatedButton.styleFrom(
                                    shape: CircleBorder(
                                      side: BorderSide(
                                        color:
                                            Color.fromARGB(255, 95, 93, 248),
                                        width: 2,
                                        style: BorderStyle.solid,
                                      ),
                                    ),
                                    padding: EdgeInsets.all(20),
                                    primary: Color.fromARGB(255, 66, 66, 66),
                                    onPrimary: Color.fromARGB(255, 0, 132, 240),
                                  ),
                                ),
                                ElevatedButton(
                                  child: Text(
                                    'Stop',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  onPressed: () {
                                    mqttSubscribe(topic: 'stop');
                                  },
                                  style: ElevatedButton.styleFrom(
                                    shape: CircleBorder(
                                      side: BorderSide(
                                        color:
                                            Color.fromARGB(255, 238, 136, 2),
                                        width: 2,
                                        style: BorderStyle.solid,
                                      ),
                                    ),
                                    padding: EdgeInsets.all(20),
                                    primary: Color.fromARGB(255, 66, 66, 66),
                                    onPrimary: Color.fromARGB(255, 245, 241, 6),
                                  ),
                                ),
                              ]),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 15.0),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                ElevatedButton(
                                  child: Text(
                                    'Reset',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  onPressed: () {
                                    mqttSubscribe(topic: 'reset');
                                  },
                                  style: ElevatedButton.styleFrom(
                                    shape: CircleBorder(
                                      side: BorderSide(
                                        color:
                                            Color.fromARGB(255, 158, 243, 48),
                                        width: 2,
                                        style: BorderStyle.solid,
                                      ),
                                    ),
                                    padding: EdgeInsets.all(20),
                                    primary: Color.fromARGB(255, 66, 66, 66),
                                    onPrimary:
                                        Color.fromARGB(255, 54, 241, 110),
                                  ),
                                ),
                                ElevatedButton(
                                    child: Text(
                                      'Emer',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    style: ElevatedButton.styleFrom(
                                      shape: CircleBorder(
                                        side: BorderSide(
                                          color: Color.fromARGB(255, 247, 64, 64),
                                          width: 2,
                                          style: BorderStyle.solid,
                                        ),
                                      ),
                                      padding: EdgeInsets.all(20),
                                      primary: (pressAttention == true)
                                          ? Color.fromARGB(255, 241, 1, 1)
                                          : Color.fromARGB(255, 66, 66, 66),
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        pressAttention = !pressAttention;
                                      });
                                      if (pressAttention) {
                                        mqttSubscribe(topic: 'emer_on');
                                      } else {
                                        mqttSubscribe(topic: 'emer_off');
                                      }
                                    }),
                              ]),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  height: 400,
                  width: 400,
                  margin: EdgeInsets.all(0.5),
                  padding: EdgeInsets.zero,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color.fromARGB(255, 87, 91, 122).withOpacity(0.15),
                  ),
                  //--------------------------------------------------------------------------------------------------
                  //Man
                  child: Container(
                    height: 400,
                    width: 400,
                    margin: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color:
                              Color.fromARGB(255, 68, 184, 78).withOpacity(0.5),
                          width: 2,
                        )),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              'MAN',
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Color.fromARGB(255, 238, 235, 235)),
                            ),
                            Switch(
                              value: Man,
                              onChanged: (value) {
                                setState(() {
                                  Auto = !value;
                                  Man = value;
                                  if (Man == true) {
                                    mqttSubscribe(topic: 'man');
                                  }
                                });
                              },
                              activeTrackColor: Color.fromARGB(255, 25, 228, 7),
                              activeColor: Color.fromARGB(255, 243, 245, 243),
                            ),
                          ],
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 5.0),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SizedBox(
                                  width: 82,
                                  height: 36,
                                  child: ElevatedButton(
                                    child: Text(
                                      'Motor On',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    onPressed: () {
                                      mqttSubscribe(topic: 'motor_on');
                                    },
                                    style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10.0),
                                        side: BorderSide(
                                          color:
                                              Color.fromARGB(255, 247, 164, 11).withOpacity(0.7),
                                          width: 2,
                                          style: BorderStyle.solid,
                                        ),
                                      ),
                                      padding: EdgeInsets.all(10),
                                      primary: Color.fromARGB(255, 66, 66, 66),
                                      onPrimary: Color.fromARGB(255, 0, 132, 240),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 82,
                                  height: 36,
                                  child: ElevatedButton(
                                    child: Text(
                                      'Motor Off',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    onPressed: () {
                                      mqttSubscribe(topic: 'motor_off');
                                    },
                                    style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10.0),
                                        side: BorderSide(
                                          color:
                                              Color.fromARGB(255, 247, 164, 11).withOpacity(0.7),
                                          width: 2,
                                          style: BorderStyle.solid,
                                        ),
                                      ),
                                      padding: EdgeInsets.all(10),
                                      primary: Color.fromARGB(255, 66, 66, 66),
                                      onPrimary: Color.fromARGB(255, 0, 132, 240),
                                    ),
                                  ),
                                ),
                              ]),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 5.0),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SizedBox(
                                  width: 82,
                                  height: 36,
                                  child: ElevatedButton(
                                    child: Text(
                                      'Push Out',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    onPressed: () {
                                      mqttSubscribe(topic: 'push_out');
                                    },
                                    style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10.0),
                                        side: BorderSide(
                                          color:
                                              Color.fromARGB(255, 247, 164, 11).withOpacity(0.7),
                                          width: 2,
                                          style: BorderStyle.solid,
                                        ),
                                      ),
                                      padding: EdgeInsets.all(10),
                                      primary: Color.fromARGB(255, 66, 66, 66),
                                      onPrimary: Color.fromARGB(255, 0, 132, 240),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  child: ElevatedButton(
                                    child: Text(
                                      'Push Back',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10.0),
                                        side: BorderSide(
                                          color:
                                              Color.fromARGB(255, 247, 164, 11).withOpacity(0.7),
                                          width: 2,
                                          style: BorderStyle.solid,
                                        ),
                                      ),
                                      padding: EdgeInsets.all(10),
                                      primary: Color.fromARGB(255, 66, 66, 66),
                                      onPrimary: Color.fromARGB(255, 0, 132, 240),
                                    ),
                                    onPressed: () {
                                      mqttSubscribe(topic: 'push_back');
                                    },
                                  ),
                                ),
                              ]),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 5.0),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SizedBox(
                                  width: 82,
                                  height: 36,
                                  child: ElevatedButton(
                                    child: Text(
                                      'Lift up',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    onPressed: () {
                                      mqttSubscribe(topic: 'lift_up');
                                    },
                                    style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10.0),
                                        side: BorderSide(
                                          color:
                                              Color.fromARGB(255, 247, 164, 11).withOpacity(0.7),
                                          width: 2,
                                          style: BorderStyle.solid,
                                        ),
                                      ),
                                      padding: EdgeInsets.all(10),
                                      primary: Color.fromARGB(255, 66, 66, 66),
                                      onPrimary: Color.fromARGB(255, 0, 132, 240),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 82,
                                  height: 36,
                                  child: ElevatedButton(
                                    child: Text(
                                      'Lift down',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10.0),
                                        side: BorderSide(
                                          color:
                                              Color.fromARGB(255, 247, 164, 11).withOpacity(0.7),
                                          width: 2,
                                          style: BorderStyle.solid,
                                        ),
                                      ),
                                      padding: EdgeInsets.all(10),
                                      primary: Color.fromARGB(255, 66, 66, 66),
                                      onPrimary: Color.fromARGB(255, 0, 132, 240),
                                    ),
                                    onPressed: () {
                                      mqttSubscribe(topic: 'lift_down');
                                    },
                                  ),
                                ),
                              ]),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 10.0),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SizedBox(
                                  width: 82,
                                  height: 36,
                                  child: ElevatedButton(
                                    child: Text(
                                      'Go Out',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    onPressed: () {
                                      mqttSubscribe(topic: 'go_out');
                                    },
                                    style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10.0),
                                        side: BorderSide(
                                          color:
                                              Color.fromARGB(255, 247, 164, 11).withOpacity(0.7),
                                          width: 2,
                                          style: BorderStyle.solid,
                                        ),
                                      ),
                                      padding: EdgeInsets.all(10),
                                      primary: Color.fromARGB(255, 66, 66, 66),
                                      onPrimary: Color.fromARGB(255, 0, 132, 240),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 82,
                                  height: 36,
                                  child: ElevatedButton(
                                    child: Text(
                                      'Go Back',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10.0),
                                        side: BorderSide(
                                          color:
                                              Color.fromARGB(255, 247, 164, 11).withOpacity(0.7),
                                          width: 2,
                                          style: BorderStyle.solid,
                                        ),
                                      ),
                                      padding: EdgeInsets.all(10),
                                      primary: Color.fromARGB(255, 66, 66, 66),
                                      onPrimary: Color.fromARGB(255, 0, 132, 240),
                                    ),
                                    onPressed: () {
                                      mqttSubscribe(topic: 'go_back');
                                    },
                                  ),
                                ),
                              ]),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 10.0),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SizedBox(
                                  width: 82,
                                  height: 36,
                                  child: ElevatedButton(
                                    child: Text(
                                      'Hold on',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    onPressed: () {
                                      mqttSubscribe(topic: 'hold_on');
                                    },
                                    style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10.0),
                                        side: BorderSide(
                                          color:
                                              Color.fromARGB(255, 247, 164, 11).withOpacity(0.7),
                                          width: 2,
                                          style: BorderStyle.solid,
                                        ),
                                      ),
                                      padding: EdgeInsets.all(10),
                                      primary: Color.fromARGB(255, 66, 66, 66),
                                      onPrimary: Color.fromARGB(255, 0, 132, 240),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 82,
                                  height: 36,
                                  child: ElevatedButton(
                                    child: Text(
                                      'Hold Off',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10.0),
                                        side: BorderSide(
                                          color:
                                              Color.fromARGB(255, 247, 164, 11).withOpacity(0.7),
                                          width: 2,
                                          style: BorderStyle.solid,
                                        ),
                                      ),
                                      padding: EdgeInsets.all(10),
                                      primary: Color.fromARGB(255, 66, 66, 66),
                                      onPrimary: Color.fromARGB(255, 0, 132, 240),
                                    ),
                                    onPressed: () {
                                      mqttSubscribe(topic: 'hold_off');
                                    },
                                  ),
                                ),
                              ]),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        // soluongsp
        Expanded(
          flex: 3,
          child: Container(
            width: 400,
            height: 100,
            margin: EdgeInsets.all(8),
            padding: EdgeInsets.zero,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Color.fromARGB(255, 87, 91, 122).withOpacity(0.15),
            ),
            child: Container(
              height: 80,
              width: 400,
              margin: EdgeInsets.all(8),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: Color.fromARGB(255, 118, 126, 119).withOpacity(0.5),
                    width: 2,
                  )
                ),
              child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text('QUANTITY', 
                  style: 
                    TextStyle(fontSize: 18, color: Color.fromARGB(255, 192, 41, 30),fontWeight: FontWeight.bold ) ),
                new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Text('Product 1'),
                        Container(
                          width: 60,
                          height: 30,
                          margin: EdgeInsets.all(5),
                          padding: EdgeInsets.zero,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 3.0, color: Colors.black),
                              color: Color.fromARGB(255, 185, 191, 196)),
                          child: Center(
                            child: Text(SoluongSp1,
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text('Product 2'),
                        Container(
                          width: 60,
                          height: 30,
                          margin: EdgeInsets.all(5),
                          padding: EdgeInsets.zero,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 3.0, color: Colors.black),
                              color: Color.fromARGB(255, 185, 191, 196)),
                          child: Center(
                            child: Text(SoluongSp2,
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text('Product 3'),
                        Container(
                          width: 60,
                          height: 30,
                          margin: EdgeInsets.all(5),
                          padding: EdgeInsets.zero,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 3.0, color: Colors.black),
                              color: Color.fromARGB(255, 185, 191, 196)),
                          child: Center(
                            child: Text(SoluongSp3,
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                )
              ],
            )
            ),
          ),
        ),
      ]),
    );
  }
}
