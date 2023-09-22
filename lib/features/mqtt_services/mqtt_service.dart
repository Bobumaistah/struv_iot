// ignore_for_file: avoid_print

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_server_client.dart';

class MQTTClientManager with ChangeNotifier {
  final ValueNotifier<double> sortWeight = ValueNotifier<double>(0);
  final ValueNotifier<double> dryenWeight = ValueNotifier<double>(0);
  final ValueNotifier<double> dryenTemp = ValueNotifier<double>(0);
  final ValueNotifier<String> reactorStatus = ValueNotifier<String>("OFF");

  MqttServerClient client = MqttServerClient.withPort(
    '40.76.142.54',
    'mobile_client',
    1883,
  );

  Future<int> connect() async {
    client.logging(on: true);
    client.keepAlivePeriod = 60;
    client.onConnected = onConnected;
    client.onDisconnected = onDisconnected;
    client.onSubscribed = onSubscribed;
    client.pongCallback = pong;

    try {
      await client.connect("bobmeister", "Stella01");
    } on NoConnectionException catch (e) {
      print('MQTTClient::Client exception - $e');
      client.disconnect();
    } on SocketException catch (e) {
      print('MQTTClient::Socket exception - $e');
      client.disconnect();
    }

    const String topicSW = 'penyaring/berat';
    const String topicDW = 'pengering/berat';
    const String topicDT = 'pengering/suhu';
    const String topicRS = 'reaktor/status';

    client.subscribe(topicSW, MqttQos.atMostOnce);
    client.subscribe(topicDW, MqttQos.atMostOnce);
    client.subscribe(topicDT, MqttQos.atMostOnce);
    client.subscribe(topicRS, MqttQos.atMostOnce);

    client.updates?.listen((List<MqttReceivedMessage<MqttMessage?>>? c) {
      final recMess = c![0].payload as MqttPublishMessage;

      final pt = MqttPublishPayload.bytesToStringAsString(
        recMess.payload.message,
      );

      if (c[0].topic == topicSW) {
        sortWeight.value = double.parse(pt);
        notifyListeners();
      }

      if (c[0].topic == topicDW) {
        dryenWeight.value = double.parse(pt);
        notifyListeners();
      }

      if (c[0].topic == topicDT) {
        dryenTemp.value = double.parse(pt);
        notifyListeners();
      }

      if (c[0].topic == topicRS) {
        reactorStatus.value = pt;
        notifyListeners();
      }
    });

    return 0;
  }

  void disconnect() {
    client.disconnect();
  }

  void onConnected() {
    print('MQTTClient::Connected');
  }

  void onDisconnected() {
    print('MQTTClient::Disconnected');
  }

  void onSubscribed(String topic) {
    print('MQTTClient::Subscribed to topic: $topic');
  }

  void pong() {
    print('MQTTClient::Ping response received');
  }
}
