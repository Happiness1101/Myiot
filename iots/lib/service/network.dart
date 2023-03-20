import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:intl/intl.dart';
import 'package:iots/class/myclass.dart';
import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_server_client.dart';
// import 'package:mqtt_client/mqtt_client.dart' as mqtt;
import 'package:http/http.dart' as http;
import '../model/room1Model.dart';

String username = "mqttmos";
String password = "mymqttmos";

class Network {
  Stream<List<MqttReceivedMessage<MqttMessage>>> mqttStream(topic) async* {
    String? s;
    // final client = MqttServerClient(MyClass.hostMqtt(), '1883');
    final client = MqttServerClient.withPort(MyClass.hostMqtt(),'willtopic', 1883);
    client.logging(on: true);
    client.keepAlivePeriod = 60;
    // client.onDisconnected = onDisconnected;
    // client.onConnected = onConnected;
    // client.pongCallback = pong;

    final connMess = MqttConnectMessage()
        .withClientIdentifier('dart_client')
        .withWillTopic('willtopic')
        .withWillMessage('My Will message')
        .startClean()
        .withWillQos(MqttQos.atLeastOnce);
    print('client connecting....');
    client.connectionMessage = connMess;
    try {
      await client.connect();
      client.subscribe(topic, MqttQos.atMostOnce);
      print('connected');
    } on NoConnectionException catch (e) {
      print('client exception - $e');
      client.disconnect();
    } on SocketException catch (e) {
      print('socket exception - $e');
      client.disconnect();
    } catch (e) {
      print(e);
    }

    // if (client.connectionStatus!.state == MqttConnectionState.connected) {
    //   print('client connected!!');
    //   client.updates!.listen((List<MqttReceivedMessage<MqttMessage?>>? c) {
    //     final recMess = c![0].payload as MqttPublishMessage;
    //     final pt =
    //         MqttPublishPayload.bytesToStringAsString(recMess.payload.message);
    //     print('Received message: topic is ${c[0].topic}, payload is $pt');
    //   });
    // } else {
    //   print(
    //       'client connection failed - disconnecting, status is ${client.connectionStatus}');
    //   client.disconnect();
    //   exit(-1);
    // }
    
    yield* client.updates!;
    // MqttServerClient.withPort(MyClass.hostdomain(), '', MyClass.port());
    // final connMess = MqttConnectMessage()
    //     .withClientIdentifier('dart_client')
    //     .withWillTopic('willtopic')
    //     .withWillMessage('My Will message')
    //     .startClean()
    //     .withWillQos(MqttQos.atLeastOnce);
    // print('client connecting....');
    // client.connectionMessage = connMess;

    // if (client.connectionStatus?.state != MqttConnectionState.connected) {
    //   try {
    //     print('connected...');
    //     await client.connect();
    //     print("MQTTClientWrapper::GOT A NEW MESSAGE ");
    //     client.subscribe(topic, MqttQos.atMostOnce);
    //   } catch (e) {
    //     print("catch...");
    //     print(e.toString());
    //   }
    // } else {
    //   print('MQTT Server already connected ');
    // }

    // client.updates!.listen((List<MqttReceivedMessage<MqttMessage>> c) {
    //   print('object');

    //   final recMess = c[0].payload as MqttPublishMessage;
    //   s = String.fromCharCodes(recMess.payload.message);
    //   String message =
    //       MqttPublishPayload.bytesToStringAsString(recMess.payload.message);
    //   String decodeMessage = Utf8Decoder().convert(message.codeUnits);
    //   print(jsonDecode(jsonEncode(decodeMessage)));
    // });
    // yield* client.updates!;
  }

  static Future<List<room1Model>> fetchRoom1(context) async {
    final url = Uri.parse('${MyClass.hostapp()}/dbex/connect_flutter.php');
    Map<String, String> headers = {
      'Content-Type': 'application/json; charset=UTF-8',
      // "Authorization": "Bearer " + token
    };
    // print('adfasdf');
    // String jsons = json.encode(data);
    //  print(jsons);
    final response = await http.get(
      url,
      headers: headers,
    );
    print(response.statusCode);
    print('fetchMsg');
    print(response.body);
    if (response.statusCode == 200) {
      final List jsonResponse = json.decode(response.body);
      List<room1Model> result =
          jsonResponse.map((i) => room1Model.fromJson(i)).toList();
      return result;
    } else {
      // Navigator.pushAndRemoveUntil(
      //     context,
      //     MaterialPageRoute(
      //         builder: (BuildContext context) => Pins(gettitle: 'pinCode')),
      //     (Route<dynamic> route) => false);
      throw Exception('Failed');
    }
  }

  // void onDisconnected() {
  //   print('OnDisconnected client callback - Client disconnection');
  //   if (client.connectionStatus!.disconnectionOrigin ==
  //       MqttDisconnectionOrigin.solicited) {
  //     print('OnDisconnected callback is solicited, this is correct');
  //   }
  //   exit(-1);
  // }

  /// The successful connect callback
  void onConnected() {
    print('OnConnected client callback - Client connection was sucessful');
  }

  /// Pong callback
  void pong() {
    print('Ping response client callback invoked');
  }
}
