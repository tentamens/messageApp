import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:messaging_app/globals/crypto.dart';
import 'package:messaging_app/globals/storedData.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

WebSocketChannel? channel;

class ApiHandler {
  Future<bool> sendMessagePublic(String message) async {
    final myPublicKey = Crypto().getPublic;
    final content = {
      "text": message,
      "pubKey": myPublicKey,
      "name": StoredData().getName,
      "userId": Crypto().getUserId
    };
    final response = await http.post(
        Uri.parse("http://10.0.0.19:8000/api/newpub"),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(content));
    if (response.statusCode != 200) {
      return false;
    }
    return true;
  }
}
