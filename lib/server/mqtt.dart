import 'dart:developer';
import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_server_client.dart';

Future<Stream<List<MqttReceivedMessage<MqttMessage>>>?> mqttSubscribe(
    {required String topic}) async {
  final client = MqttServerClient('192.168.1.6', 'MQTTConnect');
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
    client.subscribe('emer', MqttQos.atMostOnce);
    client.subscribe('controlplc', MqttQos.atMostOnce);

    if (topic == 'start') {
      final builder1 = MqttClientPayloadBuilder();
      builder1.addString('1');
      client.publishMessage('controlplc', MqttQos.atLeastOnce, builder1.payload!);
    } else if (topic == 'stop') {
      final builder2 = MqttClientPayloadBuilder();
      builder2.addString('2');
      client.publishMessage('controlplc', MqttQos.atLeastOnce, builder2.payload!);
    }
    else if (topic == 'reset') {
      final builder3 = MqttClientPayloadBuilder();
      builder3.addString('3');
      client.publishMessage('controlplc', MqttQos.atLeastOnce, builder3.payload!);
    }
    else if (topic == 'emer') {
      final builder4 = MqttClientPayloadBuilder();
      builder4.addString('4');
      client.publishMessage('controlplc', MqttQos.atLeastOnce, builder4.payload!);
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
