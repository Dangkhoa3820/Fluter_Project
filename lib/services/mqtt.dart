import 'dart:developer';
import 'package:flutter_application/services/variables.dart';
import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_server_client.dart';

Future<Stream<List<MqttReceivedMessage<MqttMessage>>>?> mqttSubscribe(
    {required String topic}) async {
  final client = MqttServerClient('broker.hivemq.com', 'MQTTBroker');
  client.port = 1883;
  client.connect();
  client.keepAlivePeriod = 60;

  try {
    await client.connect();
  } on NoConnectionException catch (e) {
    log(e.toString());
  }

  // let's connect to mqtt broker
  if (client.connectionStatus!.state == MqttConnectionState.connected) {
    //subcribe
    client.subscribe('start', MqttQos.atMostOnce);
    client.subscribe('stop', MqttQos.atMostOnce);
    client.subscribe('reset', MqttQos.atMostOnce);
    client.subscribe('emer_on', MqttQos.atMostOnce);
    client.subscribe('emer_off', MqttQos.atMostOnce);
    client.subscribe('controlplc', MqttQos.atMostOnce);

    if (topic == 'start') {
      final builder1 = MqttClientPayloadBuilder();
      builder1.addString('1');
      client.publishMessage(
          'controlplc', MqttQos.atLeastOnce, builder1.payload!);
    } else if (topic == 'stop') {
      final builder2 = MqttClientPayloadBuilder();
      builder2.addString('2');
      client.publishMessage(
          'controlplc', MqttQos.atLeastOnce, builder2.payload!);
    } else if (topic == 'reset') {
      final builder3 = MqttClientPayloadBuilder();
      builder3.addString('3');
      client.publishMessage(
          'controlplc', MqttQos.atLeastOnce, builder3.payload!);
    } else if (topic == 'emer_on') {
      final builder4 = MqttClientPayloadBuilder();
      builder4.addString('4');
      client.publishMessage(
          'controlplc', MqttQos.atLeastOnce, builder4.payload!);
    } else if (topic == 'emer_off') {
      final builder5 = MqttClientPayloadBuilder();
      builder5.addString('5');
      client.publishMessage(
          'controlplc', MqttQos.atLeastOnce, builder5.payload!);
    } else if (topic == 'man') {
      final builder6 = MqttClientPayloadBuilder();
      builder6.addString('6');
      client.publishMessage(
          'controlplc', MqttQos.atLeastOnce, builder6.payload!);
    } else if (topic == 'auto') {
      final builder7 = MqttClientPayloadBuilder();
      builder7.addString('7');
      client.publishMessage(
          'controlplc', MqttQos.atLeastOnce, builder7.payload!);
    } else if (topic == 'motor_on') {
      final builder8 = MqttClientPayloadBuilder();
      builder8.addString('8');
      client.publishMessage(
          'controlplc', MqttQos.atLeastOnce, builder8.payload!);
    } else if (topic == 'motor_off') {
      final builder9 = MqttClientPayloadBuilder();
      builder9.addString('9');
      client.publishMessage(
          'controlplc', MqttQos.atLeastOnce, builder9.payload!);
    } else if (topic == 'push_out') {
      final builder10 = MqttClientPayloadBuilder();
      builder10.addString('10');
      client.publishMessage(
          'controlplc', MqttQos.atLeastOnce, builder10.payload!);
    } else if (topic == 'push_back') {
      final builder11 = MqttClientPayloadBuilder();
      builder11.addString('11');
      client.publishMessage(
          'controlplc', MqttQos.atLeastOnce, builder11.payload!);
    } else if (topic == 'lift_up') {
      final builder13 = MqttClientPayloadBuilder();
      builder13.addString('13');
      client.publishMessage(
          'controlplc', MqttQos.atLeastOnce, builder13.payload!);
    } else if (topic == 'lift_down') {
      final builder12 = MqttClientPayloadBuilder();
      builder12.addString('12');
      client.publishMessage(
          'controlplc', MqttQos.atLeastOnce, builder12.payload!);
    } else if (topic == 'hold_on') {
      final builder14 = MqttClientPayloadBuilder();
      builder14.addString('14');
      client.publishMessage(
          'controlplc', MqttQos.atLeastOnce, builder14.payload!);
    } else if (topic == 'hold_off') {
      final builder15 = MqttClientPayloadBuilder();
      builder15.addString('15');
      client.publishMessage(
          'controlplc', MqttQos.atLeastOnce, builder15.payload!);
    } else if (topic == 'go_out') {
      final builder16 = MqttClientPayloadBuilder();
      builder16.addString('16');
      client.publishMessage(
          'controlplc', MqttQos.atLeastOnce, builder16.payload!);
    } else if (topic == 'go_back') {
      final builder17 = MqttClientPayloadBuilder();
      builder17.addString('17');
      client.publishMessage(
          'controlplc', MqttQos.atLeastOnce, builder17.payload!);
    }
    client.updates!.listen((List<MqttReceivedMessage<MqttMessage?>>? c) {
      final recMess = c![0].payload as MqttPublishMessage;
      final payload =
          MqttPublishPayload.bytesToStringAsString(recMess.payload.message);
      log(payload + ' --> topic: ${c[0].topic}');
    });
  } else {
    return null;
  }
}
