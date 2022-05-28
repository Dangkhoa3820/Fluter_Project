import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_application/pages/Alarms_page.dart';
import 'package:flutter_application/services/mqtt.dart';
import 'package:flutter_application/services/thaotac.dart';
import '../NavBar.dart';
import '../services/variables.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool pressAttention = false;
  var items = ['Blue', 'Red', 'Yellow', 'Black', 'Pink', 'Purple'];
  TextEditingController _product1 = TextEditingController();
  TextEditingController _product2 = TextEditingController();
  TextEditingController _product3 = TextEditingController();

  @override
  void initState() {
    super.initState();
    pressAttention;
  }

  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.red;
      }
      return Colors.blue;
    }
    return Scaffold(
      drawer: NavBar(),
      appBar: AppBar(
        title: Text('Dashboard'),
        elevation: 0.0,
        backgroundColor: Color(0xFF212332),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications_none, 
                  color:(alarm)?Colors.orange:Colors.grey),
            onPressed: () {
              setState(() {
                alarm = false;
              });
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Alarms()),
                );
            },
          ),
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
                    children: [
                      Container(
                        margin: EdgeInsets.only(bottom: 10),
                        padding: EdgeInsets.all(0),
                        child: new Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Column(
                                children: [
                                  Text('Run'),
                                  Container(
                                    padding: EdgeInsets.only(right: 4),
                                    child: Icon(
                                      Run
                                          ? Icons.circle_rounded
                                          : Icons.circle_outlined,
                                      color: Run
                                          ? Color.fromARGB(255, 226, 137, 4)
                                          : Colors.grey,
                                      size: 44,
                                    ),
                                  )
                                ],
                              ),
                              Column(
                                children: [
                                  Text(
                                    'Alarm      ',
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(right: 25),
                                    child: Icon(
                                      alarm
                                          ? Icons.circle_rounded
                                          : Icons.circle_outlined,
                                      color: alarm
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
                                      Pos1
                                          ? Icons.circle_rounded
                                          : Icons.circle_outlined,
                                      color: Pos1
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
                                      Pos2
                                          ? Icons.circle_rounded
                                          : Icons.circle_outlined,
                                      color: Pos2
                                          ? Color.fromARGB(255, 16, 190, 39)
                                          : Colors.grey,
                                      size: 44,
                                    ),
                                  )
                                ],
                              ),
                              Column(
                                children: [
                                  Text('  Pos 3    '),
                                  Container(
                                    padding: EdgeInsets.only(right: 6),
                                    child: Icon(
                                      Pos3
                                          ? Icons.circle_rounded
                                          : Icons.circle_outlined,
                                      color: Pos3
                                          ? Color.fromARGB(255, 16, 190, 39)
                                          : Colors.grey,
                                      size: 44,
                                    ),
                                  )
                                ],
                              ),
                              Column(
                                children: [
                                  RichText(
                                    text: new TextSpan(
                                      children: [
                                        WidgetSpan(
                                          child: Icon(
                                            Icons.camera,
                                            size: 15,
                                            color: Color.fromARGB(
                                                255, 185, 197, 20),
                                          ),
                                        ),
                                        TextSpan(text: 'CAM:'),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    child: Center(
                                      child: Text(
                                        '${camera}',
                                        style: TextStyle(
                                            color: (camera == 'Red')
                                                ? Colors.red
                                                : (camera == 'Blue')
                                                    ? Colors.blue
                                                    : (camera == 'Yellow')
                                                        ? Colors.yellow
                                                        : Colors.grey),
                                      ),
                                    ),
                                    width: 50,
                                    height: 35,
                                    margin: EdgeInsets.only(right: 1),
                                    decoration: BoxDecoration(
                                      color: Color.fromARGB(255, 84, 92, 92)
                                          .withOpacity(0.3),
                                      shape: BoxShape.rectangle,
                                    ),
                                  )
                                ],
                              )
                            ]),
                      ),
                      new Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.only(right: 10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                RichText(
                                  text: new TextSpan(
                                    children: [
                                      WidgetSpan(
                                        child: Icon(
                                          Icons.note_alt_outlined,
                                          size: 18,
                                          color:
                                              Color.fromARGB(255, 7, 148, 136),
                                        ),
                                      ),
                                      TextSpan(
                                          text: 'Color Pos 1: ',
                                          style: TextStyle(
                                            color: (colorIsCheck)
                                                ? null
                                                : Colors.grey.withOpacity(0.5),
                                          )),
                                    ],
                                  ),
                                ),
                                Container(
                                  child: DropdownButton(
                                    style: TextStyle(
                                        fontSize: 13,
                                        color: (dropdownvalue1 == 'Blue')
                                            ? Colors.blue
                                            : (dropdownvalue1 == 'Red')
                                                ? Colors.red
                                                : (dropdownvalue1 == 'Yellow')
                                                    ? Colors.yellow
                                                    : (dropdownvalue1 ==
                                                            'Black')
                                                        ? Colors.black
                                                        : (dropdownvalue1 ==
                                                                'Pink')
                                                            ? Colors.pink
                                                            : (dropdownvalue1 ==
                                                                    'Purple')
                                                                ? Colors.purple
                                                                : Colors.grey),
                                    value: dropdownvalue1,
                                    icon: Icon(Icons.keyboard_arrow_down),
                                    items: items.map((String items) {
                                      return DropdownMenuItem(
                                          value: items, child: Text(items));
                                    }).toList(),
                                    onChanged: (String? NewValue) {
                                      setState(() {
                                        if (colorIsCheck) {
                                          setState(() {
                                            dropdownvalue1 = NewValue!;
                                          });
                                          print('color1: ${dropdownvalue1}');
                                          mqttSubscribe(topic: 'Color1');
                                        }
                                      });
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(right: 10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                RichText(
                                  text: new TextSpan(
                                    children: [
                                      WidgetSpan(
                                        child: Icon(Icons.note_alt_outlined,
                                            size: 18,
                                            color: Color.fromARGB(
                                                255, 7, 148, 136)),
                                      ),
                                      TextSpan(
                                          text: 'Color Pos 2: ',
                                          style: TextStyle(
                                            color: (colorIsCheck)
                                                ? null
                                                : Colors.grey.withOpacity(0.5),
                                          )),
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.all(0),
                                  padding: EdgeInsets.all(0),
                                  child: DropdownButton(
                                    style: TextStyle(
                                        fontSize: 13,
                                        color: (dropdownvalue2 == 'Blue')
                                            ? Colors.blue
                                            : (dropdownvalue2 == 'Red')
                                                ? Colors.red
                                                : (dropdownvalue2 == 'Yellow')
                                                    ? Colors.yellow
                                                    : (dropdownvalue2 ==
                                                            'Black')
                                                        ? Colors.black
                                                        : (dropdownvalue2 ==
                                                                'Pink')
                                                            ? Colors.pink
                                                            : (dropdownvalue2 ==
                                                                    'Purple')
                                                                ? Colors.purple
                                                                : Colors.grey),
                                    value: dropdownvalue2,
                                    icon: Icon(Icons.keyboard_arrow_down),
                                    items: items.map((String items) {
                                      return DropdownMenuItem(
                                          value: items, child: Text(items));
                                    }).toList(),
                                    onChanged: (String? NewValue) {
                                      setState(() {
                                        if (colorIsCheck) {
                                          setState(() {
                                            dropdownvalue2 = NewValue!;
                                          });
                                          mqttSubscribe(topic: 'Color2');
                                        }
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
                                      WidgetSpan(
                                        child: Icon(Icons.note_alt_outlined,
                                            size: 18,
                                            color: Color.fromARGB(
                                                255, 7, 148, 136)),
                                      ),
                                      TextSpan(
                                          text: 'Color Pos 3: ',
                                          style: TextStyle(
                                            color: (colorIsCheck)
                                                ? null
                                                : Colors.grey.withOpacity(0.5),
                                          )),
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.all(0),
                                  padding: EdgeInsets.all(0),
                                  child: DropdownButton(
                                    style: TextStyle(
                                        fontSize: 13,
                                        color: (dropdownvalue3 == 'Blue')
                                            ? Colors.blue
                                            : (dropdownvalue3 == 'Red')
                                                ? Colors.red
                                                : (dropdownvalue3 == 'Yellow')
                                                    ? Colors.yellow
                                                    : (dropdownvalue3 ==
                                                            'Black')
                                                        ? Colors.black
                                                        : (dropdownvalue3 ==
                                                                'Pink')
                                                            ? Colors.pink
                                                            : (dropdownvalue3 ==
                                                                    'Purple')
                                                                ? Colors.purple
                                                                : Colors.grey),
                                    value: dropdownvalue3,
                                    icon: Icon(Icons.keyboard_arrow_down),
                                    items: items.map((String items) {
                                      return DropdownMenuItem(
                                          value: items, child: Text(items));
                                    }).toList(),
                                    onChanged: (String? NewValue) {
                                      if (colorIsCheck) {
                                        setState(() {
                                          dropdownvalue3 = NewValue!;
                                        });
                                        mqttSubscribe(topic: 'Color3');
                                      }
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
                flex: 6,
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
                    margin: EdgeInsets.all(4),
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
                                    thaotacFunction(context, 0);
                                    print("start");
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
                                    thaotacFunction(context, 1);
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
                                    thaotacFunction(context, 2);
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
                                        thaotacFunction(context, 3);
                                      } else {
                                        mqttSubscribe(topic: 'emer_off');
                                        thaotacFunction(context, 4);
                                      }
                                    }),
                              ]),
                        ),
                        Container(
                          width: 130,
                          height: 35,
                          margin: const EdgeInsets.only(left: 20.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text('Color:'),
                              Checkbox(
                                  checkColor: Colors.white,
                                  fillColor: MaterialStateProperty
                                      .resolveWith(getColor),
                                  value: colorIsCheck,
                                  onChanged: (value) {
                                    setState(() {
                                      colorIsCheck = value!;
                                      qrIsCheck = !value;
                                    });
                                    mqttSubscribe(
                                        topic: 'Mode_Color');
                                  }),
                            ],
                          ),
                        ),
                        Container(
                          width: 130,
                          height: 35,
                          margin: const EdgeInsets.only(left: 20.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text('QR:    '),
                              Checkbox(
                                  checkColor: Colors.white,
                                  fillColor: MaterialStateProperty
                                      .resolveWith(getColor),
                                  value: qrIsCheck,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      qrIsCheck = value!;
                                      colorIsCheck = !value;
                                    });
                                    mqttSubscribe(topic: 'Mode_QR');
                                  }),
                            ],
                          ),
                        ),
                        Container(
                            width: 130,
                            height: 35,
                            child: ElevatedButton(
                              child: Text(
                                'Setting Product',
                                style: TextStyle(color: Colors.white),
                              ),
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  side: BorderSide(
                                    color: Color.fromARGB(255, 11, 247, 137)
                                        .withOpacity(0.7),
                                    width: 2,
                                    style: BorderStyle.solid,
                                  ),
                                ),
                                primary: Color.fromARGB(255, 66, 66, 66),
                                onPrimary: Color.fromARGB(255, 0, 132, 240),
                              ),
                              onPressed: () {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) =>
                                        _buildPopupDialog(context));
                              },
                            )),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 7,
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

  Widget _buildPopupDialog(BuildContext context) {
    return new AlertDialog(
      title: Center(
        child: const Text(
          'Set Quantity Of Product',
          style: TextStyle(color: Color.fromARGB(255, 10, 202, 192)),
        ),
      ),
      content: SingleChildScrollView(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Container(
                width: double.infinity,
                height: 70,
                child: TextField(
                  controller: _product1,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    counterText: 'Current Value: ${SetSp1}',
                    label: Text('Product 1'),
                    hintText: 'Enter number of product 1',
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Container(
                width: double.infinity,
                height: 70,
                child: TextField(
                  controller: _product2,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    counterText: 'Current Value: ${SetSp2}',
                    label: Text('Product 2'),
                    hintText: 'Enter number of product 2',
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Container(
                width: double.infinity,
                height: 70,
                child: TextField(
                  controller: _product3,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    counterText: 'Current Value: ${SetSp3}',
                    label: Text('Product 3'),
                    hintText: 'Enter number of product 3',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      actions: <Widget>[
        new ElevatedButton(
          onPressed: () {
            if ((_product1.text != '') &&
                (_product2.text != '') &&
                (_product3.text != '')) {
              setState(() {
                SetSp1 = _product1.text;
                SetSp2 = _product2.text;
                SetSp3 = _product3.text;
              });
              mqttSubscribe(topic: 'QuantityProduct');
              Navigator.of(context).pop();
            } else {
              showDialog<void>(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text(
                        'Error!',
                        style: TextStyle(color: Colors.red),
                      ),
                      content: Text('Please enter number of product!'),
                      actions: [
                        ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text('Ok'),
                        )
                      ],
                    );
                  });
            }
          },
          child: Text(
            'Save',
            style: TextStyle(
              color: Colors.white,
              fontSize: 15,
            ),
          ),
        ),
        new ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('Cancel'),
            style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(255, 124, 122, 122))),
      ],
    );
  }
}
