import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_application/pages/Login_page.dart';
import 'package:flutter_application/services/MongoDB.dart';
import 'package:flutter_application/services/variables.dart';
import './pages/Home_page.dart';
import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_server_client.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await mongoDB.connect();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // MQTT Broker
  mqttConnect() async {
    final client = MqttServerClient('broker.hivemq.com', 'MQTTBroker');
    client.port = 1883;
    client.keepAlivePeriod = 60;
    client.connect();
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

    client.subscribe('Sp1', MqttQos.atMostOnce);
    client.subscribe('Sp2', MqttQos.atMostOnce);
    client.subscribe('Sp3', MqttQos.atMostOnce);

    client.subscribe('Run', MqttQos.atMostOnce);
     //client.subscribe('dulieumain', MqttQos.atMostOnce);

    client.updates!.listen((dynamic message) {
      final MqttPublishMessage recMess = message[0].payload;
      var payload =
          MqttPublishPayload.bytesToStringAsString(recMess.payload.message);
      log(payload + ' --> topic: ${message[0].topic}');

      if (message[0].topic == 'SoluongSP1') {
        setState(() {
          SoluongSp1 = payload;
          Pos1 = false;
        });
      } else if (message[0].topic == 'SoluongSP2') {
        setState(() {
          SoluongSp2 = payload;
          Pos2 = false;
        });
      } else if (message[0].topic == 'SoluongSP3') {
        setState(() {
          SoluongSp3 = payload;
          Pos3 = false;
        });
      } else if ((message[0].topic == 'Sp1') && (Run)) {
        setState(() {
          Pos1 = true;
        });
      } else if ((message[0].topic == 'Sp2') && (Run)) {
        setState(() {
          Pos2 = true;
        });
      } else if ((message[0].topic == 'Sp3') && (Run)) {
        setState(() {
          Pos3 = true;
        });
      } else if (message[0].topic == 'Run') {
        setState(() {
          Pos1 = Pos2 = Pos3 = false;
          Run = true;
        });
      }
    });
  }

  // MongoDB

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
