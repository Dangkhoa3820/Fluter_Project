import 'package:flutter/material.dart';
import 'package:mqtt_client/mqtt_server_client.dart';
import '../server/mqtt.dart';
import '../NavBar.dart';
import '../server/variables.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

final client = MqttServerClient('broker.hivemq.com', 'clientIdentifier1234');

class _MyHomePageState extends State<MyHomePage> {
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
      body: Container(
        width: 350,
        height: 200,
        margin: EdgeInsets.all(20),
        padding: EdgeInsets.zero,
        decoration: BoxDecoration(
            border: Border.all(
                width: 1, color: Color.fromARGB(255, 206, 194, 194))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Control Panel',
              style: TextStyle(
                  fontSize: 20, color: Color.fromARGB(255, 173, 118, 35)),
              textAlign: TextAlign.center,
            ),
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                    child: Text("Start"),
                    onPressed: () {
                      mqttSubscribe(topic: 'start');
                    }),
                ElevatedButton(
                  child: Text("Stop"),
                  onPressed: () {
                    mqttSubscribe(topic: 'stop');
                  },
                ),
                ElevatedButton(
                  child: Text("Reset"),
                  onPressed: () {
                    mqttSubscribe(topic: 'reset');
                  },
                ),
                ElevatedButton(
                  child: Text("Emergency"),
                  onPressed: () {
                    mqttSubscribe(topic: 'emer');
                  },
                ),
              ],
            ),
            new Column(
              children: [
                new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: 70,
                      height: 30,
                      margin: EdgeInsets.all(5),
                      padding: EdgeInsets.zero,
                      decoration: BoxDecoration(
                          border: Border.all(
                              width: 1.5, color: Color.fromARGB(255, 223, 113, 23)),
                          color: Color.fromARGB(255, 185, 191, 196)),
                      child: Center(
                        child: Text(SoluongSp1,
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                    Container(
                      width: 70,
                      height: 30,
                      margin: EdgeInsets.all(5),
                      padding: EdgeInsets.zero,
                      decoration: BoxDecoration(
                          border: Border.all(
                              width: 1.5, color: Color.fromARGB(255, 223, 113, 23)),
                          color: Color.fromARGB(255, 185, 191, 196)),
                      child: Center(
                        child: Text(SoluongSp2,
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                    Container(
                      width: 70,
                      height: 30,
                      margin: EdgeInsets.all(5),
                      padding: EdgeInsets.zero,
                      decoration: BoxDecoration(
                          border: Border.all(
                              width: 1.5, color: Color.fromARGB(255, 223, 113, 23)),
                          color: Color.fromARGB(255, 185, 191, 196)),
                      child: Center(
                        child: Text(SoluongSp3,
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
  
}
