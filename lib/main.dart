import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_application/pages/Login_page.dart';
import 'package:flutter_application/services/MongoDB.dart';
import 'package:flutter_application/services/mqtt.dart';
import 'package:flutter_application/services/thaotac.dart';
import 'package:flutter_application/services/variables.dart';
import './pages/Home_page.dart';
import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_server_client.dart';

void main() async {
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
      inspect(client);
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
    client.subscribe('dulieumain', MqttQos.atMostOnce);
    client.subscribe('auto_man', MqttQos.atMostOnce);

    client.subscribe('color_Sp1', MqttQos.atMostOnce);
    client.subscribe('color_Sp2', MqttQos.atMostOnce);
    client.subscribe('color_Sp3', MqttQos.atMostOnce);

    client.subscribe('SettingSLSP1_Web', MqttQos.atMostOnce);
    client.subscribe('SettingSLSP2_Web', MqttQos.atMostOnce);
    client.subscribe('SettingSLSP3_Web', MqttQos.atMostOnce);

    client.subscribe('Alarm-sp1day', MqttQos.atMostOnce);
    client.subscribe('Alarm-sp2day', MqttQos.atMostOnce);
    client.subscribe('Alarm-sp3day', MqttQos.atMostOnce);
    client.subscribe('Alarm_kosp', MqttQos.atMostOnce);
    client.subscribe('Alarm_khongnhandienmau', MqttQos.atMostOnce);
    client.subscribe('Alarm_NotReady', MqttQos.atMostOnce);

    client.updates!.listen((dynamic message) {
      final MqttPublishMessage recMess = message[0].payload;
      var payload =
          MqttPublishPayload.bytesToStringAsString(recMess.payload.message);
      log(payload + ' --> topic: ${message[0].topic}');

      if (message[0].topic == 'SoluongSP1') {
        setState(() {
          SoluongSp1 = payload;
          Pos1 = false;
          camera = 'null';
        });
        QuantityFunction();
      } else if (message[0].topic == 'SoluongSP2') {
        setState(() {
          SoluongSp2 = payload;
          Pos2 = false;
          camera = 'null';
        });
        QuantityFunction();
      } else if (message[0].topic == 'SoluongSP3') {
        setState(() {
          SoluongSp3 = payload;
          Pos3 = false;
          camera = 'null';
        });
        QuantityFunction();
      } else if ((message[0].topic == 'Sp1') && (Run)) {
        setState(() {
          Pos1 = true;
          if (colorIsCheck) camera = dropdownvalue1;
        });
      } else if ((message[0].topic == 'Sp2') && (Run)) {
        setState(() {
          Pos2 = true;
          if (colorIsCheck) camera = dropdownvalue2;
        });
      } else if ((message[0].topic == 'Sp3') && (Run)) {
        setState(() {
          Pos3 = true;
          if (colorIsCheck) camera = dropdownvalue3;
        });
      } else if (message[0].topic == 'Run') {
        setState(() {
          Pos1 = Pos2 = Pos3 = false;
          if (payload == 'true') {
            Run = true;
          } else {
            Run = false;
          }
        });
      } else if (message[0].topic == 'color_Sp1') {
        if (payload == '1') {
          setState(() {
            dropdownvalue1 = 'Red';
          });
        } else if (payload == '2') {
          setState(() {
            dropdownvalue1 = 'Yellow';
          });
        } else if (payload == '3') {
          setState(() {
            dropdownvalue1 = 'Blue';
          });
        }
      } else if (message[0].topic == 'color_Sp2') {
        if (payload == '1') {
          setState(() {
            dropdownvalue2 = 'Red';
          });
        } else if (payload == '2') {
          setState(() {
            dropdownvalue2 = 'Yellow';
          });
        } else if (payload == '3') {
          setState(() {
            dropdownvalue2 = 'Blue';
          });
        }
      } else if (message[0].topic == 'color_Sp3') {
        if (payload == '1') {
          setState(() {
            dropdownvalue3 = 'Red';
          });
        } else if (payload == '2') {
          setState(() {
            dropdownvalue3 = 'Yellow';
          });
        } else if (payload == '3') {
          setState(() {
            dropdownvalue3 = 'Blue';
          });
        }
      } else if (message[0].topic == 'SettingSLSP1_Web') {
        setState(() {
          SetSp1 = payload;
        });
      } else if (message[0].topic == 'SettingSLSP2_Web') {
        setState(() {
          SetSp2 = payload;
        });
      } else if (message[0].topic == 'SettingSLSP3_Web') {
        setState(() {
          SetSp3 = payload;
        });
      } else if (message[0].topic == 'dulieumain') {
        if (payload == 'Colorcheck') {
          setState(() {
            colorIsCheck = true;
            qrIsCheck = false;
          });
        } else if (payload == 'QRcheck') {
          setState(() {
            colorIsCheck = false;
            qrIsCheck = true;
          });
        }
      } else if (message[0].topic == 'Alarm-sp1day') {
        setState(() {
          alarm = true;
          name = 'Product 1';
          detail = 'Full';
        });
        AlarmFunction();
      } else if (message[0].topic == 'Alarm-sp2day') {
        setState(() {
          alarm = true;
          name = 'Product 2';
          detail = 'Full';
        });
        AlarmFunction();
      } else if (message[0].topic == 'Alarm-sp3day') {
        setState(() {
          alarm = true;
          name = 'Product 3';
          detail = 'Full';
        });
        AlarmFunction();
      } else if ((message[0].topic == 'Alarm_kosp') && (Run)) {
        setState(() {
          alarm = true;
          name = 'Conveyor';
          detail = 'Not Product';
        });
        AlarmFunction();
      } else if (message[0].topic == 'Alarm_khongnhandienmau') {
        setState(() {
          alarm = true;
          name = 'Product';
          detail = 'Undefine';
        });
        AlarmFunction();
      } else if (message[0].topic == 'Alarm_NotReady') {
        setState(() {
          alarm = true;
          name = 'Not Ready';
          detail = 'Please Press Button Reset';
        });
        AlarmFunction();
      } else if (message[0].topic == 'auto_man') {
        if (payload == 'true') {
          setState(() {
            Auto = true;
            Man = false;
          });
        } else {
          setState(() {
            Auto = false;
            Man = true;
          });
        }
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
      home: LoginPage(),
    );
  }
}
