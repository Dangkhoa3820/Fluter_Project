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
  var items = [ 'Blue', 'Red', 'Yellow'];
  String dropdownvalue1 = 'Blue';
  String dropdownvalue2 = 'Red';
  String dropdownvalue3 = 'Yellow';
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
          Column(mainAxisAlignment: MainAxisAlignment.start, children: [
        Expanded(
          flex: 4,
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
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children:[
                      Container(
                        margin: EdgeInsets.only(bottom: 10),
                        padding: EdgeInsets.all(0),
                        child: new Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Column(
                                children: [
                                  Text('Motor'),
                                  Container(
                                    padding: EdgeInsets.only(right: 4),
                                    child: Icon(
                                      Auto
                                          ? Icons.circle_rounded
                                          : Icons.circle_outlined,
                                      color: Auto
                                          ? Color.fromARGB(255, 226, 137, 4)
                                          : Colors.grey,
                                      size: 44,
                                    ),
                                  )
                                ],
                              ),
                              Column(
                                children: [
                                  Text('Alarm      ',),
                                  Container(
                                    padding: EdgeInsets.only(right: 25),
                                    child: Icon(
                                      Man
                                          ? Icons.circle_rounded
                                          : Icons.circle_outlined,
                                      color: Man
                                          ? Color.fromARGB(255, 16, 190, 39)
                                          : Colors.grey,
                                      size: 44,
                                    ),
                                  )
                                ],
                              ),
                              Column(
                                children: [
                                  Text('Pos 1'),
                                  Container(
                                    padding: EdgeInsets.only(right: 4),
                                    child: Icon(
                                      Man
                                          ? Icons.circle_rounded
                                          : Icons.circle_outlined,
                                      color: Man
                                          ? Color.fromARGB(255, 16, 190, 39)
                                          : Colors.grey,
                                      size: 44,
                                    ),
                                  )
                                ],
                              ),
                              Column(
                                children: [
                                  Text('Pos 2'),
                                  Container(
                                    padding: EdgeInsets.only(right: 4),
                                    child: Icon(
                                      Man
                                          ? Icons.circle_rounded
                                          : Icons.circle_outlined,
                                      color: Man
                                          ? Color.fromARGB(255, 16, 190, 39)
                                          : Colors.grey,
                                      size: 44,
                                    ),
                                  )
                                ],
                              ),
                               Column(
                                children: [
                                  Text('Pos 3       '),
                                  Container(
                                    padding: EdgeInsets.only(right: 30),
                                    child: Icon(
                                      Man
                                          ? Icons.circle_rounded
                                          : Icons.circle_outlined,
                                      color: Man
                                          ? Color.fromARGB(255, 16, 190, 39)
                                          : Colors.grey,
                                      size: 44,
                                    ),
                                  )
                                ],
                              ),
                              Column(
                                children: [
                                  RichText(text: new TextSpan(
                                      children: [
                                         WidgetSpan(child: Icon(Icons.camera, size: 15, color: Color.fromARGB(255, 185, 197, 20),), 
                                        ),
                                        TextSpan(
                                          text: 'Camera: '
                                        ),
                                      ],
                                     ),
                                    ),
                                  Container(
                                    child: Center(
                                      child: Text('null', style: TextStyle(color: Colors.black),),
                                    ),
                                    width: 70,
                                    height: 35,
                                    margin: EdgeInsets.only(top: 4),
                                    decoration: BoxDecoration(
                                      color: Color.fromARGB(255, 84, 92, 92).withOpacity(0.3),
                                      shape: BoxShape.rectangle,
                                    ),
                                  )
                                ],
                              )
                            ]
                          ),
                      ),
                    new Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                         Container(
                           margin: EdgeInsets.only(right: 18),
                           child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  RichText(
                                    text: new TextSpan(
                                      children: [
                                         WidgetSpan(child: Icon(Icons.note_alt_outlined, size: 18, color: Color.fromARGB(255, 7, 148, 136),), 
                                        ),
                                        TextSpan(
                                          text: 'Color Pos 1: '
                                        ),
                                      ],
                                     ),
                                    ),
                                    Container(
                                        child: DropdownButton(
                                          style: TextStyle(
                                            fontSize: 13,
                                            color: (dropdownvalue1=='Blue')?Colors.blue
                                                 :(dropdownvalue1 == 'Red')? Colors.red
                                                 :(dropdownvalue1 == 'Yellow')? Colors.yellow: Colors.grey
                                                 ),
                                          value: dropdownvalue1,
                                          icon: Icon(Icons.keyboard_arrow_down),
                                          items: items.map((String items) {
                                            return DropdownMenuItem(
                                                value: items, child: Text(items));
                                          }).toList(),
                                          onChanged: (String? NewValue) {
                                            setState(() {
                                              dropdownvalue1 = NewValue!;
                                            });
                                          },
                                        ),
                                      ),
                                    ],                                
                              ),
                            ),
                           Container(
                             margin: EdgeInsets.only(right: 18),
                             child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                 RichText(
                                    text: new TextSpan(
                                      children: [
                                         WidgetSpan(child: Icon(Icons.note_alt_outlined, size: 18,color: Color.fromARGB(255, 7, 148, 136)), 
                                        ),
                                        TextSpan(
                                          text: 'Color Pos 2: '
                                        ),
                                      ],
                                     ),
                                    ),
                                  Container(
                                    margin: EdgeInsets.all(0),
                                    padding: EdgeInsets.all(0),                                                            
                                    child: DropdownButton(
                                      style: TextStyle(
                                        fontSize: 13,
                                        color: (dropdownvalue2=='Blue')?Colors.blue
                                                 :(dropdownvalue2 == 'Red')? Colors.red
                                                 :(dropdownvalue2 == 'Yellow')? Colors.yellow: Colors.grey
                                                 ),
                                      value: dropdownvalue2,
                                      icon: Icon(Icons.keyboard_arrow_down),
                                      items: items.map((String items) {
                                        return DropdownMenuItem(
                                            value: items, child: Text(items));
                                      }).toList(),
                                      onChanged: (String? NewValue) {
                                        setState(() {
                                          dropdownvalue2 = NewValue!;
                                        });
                                      },
                                    ),
                                  ),
                                ],
                              ),
                           ),
                           Container(
                             margin: EdgeInsets.only(right: 2),
                             child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  RichText(
                                    text: new TextSpan(
                                      children: [
                                         WidgetSpan(child: Icon(Icons.note_alt_outlined, size: 18,color: Color.fromARGB(255, 7, 148, 136)), 
                                        ),
                                        TextSpan(
                                          text: 'Color Pos 3: '
                                        ),
                                      ],
                                     ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.all(0),
                                    padding: EdgeInsets.all(0),
                                    child: DropdownButton(                             
                                      style: TextStyle(
                                        fontSize: 13,
                                        color: (dropdownvalue3=='Blue')?Colors.blue
                                                 :(dropdownvalue3 == 'Red')? Colors.red
                                                 :(dropdownvalue3 == 'Yellow')? Colors.yellow: Colors.grey
                                                 ),
                                      value: dropdownvalue3,
                                      icon: Icon(Icons.keyboard_arrow_down),
                                      items: items.map((String items) {
                                        return DropdownMenuItem(
                                            value: items, child: Text(items));
                                      }).toList(),
                                      onChanged: (String? NewValue) {
                                        setState(() {
                                          dropdownvalue3 = NewValue!;
                                        });
                                      },
                                    ),
                                  ),
                                ],
                              ),
                           ),
                    ],
                  )
                    ],
                  ), 
                ],
              ),
            ),
          ),
        ),
        // Auto/Man
        Expanded(
          flex: 7,
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  height: 400,
                  width: 400,
                  margin: EdgeInsets.only(right: 3),
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
                                        color: Color.fromARGB(255, 95, 93, 248),
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
                                        color: Color.fromARGB(255, 238, 136, 2),
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
                                          color:
                                              Color.fromARGB(255, 247, 64, 64),
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
                  margin: EdgeInsets.only(left: 3),
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
                    margin: EdgeInsets.all(8),
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
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        side: BorderSide(
                                          color:
                                              Color.fromARGB(255, 247, 164, 11)
                                                  .withOpacity(0.7),
                                          width: 2,
                                          style: BorderStyle.solid,
                                        ),
                                      ),
                                      padding: EdgeInsets.all(10),
                                      primary: Color.fromARGB(255, 66, 66, 66),
                                      onPrimary:
                                          Color.fromARGB(255, 0, 132, 240),
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
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        side: BorderSide(
                                          color:
                                              Color.fromARGB(255, 247, 164, 11)
                                                  .withOpacity(0.7),
                                          width: 2,
                                          style: BorderStyle.solid,
                                        ),
                                      ),
                                      padding: EdgeInsets.all(10),
                                      primary: Color.fromARGB(255, 66, 66, 66),
                                      onPrimary:
                                          Color.fromARGB(255, 0, 132, 240),
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
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        side: BorderSide(
                                          color:
                                              Color.fromARGB(255, 247, 164, 11)
                                                  .withOpacity(0.7),
                                          width: 2,
                                          style: BorderStyle.solid,
                                        ),
                                      ),
                                      padding: EdgeInsets.all(10),
                                      primary: Color.fromARGB(255, 66, 66, 66),
                                      onPrimary:
                                          Color.fromARGB(255, 0, 132, 240),
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
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        side: BorderSide(
                                          color:
                                              Color.fromARGB(255, 247, 164, 11)
                                                  .withOpacity(0.7),
                                          width: 2,
                                          style: BorderStyle.solid,
                                        ),
                                      ),
                                      padding: EdgeInsets.all(10),
                                      primary: Color.fromARGB(255, 66, 66, 66),
                                      onPrimary:
                                          Color.fromARGB(255, 0, 132, 240),
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
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        side: BorderSide(
                                          color:
                                              Color.fromARGB(255, 247, 164, 11)
                                                  .withOpacity(0.7),
                                          width: 2,
                                          style: BorderStyle.solid,
                                        ),
                                      ),
                                      padding: EdgeInsets.all(10),
                                      primary: Color.fromARGB(255, 66, 66, 66),
                                      onPrimary:
                                          Color.fromARGB(255, 0, 132, 240),
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
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        side: BorderSide(
                                          color:
                                              Color.fromARGB(255, 247, 164, 11)
                                                  .withOpacity(0.7),
                                          width: 2,
                                          style: BorderStyle.solid,
                                        ),
                                      ),
                                      padding: EdgeInsets.all(10),
                                      primary: Color.fromARGB(255, 66, 66, 66),
                                      onPrimary:
                                          Color.fromARGB(255, 0, 132, 240),
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
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        side: BorderSide(
                                          color:
                                              Color.fromARGB(255, 247, 164, 11)
                                                  .withOpacity(0.7),
                                          width: 2,
                                          style: BorderStyle.solid,
                                        ),
                                      ),
                                      padding: EdgeInsets.all(10),
                                      primary: Color.fromARGB(255, 66, 66, 66),
                                      onPrimary:
                                          Color.fromARGB(255, 0, 132, 240),
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
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        side: BorderSide(
                                          color:
                                              Color.fromARGB(255, 247, 164, 11)
                                                  .withOpacity(0.7),
                                          width: 2,
                                          style: BorderStyle.solid,
                                        ),
                                      ),
                                      padding: EdgeInsets.all(10),
                                      primary: Color.fromARGB(255, 66, 66, 66),
                                      onPrimary:
                                          Color.fromARGB(255, 0, 132, 240),
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
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        side: BorderSide(
                                          color:
                                              Color.fromARGB(255, 247, 164, 11)
                                                  .withOpacity(0.7),
                                          width: 2,
                                          style: BorderStyle.solid,
                                        ),
                                      ),
                                      padding: EdgeInsets.all(10),
                                      primary: Color.fromARGB(255, 66, 66, 66),
                                      onPrimary:
                                          Color.fromARGB(255, 0, 132, 240),
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
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        side: BorderSide(
                                          color:
                                              Color.fromARGB(255, 247, 164, 11)
                                                  .withOpacity(0.7),
                                          width: 2,
                                          style: BorderStyle.solid,
                                        ),
                                      ),
                                      padding: EdgeInsets.all(10),
                                      primary: Color.fromARGB(255, 66, 66, 66),
                                      onPrimary:
                                          Color.fromARGB(255, 0, 132, 240),
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
                      color:
                          Color.fromARGB(255, 118, 126, 119).withOpacity(0.5),
                      width: 2,
                    )),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text('QUANTITY',
                        style: TextStyle(
                            fontSize: 18,
                            color: Color.fromARGB(255, 192, 41, 30),
                            fontWeight: FontWeight.bold)),
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
                                child: Text(
                                  SoluongSp1,
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
                                child: Text(
                                  SoluongSp2,
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
                                child: Text(
                                  SoluongSp3,
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                )),
          ),
        ),
      ]),
    );
  }
}
