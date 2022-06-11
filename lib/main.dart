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
import 'dart:async';

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
    final client = MqttServerClient('broker.hivemq.com', 'BrokerMQTT');
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

    // topic publish
    client.subscribe('controlplc', MqttQos.atMostOnce);
    client.subscribe('dulieumain', MqttQos.atMostOnce);
    client.subscribe('SettingSLSP1_App', MqttQos.atMostOnce);
    client.subscribe('SettingSLSP2_App', MqttQos.atMostOnce);
    client.subscribe('SettingSLSP3_App', MqttQos.atMostOnce);

    const oneSec = Duration(seconds: 1);
    Timer.periodic(oneSec, (Timer t) {
      if (Start) {
        final builder1 = MqttClientPayloadBuilder();
        builder1.addString('1');
        client.publishMessage(
            'controlplc', MqttQos.atLeastOnce, builder1.payload!);
        setState(() {
          Start = false;
        });
      }
      else if (Stop) {
        final builder1 = MqttClientPayloadBuilder();
        builder1.addString('2');
        client.publishMessage(
            'controlplc', MqttQos.atLeastOnce, builder1.payload!);
        setState(() {
          Stop = false;
        });
      }
      else if (Reset) {
      final builder3 = MqttClientPayloadBuilder();
      builder3.addString('3');
      client.publishMessage(
          'controlplc', MqttQos.atLeastOnce, builder3.payload!);
      setState(() {
          Reset = false;
        });
    } else if (Emer_on) {
      final builder4 = MqttClientPayloadBuilder();
      builder4.addString('4');
      client.publishMessage(
          'controlplc', MqttQos.atLeastOnce, builder4.payload!);
      setState(() {
          Emer_on = false;
        });
    } else if (Emer_off) {
      final builder5 = MqttClientPayloadBuilder();
      builder5.addString('5');
      client.publishMessage(
          'controlplc', MqttQos.atLeastOnce, builder5.payload!);
      setState(() {
          Emer_off = false;
        });
    } else if (Man_mode) {
      final builder6 = MqttClientPayloadBuilder();
      builder6.addString('6');
      client.publishMessage(
          'controlplc', MqttQos.atLeastOnce, builder6.payload!);
      setState(() {
          Man_mode = false;
        });
    } else if (Auto_mode) {
      final builder7 = MqttClientPayloadBuilder();
      builder7.addString('7');
      client.publishMessage(
          'controlplc', MqttQos.atLeastOnce, builder7.payload!);
      setState(() {
          Auto_mode = false;
        });
    } else if (Motor_on) {
      final builder8 = MqttClientPayloadBuilder();
      builder8.addString('8');
      client.publishMessage(
          'controlplc', MqttQos.atLeastOnce, builder8.payload!);
      setState(() {
          Motor_on = false;
        });
    } else if (Motor_off) {
      final builder9 = MqttClientPayloadBuilder();
      builder9.addString('9');
      client.publishMessage(
          'controlplc', MqttQos.atLeastOnce, builder9.payload!);
      setState(() {
          Motor_off = false;
        });
    } else if (Push_out) {
      final builder10 = MqttClientPayloadBuilder();
      builder10.addString('10');
      client.publishMessage(
          'controlplc', MqttQos.atLeastOnce, builder10.payload!);
      setState(() {
          Push_out = false;
        });
    } else if (Push_back) {
      final builder11 = MqttClientPayloadBuilder();
      builder11.addString('11');
      client.publishMessage(
          'controlplc', MqttQos.atLeastOnce, builder11.payload!);
      setState(() {
          Push_back = false;
        });
    } else if (Lift_up) {
      final builder13 = MqttClientPayloadBuilder();
      builder13.addString('13');
      client.publishMessage(
          'controlplc', MqttQos.atLeastOnce, builder13.payload!);
      setState(() {
          Lift_up = false;
        });
    } else if (Lift_down) {
      final builder12 = MqttClientPayloadBuilder();
      builder12.addString('12');
      client.publishMessage(
          'controlplc', MqttQos.atLeastOnce, builder12.payload!);
      setState(() {
          Lift_down = false;
        });
    } else if (Hold_on) {
      final builder14 = MqttClientPayloadBuilder();
      builder14.addString('14');
      client.publishMessage(
          'controlplc', MqttQos.atLeastOnce, builder14.payload!);
      setState(() {
          Hold_on = false;
        });
    } else if (Hold_off) {
      final builder15 = MqttClientPayloadBuilder();
      builder15.addString('15');
      client.publishMessage(
          'controlplc', MqttQos.atLeastOnce, builder15.payload!);
      setState(() {
          Hold_off = false;
        });
    } else if (Go_out) {
      final builder16 = MqttClientPayloadBuilder();
      builder16.addString('16');
      client.publishMessage(
          'controlplc', MqttQos.atLeastOnce, builder16.payload!);
      setState(() {
          Go_out = false;
        });
    } else if (Go_back) {
      final builder17 = MqttClientPayloadBuilder();
      builder17.addString('17');
      client.publishMessage(
          'controlplc', MqttQos.atLeastOnce, builder17.payload!);
      setState(() {
          Go_back = false;
        });
    } else if (Color_1) {
      final builder18 = MqttClientPayloadBuilder();
      if (dropdownvalue1 == 'Red') {
        builder18.addString('table11');
      } else if (dropdownvalue1 == 'Yellow') {
        builder18.addString('table12');
      } else if (dropdownvalue1 == 'Blue') {
        builder18.addString('table13');
      } else if (dropdownvalue1 == 'Purple') {
        builder18.addString('table14');
      } else if (dropdownvalue1 == 'Black') {
        builder18.addString('table7');
      } else if (dropdownvalue1 == 'Pink') {
        builder18.addString('table16');
      }
      client.publishMessage(
          'dulieumain', MqttQos.atLeastOnce, builder18.payload!);
      setState(() {
          Color_1 = false;
        });
    } else if (Color_2) {
      final builder19 = MqttClientPayloadBuilder();
      if (dropdownvalue2 == 'Red') {
        builder19.addString('table21');
      } else if (dropdownvalue2 == 'Yellow') {
        builder19.addString('table22');
      } else if (dropdownvalue2 == 'Blue') {
        builder19.addString('table23');
      } else if (dropdownvalue2 == 'Purple') {
        builder19.addString('table14');
      } else if (dropdownvalue2 == 'Black') {
        builder19.addString('table27');
      } else if (dropdownvalue2 == 'Pink') {
        builder19.addString('table26');
      }
      client.publishMessage(
          'dulieumain', MqttQos.atLeastOnce, builder19.payload!);
      setState(() {
          Color_2 = false;
        });
    } else if (Color_3) {
      final builder20 = MqttClientPayloadBuilder();
      if (dropdownvalue3 == 'Red') {
        builder20.addString('table31');
      } else if (dropdownvalue3 == 'Yellow') {
        builder20.addString('table32');
      } else if (dropdownvalue3 == 'Blue') {
        builder20.addString('table33');
      } else if (dropdownvalue3 == 'Purple') {
        builder20.addString('table34');
      } else if (dropdownvalue3 == 'Black') {
        builder20.addString('table37');
      } else if (dropdownvalue3 == 'Pink') {
        builder20.addString('table36');
      }
      client.publishMessage(
          'dulieumain', MqttQos.atLeastOnce, builder20.payload!);
      setState(() {
          Color_3 = false;
        });
    } else if (Mode_color) {
      final builder21 = MqttClientPayloadBuilder();
      builder21.addString('Colorcheck');
      client.publishMessage(
          'dulieumain', MqttQos.atLeastOnce, builder21.payload!);
      setState(() {
          Mode_color = false;
        });
    } else if (Mode_qr) {
      final builder22 = MqttClientPayloadBuilder();
      builder22.addString('QRcheck');
      client.publishMessage(
          'dulieumain', MqttQos.atLeastOnce, builder22.payload!);
      setState(() {
          Mode_qr = false;
        });
    } else if (Quantity_product) {
      final builder23 = MqttClientPayloadBuilder();
      final builder24 = MqttClientPayloadBuilder();
      final builder25 = MqttClientPayloadBuilder();
      builder23.addString('${SetSp1}');
      builder24.addString('${SetSp2}');
      builder25.addString('${SetSp3}');
      client.publishMessage(
          'SettingSLSP1_App', MqttQos.atLeastOnce, builder23.payload!);
      client.publishMessage(
          'SettingSLSP2_App', MqttQos.atLeastOnce, builder24.payload!);
      client.publishMessage(
          'SettingSLSP3_App', MqttQos.atLeastOnce, builder25.payload!);
      setState(() {
          Quantity_product = false;
        });
    }
    // subcribe
  
  });


    //Subcribe
    client.updates!.listen((dynamic message) {
      final MqttPublishMessage recMess = message[0].payload;
      var payload =
          MqttPublishPayload.bytesToStringAsString(recMess.payload.message);
      log(payload + ' --> topic: ${message[0].topic}');

      // Subcribe
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
