import 'dart:developer';
import 'dart:html';
import 'package:flutter/material.dart';
import 'package:flutter_application/server/variables.dart';
import './pages/Home_page.dart';
import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_server_client.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);
  @override
  _MyAppState createState() => _MyAppState();
}

// class _MyAppState

class _MyAppState extends State<MyApp> {
  // MQTT Broker
  mqttConnect() async {
    final client = MqttServerClient('192.168.1.6', 'clientIdentifier1234');
    client.port = 1883;
    client.keepAlivePeriod = 60;
    client.onAutoReconnect = () => true;
    client.autoReconnect = true;
    try {
      await client.connect();
    } on NoConnectionException catch (e) {
      log(e.toString());
    }

    client.subscribe('SoluongSP1', MqttQos.atMostOnce);
    client.subscribe('SoluongSP2', MqttQos.atMostOnce);
    client.subscribe('SoluongSP3', MqttQos.atMostOnce);

    client.updates!.listen((dynamic message) {
      final MqttPublishMessage recMess = message[0].payload;
      var payload =
          MqttPublishPayload.bytesToStringAsString(recMess.payload.message);
      log(payload + ' --> topic: ${message[0].topic}');
      if (message[0].topic == 'SoluongSP1') {
        setState(() {
          SoluongSp1 = payload;
        });
      } else if (message[0].topic == 'SoluongSP2') {
        setState(() {
          SoluongSp2 = payload;
        });
      } else if (message[0].topic == 'SoluongSP3') {
        setState(() {
          SoluongSp3 = payload;
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    mqttConnect();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Color(0xFF212332),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}
